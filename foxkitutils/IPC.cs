﻿using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.IO.Pipes;
using System.Linq;
using System.Text;
using System.Threading;// WaitForFile
using UnityEngine;

namespace IHExt {
    public class IPC {
        string serverInName = "mgsv_in";
        string serverOutName = "mgsv_out";
        public string ServerInName {
            set {
                serverInName = value;
            }
        }
        public string ServerOutName {
            set {
                serverOutName = value;
            }
        }

        private ConcurrentQueue<string> extToMgsvCmdQueue = new ConcurrentQueue<string>();
        private ConcurrentQueue<string> mgsvToExtCmdQueue = new ConcurrentQueue<string>();

        private Dictionary<string, Action<string[]>> commands = new Dictionary<string, Action<string[]>>();

        //LEGACY: IHExt text IPC
        private int extToMgsvCurrent = 0;//tex current/max, last command to be written out
        private int extToMgsvComplete = 0;//tex min/confirmed executed by mgsv, only commands above this should be written out
        private int mgsvToExtComplete = 0;//tex min/confimed executed by ext


        private long extSession = 0;
        private long mgsvSession = 0;

        BackgroundWorker serverInWorker = null;
        BackgroundWorker serverOutWorker = null;

        //tex control whether command is executed on pipe read or added to a queue so some other thread can call ProcessCommandQueue to process
        bool useMgsvToExtCmdQueue = false;
        public bool UseMgsvToExtCmdQueue {
            set {
                useMgsvToExtCmdQueue = value;
            }
        }//UseMgsvToExtCmdQueue

        public long ExtSession {
            set {
                extSession = value;
            }
        }//ExtSession

        public IPC(long _extSession = 0, string _serverInName = null, string _serverOutName = null) {
            extSession = _extSession;

            if (_serverInName != null) {
                serverInName = _serverInName;
            }
            if (_serverOutName != null) {
                serverOutName = _serverOutName;
            }
        }//IPC() ctor

        ~IPC() {
            ShutdownPipeThreads();
        }//IPC dtor

        public void StartPipeThreads() {
            serverInWorker = new BackgroundWorker();
            serverInWorker.DoWork += new DoWorkEventHandler(serverIn_DoWork);
            serverInWorker.WorkerSupportsCancellation = true;
            serverInWorker.RunWorkerAsync();

            serverOutWorker = new BackgroundWorker();
            serverOutWorker.DoWork += new DoWorkEventHandler(serverOut_DoWork);
            serverOutWorker.WorkerSupportsCancellation = true;
            serverOutWorker.RunWorkerAsync();
        }//StartPipeThreads

        public void ShutdownPipeThreads() {
            if (serverInWorker != null) {
                serverInWorker.CancelAsync();
                serverInWorker = null;
            }

            if (serverOutWorker != null) {
                serverOutWorker.CancelAsync();
                serverOutWorker = null;
            }
        }//ShutdownPipeThreads

        //tex mgsv_in pipe (IHExt out) process thread
        //IN/SIDE: serverInName
        void serverIn_DoWork(object sender, DoWorkEventArgs e) {
            BackgroundWorker worker = (BackgroundWorker)sender;

            using (var serverIn = new NamedPipeClientStream(".", serverInName, PipeDirection.Out)) {//tex: piped named from mgsv standpoint, so we pipe out to mgsv in, and visa versa
                // Connect to the pipe or wait until the pipe is available.
                Debug.Log("Attempting to connect to serverIn...");
                serverIn.Connect();

                Debug.Log($"Connected to {serverInName}.");
                //DEBUGNOW Debug.Log($"There are currently {serverIn.NumberOfServerInstances} pipeIn server instances open.");

                serverIn.ReadMode = PipeTransmissionMode.Message;

                //ToMgsvCmd("0|IHExtStarted");//DEBUG
                StreamWriter sw = new StreamWriter(serverIn, Encoding.UTF8);
                while (!worker.CancellationPending) {
                    //Debug.Log("serverIn_DoWork");//DEBUG
                    //sw.Write("Sent from client.");//DEBUG
                    if (extToMgsvCmdQueue.Count() > 0) {
                        string command;
                        while (extToMgsvCmdQueue.TryDequeue(out command)) {
                            if (worker.CancellationPending) {
                                break;
                            }

                            //Debug.Log("Client write: " + command);//DEBUG
                            sw.Write(command);
                        }
                        sw.Flush();
                    }//if extToMgsvCmdQueue
                }//while !worker.CancellationPending
            }//using pipeIn
            Debug.Log("serverIn_DoWork exit");
        }//serverIn_DoWork

