﻿/*
CameraSync.cs
Component that uses IPCControl to sync the position and rotation of camera from the game.

Add this component to a gameobject.
If the script cannot find existing one it will create a gameobject 'Main Camera'.
Once IPC is running (click 'Toggle IPC' in Window->FoxKit->MGSV IPC after game is running) 
Click Single Update or Continious Object on this component to update the gameobjects to the games position.

EDITOR_TO_GAME will only update the IH freecam position, since there's currently no runtime option to set game camera pos or rotation.
 */
using UnityEngine;
namespace FoxKit.IH {
    [ExecuteInEditMode]
    public class CameraSync : IPCFeature {
        string gameObjectName = "Main Camera";
        GameObject proxyGameObject;

        public SyncDirection syncDirection = SyncDirection.GAME_TO_EDITOR;

        override public void RegisterFromGameCommands() {
            IPC.Instance.AddCommand("GameCameraPos", GameCameraPos);
        }//RegisterFromGameCommands

        override public void RegisterToGameCommands() {
            //Debug.Log("RegisterToGameCommands");//DEBUGNOW
            string cmdScript = 
            @"InfCore.ExtCmd('GameCameraPos', 
            vars.playerCameraPosition[0], vars.playerCameraPosition[1], vars.playerCameraPosition[2],
            vars.playerCameraRotation[0], vars.playerCameraRotation[1])";
            //DEBUGNOW IPC.Instance.ToGameCmd("RegisterToGameCmd", "GetCameraPos", cmdScript);

            //n|SetCameraPos|{x}|{y}|{z}|{pitch}|{yaw}
            cmdScript = 
            @"local x, y, z, pitch, yaw = args[3], args[4], args[5], args[6], args[7]
            local currentCamName = this.GetCurrentCamName()
            local currentPos = Vector3(x, y, z)
            InfCamera.WritePosition(currentCamName, currentPos)";
            //DEBUGNOW IPC.Instance.ToGameCmd("RegisterToGameCmd", "SetCameraPos", cmdScript);
        }//RegisterToGameCommands

        override public void OnIPCUpdate() {
            if (syncDirection == SyncDirection.EDITOR_TO_GAME) {
                float x = proxyGameObject.transform.position.x;
                float y = proxyGameObject.transform.position.y;
                float z = proxyGameObject.transform.position.z;
                float pitch = proxyGameObject.transform.rotation.eulerAngles.x;
                float yaw = proxyGameObject.transform.rotation.eulerAngles.y;
                //unity to fox
                x=-x;
                yaw=-yaw;
                
                IPC.Instance.ToGameCmd($"SetCameraPos|{x}|{y}|{z}|{pitch}|{yaw}");
            } else {
                //GAME_TO_EDITOR
                IPC.Instance.ToGameCmd("GetCameraPos");
            }
        }//OnIPCUpdate

        //Set up any game objects we manage
        override public void SetupGameObjects() {
            //Debug.Log("SetupGameObjects");//DEBUGNOW
            proxyGameObject = GameObject.Find(gameObjectName);
            if (proxyGameObject == null) {
                proxyGameObject = new GameObject(gameObjectName);
            }//if !gameObject
        }//SetupGameObjects

        //tex commands from game
        //tex all commands take in single param and array of args
        //args[0] = messageId(not really useful for a command)
        //args[1] = command name(ditto)
        //args[2 +] = arg as string

        //GameCameraPos|x|y|z|pitch|yaw|roll
        private void GameCameraPos(string[] args) {
            float x = float.Parse(args[2]);
            float y = float.Parse(args[3]);
            float z = float.Parse(args[4]);

            float pitch = float.Parse(args[5]);
            float yaw = float.Parse(args[6]);
            
            //tex fox to unity conversion
			x=-x;
			yaw=-yaw;

            proxyGameObject.transform.position = new Vector3(x, y, z);
            Quaternion yawQuat = Quaternion.Euler(pitch, yaw, 0.0f);
            proxyGameObject.transform.rotation = yawQuat;

            //Debug.Log($"GameCameraPos: {x},{y},{z},{pitch},{yaw}");//DEBUG
        }//GameCameraPos
    }//class CameraSync
}//namespace