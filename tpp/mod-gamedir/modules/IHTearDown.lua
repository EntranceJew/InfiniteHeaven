--DEBUGWIP
--IHTearDown.lua
--Dumps data from mgsv globals
--Builds mock modules.
local this={}


--TODO: knownmodulenames,infteardown,autodoc are kinda seperate from standard modules?

this.doDumpModules=false

this.dumpDir=[[D:\Projects\MGS\dump\tpp\]]--tex output folder
this.buildFromScratch=false
local luaFolder=[[J:\GameData\mgs\filetype-crush\lua\]]--tex unmodded lua, all in same folder

function this.PostAllModulesLoad()
  InfCore.Log("IHTearDown.PostAllModulesLoad")
  
  if this.doDumpModules then
  this.DumpModules()
  end
end

--NOTE: this should be run at least in ACC
--Some of the modules and some of the keys aren't up and running during start/start2nd.lua but are by ACC.
function this.DumpModules()
  local globalsByType=this.GetGlobalsByType()
  --InfCore.PrintInspect(globalsByType)

  --tex NOTE internal C tables/modules exposed from MGS_TPP.exe are kinda funky,
  --a few are normal, plain text keys as you'd expect.
  --most are doing something with indexing metatables via some custom class binding i guess
  --the most common is fox table (don't know actual name)
  --these will either act as arrays with [-285212672] acting as item count
  --or [key name] being index into [some number]
  --or [key name] being index into [-285212671][some number]
  --some number doesnt seem to be strcode32
  --some times its [-285212671][some string] which is a normal name

  --many have a _classname string, these have plain text keys/dont have the somenumber indirection

  local arrayCountIdent=-285212672
  local arrayIdent=-285212671


  local mockModules=this.BuildMockModules(globalsByType.table)
  --InfCore.PrintInspect(mockModules,"mockModules")--DEBUG

  --tex NOTE: takes a fair while to run. Run it once, then use the resulting combined table .lua (after copying it to MGS_TPP\mod\modules and lauding it) --DEBUGNOW
  --open ih_log.txt in an editor that live refreshes to see progress
  local moduleReferences
  if this.buildFromScratch==true then
    --tex scrapes module references from lua files
    moduleReferences=this.GetModuleReferences(globalsByType.table)
  --InfCore.PrintInspect(moduleReferences,"moduleReferences")--DEBUG
  else
    --tex use module previously built/saved from above process
    moduleReferences=IHGenModuleReferences--ASSUMPTION output of above has been loaded as a module
  end

  local mockModulesFromRefs,notFound=this.BuildMockModulesFromReferences(globalsByType.table,moduleReferences)
  InfCore.PrintInspect(notFound,"notFound")

  InfCore.Log("combine mockModulesFromRefs to mockModules")
  for moduleName,module in pairs(mockModulesFromRefs) do
    for k,v in pairs(module)do
      if not mockModules[moduleName] then
        InfCore.Log(moduleName.." could not find module in mockmodules")
      elseif not mockModules[moduleName][k] then
        mockModules[moduleName][k]=v
      end
    end
  end

  local missedModules={}
  for name,module in pairs(globalsByType.table)do
    if not mockModules[name] then
      missedModules[name]=true
    end
  end

  if vars.missionCode<=5 then
    InfCore.Log("vars.missionCode<=5, will not output dump files")
    return
  end
  if isMockFox then
    InfCore.Log("isMockFox, will not output dump files")
    return
  end

  local varsTable=this.DumpVars()

  local svarsTable=this.DumpSaveVars(svars)

  local gvarsTable=this.DumpSaveVars(gvars)

  local mvarsTable=mvars

  --tex write dumps
  local header={
    [[--ModulesDump.lua]],
    [[--GENERATED by IHTearDown]],
    [[--Straight Inspect dump of mgstpp global tables]],
  }
  local outDir=this.dumpDir..[[modulesDump\]]
  this.DumpToFiles(outDir,globalsByType.table)
  this.WriteTable(this.dumpDir.."ModulesDump.lua",table.concat(header,"\r\n"),globalsByType.table)

  if moduleReferences~=IHGenModuleReferences then--tex no point dumping a dump
    local header={
      [[--IHGenModuleReferences.lua]],
      [[--GENERATED by IHTearDown.DumpModules > GetModuleReferences]],
      [[--is scrape of references to modules in .lua files]],
    }
  local outDir=this.dumpDir..[[moduleReference\]]
  this.DumpToFiles(outDir,moduleReferences)
  this.WriteTable(this.dumpDir.."IHGenModuleReferences.lua",table.concat(header,"\r\n"),moduleReferences)
  end

  local header={
    [[--MockModulesGenerated.lua]],
    [[--GENERATED by IHTearDown from running mgs combined with scrapes of .lua files for further module references (due to internal mgs_tpp modules indexing crud, see NOTE in DumpModules)]],
  }
  local outDir=this.dumpDir..[[mockModules\]]
  this.DumpToFiles(outDir,mockModules)
  this.WriteTable(this.dumpDir.."MockModules.lua",table.concat(header,"\r\n"),mockModules)

  local header={
    [[--IHGenModuleReferences.lua]],
    [[--GENERATED by IHTearDown BuildMockModulesFromReferences]],
    [[--references from IHGenModuleReferences that werent found in live session]],
  }
  this.WriteTable(this.dumpDir.."IHGenUnfoundReferences.lua",table.concat(header,"\r\n"),notFound)

  local header={
    [[--IHMissedModules.lua]],
    [[--GENERATED by IHTearDown]],
    [[--global module names that werent in generated mockmodules]],
  }
  this.WriteTable(this.dumpDir.."IHMissedModules.lua",table.concat(header,"\r\n"),missedModules)

  local header={
    [[--vars.lua]],
    [[--GENERATED by IHTearDown.DumpVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."vars.lua",table.concat(header,"\r\n"),varsTable)

  local header={
    [[--svars.lua]],
    [[--GENERATED by IHTearDown.DumpSaveVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."svars.lua",table.concat(header,"\r\n"),svarsTable)

  local header={
    [[--gvars.lua]],
    [[--GENERATED by IHTearDown.DumpSaveVars]],
    [[--Note: indexed from 0 like actual vars]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."gvars.lua",table.concat(header,"\r\n"),svarsTable)

  local header={
    [[--mvars.lua]],
    [[--using Inspect]],
    [[--dump of vars during missionCode:]]..vars.missionCode,
  }
  this.WriteTable(this.dumpDir.."\\varsDump\\".."mvars.lua",table.concat(header,"\r\n"),mvarsTable)

  local entityClassDictionary=this.DumpEntityClassDictionary()
  local header={
    [[--IHGenEntityClassDictionary.lua]],
    [[--GENERATED by IHTearDown DumpEntityClassDictionary]],
    [[--dump of EntityClassDictionary.GetCategoryList, GetClassNameList]],
  }
  this.WriteTable(this.dumpDir.."IHGenEntityClassDictionary.lua",table.concat(header,"\r\n"),entityClassDictionary)
end

--tex breaks down global variables by type
--IN/SIDE: IHGenKnownModuleNames, _G
--OUT: globalsByType
function this.GetGlobalsByType()
  local ModuleNames=IHGenKnownModuleNames--tex lists of known module names (mostly just from filenames)

  --tex names of tables in KnownModuleNames to skip
  local skipModuleTableNames={
    "ihInternal",
    "ihExternal",
    "ihModelInfo",
    "tppInternal",
    "ssdInternal",
    "luaInternal",
  }

  local skipModuleNames={
    _G=true,
    package=true,
    this=true,
  }

  local globalsByType={
    ["table"]={},
    ["function"]={},
    ["string"]={},
    other={},
  }
  local globalFunctions={}
  local globalTables={}
  local globalOther={}
  for k,v in pairs(_G)do
    local addEntry=true
    for i,moduleNameTable in ipairs(skipModuleTableNames)do
      if ModuleNames[moduleNameTable] and ModuleNames[moduleNameTable][k] then
        addEntry=false
        break
      end
    end

    if skipModuleNames[k] then
      addEntry=false
    end

    --tex theres some strange edge cases where theres a provided lua, but also an exe internal module of that name
    if ModuleNames.exeInternal[k] then
      addEntry=true
    end

    if addEntry then
      local types=globalsByType[type(v)]
      types=types or globalsByType.other
      types[k]=v
    end
  end
  return globalsByType
end

--tex breaks down modules keys by type
function this.GetModuleKeysByType(modules)
  InfCore.Log("GetModuleKeysByType")
  local breakDown={}
  for moduleName,module in pairs(modules)do
    local tableInfo={
      stringKeys={},
      numberKeys={},
    }
    local function GetTableKeys(checkTable,tableInfo)
      for key,value in pairs(checkTable)do
        if type(key)=="string" then
          table.insert(tableInfo.stringKeys,key)
        elseif type(key)=="number" then
          table.insert(tableInfo.numberKeys,key)
          if type(value)=="table" then
            GetTableKeys(value)
          end
        end
      end
    end

    GetTableKeys(module,tableInfo)

    if #tableInfo.numberKeys>0 then
      breakDown[moduleName]=tableInfo
    end
  end
end

--tex scrapes module references from lua files
--DEBUGNOW REWORK
--just do a straight search for . : and build up it's own module names, that way it can also catch stuff like CyprRailActionDataSet that only calls via a variable
--break lines on ")", "}", "]", "=", ","??
--," " -- would be nice, but would miss cases such as 'blah.Functionname ('
--for brokenLines
--refpos = findfirst '.'
--type=normalref
--refpos = findfirst ':'
--type=selfref

--DEBUGNOW DOES delims/split remove the delim chars from the lines??

--from refpos left/decement/toward start of line
--objstartPos=find/breakup string by anything not alphanumeric or start of line
--what if is ..? -- that would be objstartPos==refpos?
--objectName = refPos to objstartPos

--from refPos right/increment/toward end of line
--memberEndPos =find/break on alphanumeric or end of line
--" ",???
--what if 'blah.Functionname (' or 'blah.Functionname<tab>(' ??

function this.GetModuleReferences(modules)
  InfCore.Log("GetModuleReferences")

  --tex get paths of lua files ASSUMPTION: all lua files in one folder/no subfolders
  local outName="luaFileList.txt"

  local startTime=os.clock()

  local cmd=[[dir /s /b "]]..luaFolder..[[*.lua" > "]]..luaFolder..outName..[["]]
  InfCore.Log(cmd)
  os.execute(cmd)

  local luaFilePaths=InfCore.GetLines(luaFolder..outName)
  --InfCore.PrintInspect(luaFilePaths,"luaFilePaths")--DEBUG

  local numFiles=#luaFilePaths

  local refs={}
  for i,filePath in ipairs(luaFilePaths)do
    InfCore.Log("["..i.."//"..numFiles.."] "..filePath)--DEBUG
    local lines=InfCore.GetLines(filePath)
    for i,fileLine in ipairs(lines)do
      for moduleName,moduleInfo in pairs(modules)do
        local fileLine=fileLine

        --tex break up lines
        local brokenLines={}
        local delim = {
          ",", " ", "\n", "%]", "%)", "}", "\t",
          "%+","-",">","<","=","/","%*","~","%%",
          "'","\"","{","%(","%[",
        }
        local pattern = "[^"..table.concat(delim).."]+"
        for w in fileLine:gmatch(pattern) do
          --InfCore.Log(w)
          table.insert(brokenLines,w)
        end

        --InfCore.Log("looking for "..moduleName)--DEBUGNOW
        for i,line in ipairs(brokenLines)do
          local findIndex,findEndIndex=string.find(line,moduleName)
          while(findIndex~=nil)do
            local findEndIndex=findIndex+string.len(moduleName)
            line=string.sub(line,findEndIndex)
            local nextChar=string.sub(line,1,1)
            --InfCore.Log("find: "..moduleName.. " line:"..line)--DEBUGNOW
            --InfCore.Log("find: "..moduleName.. " nextChar:"..nextChar)--DEBUGNOW
            if nextChar=="." or nextChar==":" then
              --DEBUGNOW TODO: handle + - < > == number (can + be concat string too?)

              --              local keyType
              --              if line:find("%(") then
              --                keyType="function"
              --                key=key:sub(1,key:len()-1)
              --              elseif line:find("%[") then
              --                keyType="table"
              --                key=key:sub(1,key:len()-1)
              --             elseif line:find("%:") then--DEBUGNOW
              --                --keyType=""--tex most likely a comment
              --                key=key:sub(1,key:len()-1)
              --              elseif line:find("=") then
              --                if line:find("={") then
              --                  keyType="table"
              --                elseif line:find("='") then
              --                  keyType="string"
              --                elseif line:find("=\"") then
              --                  keyType="string"
              --                end
              --                --tex =something is unknown, could be any type being assigned to it
              --                local endIndex=line:find("=")
              --                key=key:sub(1,endIndex-2)
              --              end

              local key=string.sub(line,2)--tex strip leading .

              local keyEndIndex=string.find(key,"[%.:]")
              if keyEndIndex then
                key=string.sub(key,1,keyEndIndex-1)
              end

              local nextChar=string.sub(key,1,1)
              if findIndex==1 then--DEBUGNOW
                if key~="" and type(nextChar)~="number"then
                  refs[moduleName]=refs[moduleName]or{}
                  refs[moduleName][key]=true
              end
              end
            end

            findIndex=string.find(line,moduleName)
            --InfCore.Log(findIndex)--DEBUGNOW
          end
        end
      end
    end
  end

  InfCore.Log(string.format("GetModuleReferences completed in: %.2f", os.clock() - startTime))

  return refs
end

function this.BuildMockModules(modules)
  local mockModules={}

  local ignoreModules={
    vars=true,
    cvars=true,
    gvars=true,
    svars=true,
    mvars=true,
  }

  local ignoreKeys={
    --    __call=true,
    --    __newindex=true,
    --    __index=true,
    }

  for moduleName,module in pairs(modules)do
    if not ignoreModules[moduleName] then
      mockModules[moduleName]={}
      for k,v in pairs(module)do
        --NOTE only string keys to skip userdata/indexified modules keys, see NOTE in DumpModules
        if type(k)=="string" then
          if not ignoreKeys[k] then
            if type(v)=="function" then
              mockModules[moduleName][k]="<function>"
            elseif type(v)=="table" then
              mockModules[moduleName][k]="<table>"
            elseif type(v)=="userdata" then
              mockModules[moduleName][k]="<userdata: "..tostring(v)..">"
            else
              mockModules[moduleName][k]=v
            end
          end
        end
      end
    end
  end
  return mockModules
end


function this.BuildMockModulesFromReferences(modules,moduleReferences)
  InfCore.Log("BuildMockModulesFromReferences")
  local mockModules={}

  local ignoreModules={
    vars=true,
    cvars=true,
    gvars=true,
    svars=true,
    mvars=true,
  }

  local ignoreKeys={
    --    __call=true,
    --    __index=true,
    --    __newindex=true,
    }

  local notFound={}

  for moduleName,referenceModule in pairs(moduleReferences)do
    if not ignoreModules[moduleName] then
      mockModules[moduleName]={}
      if not modules[moduleName] then
        InfCore.Log("Could not find module '"..moduleName.."' from moduleReferences in modules")
        notFound[moduleName]=true
      else
        local liveModule=modules[moduleName]
        for k,v in pairs(referenceModule)do
          local liveValue=liveModule[k]
          if liveValue==nil then
            InfCore.Log(moduleName.." could not find key "..tostring(k))
            notFound[moduleName]=notFound[moduleName] or {}
            notFound[moduleName][k]=true
          elseif type(k)=="string" then
            if not ignoreKeys[k] then
              if type(liveValue)=="function" then
                mockModules[moduleName][k]="<function>"
              elseif type(liveValue)=="table" then
                mockModules[moduleName][k]="<table>"
              elseif type(liveValue)=="userdata" then
                mockModules[moduleName][k]="<userdata: "..tostring(liveValue)..">"
              else
                mockModules[moduleName][k]=liveValue
              end
            end
          end
        end
      end
    end
  end
  return mockModules,notFound
end

function this.GetPlainTextModules(modules)
  local plainTextModules={}

  local ignoreKeys={
    __call=true,
    __newindex=true,
    __index=true,
  }

  for moduleName,module in pairs(modules)do
    for k,v in pairs(module)do
      if type(k)=="string" then
        if not ignoreKeys[k] then
          plainTextModules[moduleName]=true
        end
      end
    end
  end

  return plainTextModules
end

function this.DumpVars()
  local vars=vars

  local rootArrayIdent=-285212671

  local arrayIdent=-285212665
  local arrayCountIdent=-285212666

  local varsTable={}

  for k,v in pairs(vars[rootArrayIdent])do
    varsTable[k]=vars[k]
  end

  local skipKeys={
    __index=true,
    __newindex=true,
  }

  for k,foxTable in pairs(vars)do
    --tex is actually a foxTable
    if type(foxTable)=="table" then
      if foxTable[arrayCountIdent] then
        --InfCore.Log("found foxTable "..k)--DEBUGNOW
        if type(k)=="string" then
          if not skipKeys[k] then
            local foxTableArray=foxTable[arrayIdent]
            if foxTableArray then
              varsTable[k]={}
              local arrayCount=foxTable[arrayCountIdent]
              --InfCore.Log("arrayCount="..arrayCount)--DEBUGNOW
              for i=0,arrayCount-1 do
                varsTable[k][i]=vars[k][i]
              end
            end
          end
        end
      end
    end
  end

  return varsTable
end

--tex svars,gvars use same layout
function this.DumpSaveVars(inputVars)
  if inputVars==nil then
    InfCore.Log("DumpSaveVars inputVars==nil")
    return
  end

  local varsTable={}

  --tex svars.__as is non array vars
  for k,v in pairs(inputVars.__as)do
    varsTable[k]=v
  end

  --tex svars.__rt is array vars
  --REF
  --  __rt = {
  --      InterrogationNormal = {
  --      __vi = 224,
  --      <metatable> = <table 1>
  --    },
  for k,v in pairs(inputVars.__rt)do
    varsTable[k]={}
    local arraySize=v.__vi--DEBUGNOW not sure if this is right
    for i=0,arraySize-1 do
      varsTable[k][i]=inputVars[k][i]
    end
  end

  return varsTable
end

function this.DumpEntityClassDictionary()
  local entityClassNames={}

  local categoryList=EntityClassDictionary.GetCategoryList()

  for i,categoryName in ipairs(categoryList)do
    entityClassNames[categoryName]=EntityClassDictionary.GetClassNameList(categoryName)
  end

  return entityClassNames
end

local open=io.open
local Inspect=InfInspect.Inspect

local nl=[[\r\n]]
function this.WriteString(filePath,someString)
  local file,error=open(filePath,"w")
  if not file or error then
    return
  end

  file:write(someString)
  file:close()
end

--tex writes a table out to file with text header
function this.WriteTable(fileName,header,t)
  if t==nil then
    return
  end
  InfCore.Log("WriteTable "..fileName)

  local all=InfInspect.Inspect(t)
  all="local this="..all.."\r\n".."return this"
  if header then
    all=header.."\r\n"..all
  end

  this.WriteString(fileName,all)
end

function this.DumpToFiles(outDir,moduleTable)
  if moduleTable==nil then
    return
  end
  InfCore.Log("DumpToFiles "..outDir)

  for k,v in pairs(moduleTable) do
    local filename=outDir..k..'.txt'
    local ins=Inspect(v)
    this.WriteString(filename,k.."="..ins)
  end
end

return this