        //tex mgsv_out pipe (IHExt in) process thread
        //IN/SIDE: serverOutName
        //IN-OUT/SIDE: mgsvToExtComplete
        void serverOut_DoWork(object sender, DoWorkEventArgs e) {
            BackgroundWorker worker = (BackgroundWorker)sender;

            //tex there's an issue with client/in pipes not working in message mode
            //https://stackoverflow.com/questions/32739224/c-sharp-unauthorizedaccessexception-when-enabling-messagemode-for-read-only-name
            //The solution below lets you keep the server as out only (OUTBOUND in c++), but this constructor for NamedPipeClientStream isn't available in .net standard (thus not unity)
            //using (var serverOut = new NamedPipeClientStream(
            //        ".",
            //        serverOutName,
            //        PipeAccessRights.ReadData | PipeAccessRights.WriteAttributes,
            //        PipeOptions.None,
            //        System.Security.Principal.TokenImpersonationLevel.None,
            //        System.IO.HandleInheritability.None)) {
            //tex so using this instead of above, where pipedirection is InOut instead of In, the gotcha is server must be InOut/DUPLEX as well
            //GOTCHA: which also theoretically means a client could stall the pipe if it writes to it as IHHook only treats is as out only.
            using (var serverOut = new NamedPipeClientStream(".", serverOutName, PipeDirection.InOut)) {
                // Connect to the pipe or wait until the pipe is available.
                Debug.Log("Attempting to connect to serverOut...");
                serverOut.Connect();

                Debug.Log($"Connected to {serverOutName}.");
                //DEBUGNOW Debug.Log($"There are currently {serverOut.NumberOfServerInstances} pipe server instances open.");

                serverOut.ReadMode = PipeTransmissionMode.Message;

                //ToMgsvCmd("IHExtStarted");//DEBUG
                while (!worker.CancellationPending) {
                    //Debug.Log("serverOut_DoWork");//DEBUG
                    StreamReader sr = new StreamReader(serverOut, Encoding.UTF8);//tex DEBUGNOW: will hang if ouside the loop
                    string message;
                    int count = 0;
                    //tex message mode doesn't seem to be working for mgsv_out
                    //despite checking everything on both sides and despite it working for mgsv_in
                    //was: while ((line = sr.ReadLine()) != null) {
                    var peek = sr.Peek();//DEBUG
                    while (sr.Peek() > 0) {
                        if (worker.CancellationPending) {
                            break;
                        }

                        //OFF see above
                        //message = sr.ReadLine();
                        //message = sr.ReadToEnd();
                        message = ReadByChar(sr);

                        //Debug.Log("Received from server: {message}");//DEBUG
                        if (String.IsNullOrEmpty(message)) {
                            continue;
                        }

                        if (useMgsvToExtCmdQueue) {
                            mgsvToExtCmdQueue.Enqueue(message);
                        } else {
                            ProcessCommand(message, count);
                        }
                        count++;
                    }//while Read
                }//while !worker.CancellationPending
            }//using pipeOut
            Debug.Log("serverOut_DoWork exit");
        }//serverOut_DoWork

        private static string ReadByChar(StreamReader sr) {
            StringBuilder stringBuilder = new StringBuilder();
            char c;
            while (true) {
                c = (char)sr.Read();
                if (c == -1) {//tex end of stream
                    break;
                } else if (c == '\0') {
                    break;
                } else {
                    // if (c == '|') {
                    //tex Could start splitting string here I guess
                    // } else {
                    stringBuilder.Append(c);
                    // }
                }
            }//while true
            return stringBuilder.ToString();
        }//ReadByChar

        //OUT/SIDE: mgsvToExtComplete
        private void ProcessCommand(string message, int count) {
            char[] delimiters = { '|' };
            string[] args = message.Split(delimiters);
            int messageId;

            if (Int32.TryParse(args[0], out messageId)) {
                if (args.Length < 1) {
                    Debug.Log("WARNING: args.Length < 1");
                } else {
                    string commandName = args[1];//tex args 0 is messageId
                    if (!commands.ContainsKey(commandName)) {
                        Debug.Log("WARNING: Unrecogined command:" + commandName);
                    } else {
                        commands[commandName](args);
                    }
                }//if args

                mgsvToExtComplete = messageId;
            }// parse messageId
        }//ProcessCommand

        //tex call from some other thread to process mgsvToExtCmdQueue messages 
        public void ProcessCommandQueue() {
            if (!mgsvToExtCmdQueue.IsEmpty) {
                string message;
                while (mgsvToExtCmdQueue.TryDequeue(out message)) {
                    ProcessCommand(message, 0);
                }
            }
        }//ProcessCommandQueue

        //to mgsv commands
        public void ToMgsvCmd(string cmd) {
            string message = extToMgsvCurrent.ToString() + "|" + cmd;
            extToMgsvCmdQueue.Enqueue(message);
            extToMgsvCurrent++;
        }//ToMgsvCmd

        public void AddCommand(string name, Action<string[]> command) {
            if (commands.ContainsKey(name)) {
                Debug.Log($"WARNING: commands dictionary already has entry for '{name}'");
            } else {
                commands.Add(name, command);
            }
        }//AddCommand
    }//PipeClient
}//namespace IHExt
