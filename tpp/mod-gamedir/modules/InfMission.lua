--InfMission.lua
-- tex implements various mission selection options
-- and IH location and mission addon systems

--REF location addon module <GameDir>\mod\locations\ >
--reference of all entries rather than a sane example
--local this={
--  description="Jade Forest",
--  locationName="AFC0",
--  locationId=101,
--  packs={"/Assets/mgo/pack/location/afc0/afc0.fpk"},-- TppMissionList.locationPackTable entry
--  locationMapParams={-- \Assets\tpp\pack\mbdvc\mb_dvc_top.fpkd \ mbdvc_map_location_parameter.lua entry
--    stageSize=556*1,
--    scrollMaxLeftUpPosition=Vector3(-255,0,-275),
--    scrollMaxRightDownPosition=Vector3(255,0,275),
--    highZoomScale=2,
--    middleZoomScale=1,
--    lowZoomScale=.5,
--    locationNameLangId="mgo_idt_Jungle",
--    stageRotate=0,
--    heightMapTexturePath="/Assets/mgo/ui/texture/map/afc0/afc0_iDroid_clp.ftex",
--    photoRealMapTexturePath="/Assets/mgo/ui/texture/map/afc0/afc0_jungle_sat_clp.ftex"
--  },
--}
--
--return this
--<

--REF mission addon module, <GameDir>\mod\missions\ >
--reference of all entries rather than a sane example
--local this={
--  description="Jade Forest",-- Description for IH menu.
--  missionCode=12020,
--  location="AFC0",
--  packs=function(missionCode) -- TppMissionList.missionPackTable entry, can be table of fpk names or function of packlist adding calls.
--    TppPackList.AddMissionPack(TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_WAIT)
--    TppPackList.AddMissionPack"/Assets/tpp/pack/mission2/story/s13000/s13000_area.fpk"
--  end,
--  fovaSetupFunc=function(locationName,missionId)-- TppEneFova.fovaSetupFuncs entry
--    local faces={}
--    table.insert(faces,{TppEnemyFaceId.dds_balaclava2,10,10,0})
--    table.insert(faces,{TppEnemyFaceId.dds_balaclava6,2,2,0})
--    table.insert(faces,{TppEnemyFaceId.dds_balaclava7,2,2,0})
--
--    TppSoldierFace.OverwriteMissionFovaData{face=faces}}
--  end,
--  enableOOB=true,-- Enable the mission out of bound system
--  startPos={-11.788,8.483,165.559},--NO_HELICOPTER_MISSION_START_POSITION entry -  player spawn pos for non heli ride missions
--  missionGuaranteeGMP=120000, --TppResult.MISSION_GUARANTEE_GMP - base gmp for mission on mission clear
--  missionTaskList={0,2,3,4,5,6},--TppResult.MISSION_TASK_LIST - Haven't worked out exactly what this is
--  noArmorForMission=true,--TppEneFova.noArmorForMission - disallow heavy armor in the mission
--  missionArmorType={TppDefine.AFR_ARMOR.TYPE_RC},--TppEneFova.missionArmorType - Armor type for pfs in mafr
--  missionHostageInfos={count=1,lang=RENlang2,overlap=true},--TppEneFova.missionHostageInfos - for the mission hostage generation system
--  orderBoxList = { -- <mission>_sequence.missionStartPosition.orderBoxList -- TODO description
--    "box_s13000_00",
--    "box_s13000_01",
--  },
--  orderBoxBlockList = { "/Assets/tpp/pack/mission2/story/s13000/s13000_order_box.fpk" } --<free roam mission>_orderBoxList.lua TODO description
--}
--
--return this
--<
--tex for Validate
local missionInfoFormat={
  description="string",
  missionCode="number",
  location="string",
  --packs={"table","function"},--tex OFF till I make validate support multiple data types for a key
  fovaSetupFunc="function",
  enableOOB="boolean",
  startPos="table",
  missionGuaranteeGMP="number",
  missionTaskList="table",
  noArmorForMission="boolean",
  missionArmorType="table",
  missionHostageInfos="table",
  orderBoxList="table",
  orderBoxBlockList="table",
}

local this={}

this.debugModule=false

this.locationInfo={}
this.missionInfo={}
this.missionNames={}--tex see LoadMissionDefs
this.missionIds={}--tex used by Ivar loadAddonMission and OpenMissions()
this.missionListSlotIndices={}--tex need it for OpenMissions

this.registerIvars={
  "manualMissionCode",
  "manualSequence",
  "loadAddonMission",
  "ihMissionsPercentageCount",
}

this.manualMissionCode={
  inMission=true,
  --OFF save=IvarProc.CATEGORY_EXTERNAL,
  settings={},--DYNAMIC
  OnSelect=function(self)
    self.settings=this.GetMissionCodes()
    self.range.max=#self.settings-1
    self.settingNames=self.settings
  end,
  OnActivate=function(self,setting)
    local settingStr=self.settings[setting+1]
    local missionCode=tonumber(settingStr)
    InfCore.Log("manualMissionCode "..settingStr)

    this.LoadMissionManual(missionCode)
  end,
}

this.manualSequence={
  inMission=true,
  --OFF save=IvarProc.CATEGORY_EXTERNAL,
  range={max=1},--DYNAMIC
  OnSelect=function(self)
    self.settingNames={}
    --tex also mvars.seq_demoSequneceList (a subset)
    for sequenceName,enum in pairs(mvars.seq_sequenceNames)do
      self.settingNames[enum]=sequenceName
    end
    --InfCore.PrintInspect(self.settingNames)--DEBUG
    self.range.max=#self.settingNames-1
  end,
  OnActivate=function(self,setting)
    local settingStr=self.settingNames[setting+1]
    --InfCore.DebugPrint(tostring(settingStr))--DEBUG
    TppSequence.SetNextSequence(settingStr)
  end,
}

this.loadAddonMission={
  --OFF save=IvarProc.CATEGORY_EXTERNAL,
  settings={},
  OnSelect=function(self)
    InfUtil.ClearArray(self.settings)
    for i,missionCode in pairs(InfMission.missionIds)do
      self.settings[#self.settings+1]=tostring(missionCode)
    end
    table.sort(self.settings)
    self.range.max=#self.settings-1
    self.settingNames=self.settings
  end,
  GetSettingText=function(self,setting)
    if #self.settings==0 then
      return "No addon missions installed"--TODO langid
    end

    local missionCodeStr=self.settings[setting+1]
    local missionCode=tonumber(missionCodeStr)
    local missionInfo=InfMission.missionInfo[missionCode]
    if missionInfo then
      local location=missionInfo.location
      return "["..missionCodeStr.."]["..location.."] "..(missionInfo.description or "")
    else
      return "No missionInfo for "..missionCodeStr --TODO langid
    end
  end,
  OnActivate=function(self,setting)
    if #self.settings==0 then
      return
    end

    local settingStr=self.settings[setting+1]
    local missionCode=tonumber(settingStr)
    InfCore.Log("manualMissionCode "..settingStr)

    this.LoadMissionManual(missionCode)
  end,
}

this.ihMissionsPercentageCount={
  save=IvarProc.CATEGORY_EXTERNAL,
  range=Ivars.switchRange,
  settingNames="set_switch",
  OnChange=function()
    TppMission.SetPlayRecordClearInfo()
  end,
}
--< Ivars

function this.PostModuleReload(prevModule)
  this.locationInfo=prevModule.locationInfo
  this.missionNames=prevModule.missionNames
  this.missionIds=prevModule.missionIds
  this.missionInfo=prevModule.missionInfo
  this.missionListSlotIndices=prevModule.missionListSlotIndices
end


--WIP
this.femaleFaceIdList={394,351,373,456,463,455,511,502}
this.maleFaceIdList={195,144,214,6,217,83,273,60,87,71,256,201,290,178,102,255,293,165,85,18,228,12,65,134,31,132,161,342,107,274,184,226,153,247,344,242,56,183,54,126,223}

local MAX_REALIZED_COUNT=255--EnemyFova.MAX_REALIZED_COUNT
local fovaSetupFuncs={}
function fovaSetupFuncs.basic(locationName,missionId)
  local faces={}
  local faceCounts={}

  for i,faceId in ipairs(this.maleFaceIdList)do
    if faceCounts[faceId]==nil then
      faceCounts[faceId]=2
    else
      faceCounts[faceId]=faceCounts[faceId]+1
    end
  end
  for i,faceId in ipairs(this.femaleFaceIdList)do
    if faceCounts[faceId]==nil then
      faceCounts[faceId]=2
    else
      faceCounts[faceId]=faceCounts[faceId]+1
    end
  end


  for faceId,faceCount in pairs(faceCounts)do
    table.insert(faces,{faceId,faceCount,faceCount,0})
  end
  table.insert(faces,{623,1,1,0})
  table.insert(faces,{TppEnemyFaceId.dds_balaclava2,10,10,0})
  table.insert(faces,{TppEnemyFaceId.dds_balaclava6,2,2,0})
  table.insert(faces,{TppEnemyFaceId.dds_balaclava7,2,2,0})

  local bodies={
    {146,MAX_REALIZED_COUNT},
  }
  --TppSoldier2.SetExtendPartsInfo{type=1,path="/Assets/tpp/parts/chara/dds/ddr1_main0_def_v00.parts"}
  TppSoldierFace.OverwriteMissionFovaData{face=faces}--,body=bodies}
end

--this.locationInfo[45].locationMapParams=this.locationMapParams.MBA0--

--REF tpp
--REF from TppDefine RegisterMissionCodeList
--this.missionUiNumbers={
--  [10010]=0,
--  [10020]=1,
--  [10030]=2,
--  [10036]=3,
--  [10043]=4,
--  [10033]=5,
--  [10040]=6,
--  [10041]=7,
--  [10044]=8,
--  [10054]=9,
--  [10052]=10,
--  [10050]=11,
--  [10070]=12,
--  [10080]=13,
--  [10086]=14,
--  [10082]=15,
--  [10090]=16,
--  [10091]=17,
--  [10100]=18,
--  [10195]=19,
--  [10110]=20,
--  [10121]=21,
--  [10115]=22,
--  [10120]=23,
--  [10085]=24,
--  [10200]=25,
--  [10211]=26,
--  [10081]=27,
--  [10130]=28,
--  [10140]=29,
--  [10150]=30,
--  [10151]=31,
--  [10045]=32,
--  [11043]=33,
--  [11054]=34,
--  [10093]=35,
--  [11082]=36,
--  [11090]=37,
--  [10156]=38,
--  [11033]=39,
--  [11050]=40,
--  [10171]=41,
--  [11140]=42,
--  [10240]=43,
--  [11080]=44,
--  [10260]=45,
--  [10280]=46,
--  [11121]=47,
--  [11130]=48,
--  [11044]=49,
--  [11151]=50,
--}
--#51

this.highestUIMission=50--tex vanilla, indexed from 0

--tex Load Location addons
--OUT/SIDE: this.locationInfo
function this.LoadLocationDefs()
  local missionFiles=InfCore.GetFileList(InfCore.files.locations,".lua")
  for i,fileName in ipairs(missionFiles)do
    InfCore.Log("InfMission.LoadLocationsDefs: "..fileName)

    local locationInfo=InfCore.LoadSimpleModule(InfCore.paths.locations,fileName)
    if locationInfo then
      local locationId=locationInfo.locationId
      if not locationId then
        InfCore.Log("WARNING: could not find missionCode on "..fileName)
      else
        if this.locationInfo[locationId] then
          InfCore.Log("WARNING: Existing locationInfo already found for "..locationId)
        end
        this.locationInfo[locationId]=locationInfo
      end
    end
  end
end

--tex Load Mission addons
--OUT/SIDE: this.missionInfo
function this.LoadMissionDefs()
  InfCore.LogFlow("InfMission.LoadMissionDefs")
  local missionNames={}
  local missionsInfo={}

  local missionFiles=InfCore.GetFileList(InfCore.files.missions,".lua")
  for i,fileName in ipairs(missionFiles)do
    InfCore.Log("InfMission.LoadMissionDefs: "..fileName)

    local missionName=InfUtil.StripExt(fileName)
    local missionInfo=InfCore.LoadSimpleModule(InfCore.paths.missions,fileName)
    if missionInfo then
      local missionCode=missionInfo.missionCode--TYPE
      if not missionCode then
        InfCore.Log("WARNING: could not find missionCode on "..fileName)
      else
        missionNames[#missionNames+1]=missionName

        if missionsInfo[missionCode] then
          InfCore.Log("WARNING: Existing missionInfo already found for "..missionCode)
        end
        missionsInfo[missionCode]=missionInfo
      end
    end
  end

  this.missionNames=missionNames
  this.missionInfo=missionsInfo
end

--tex Patch in locations to relevant TPP tables.
--OUT/SIDE: a whole bunch
function this.AddInLocations()
  for locationId,locationInfo in pairs(this.locationInfo)do
    local locationName=locationInfo.locationName
    if not locationName then
      InfCore.Log("WARNING: Could nof find locationName for "..locationId)
    else
      InfCore.Log("Adding location: "..locationName.." "..locationId)
      if TppDefine.LOCATION_ID[locationName] then
        InfCore.Log("WARNING: location already defined "..locationId)
      end
      TppDefine.LOCATION_ID[locationName]=locationId
      TppMissionList.locationPackTable[locationId]=locationInfo.packs
    end
  end

  for locationId,locationInfo in pairs(this.locationInfo)do
    local locationName=locationInfo.locationName
    if locationName then
      InfUtil.locationIdForName[string.lower(locationName)]=locationId
    end
  end
  for locationName,locationId in pairs(InfUtil.locationIdForName)do
    InfUtil.locationNames[locationId]=locationName
  end

  --TppDefine.LOCATION_CHUNK_INDEX_TABLE[location]=Chunkbleh --tex TODO see what requires LOCATION_CHUNK_INDEX_TABLE for addon missions, fallback to some default instead of nil?

  TppLocation.GetLocationName=InfUtil.GetLocationName--tex replace the vanilla function with IHs

  if this.debugModule then
    InfCore.PrintInspect(this.locationInfo,"locationInfo")
  end
end

--tex Patch in misssions to relevant TPP tables.TppMissionList.missionPackTable
--OUT/SIDE: a whole bunch
function this.AddInMissions()
  for missionCode,missionInfo in pairs(this.missionInfo)do
    InfCore.Log("Adding mission "..missionCode)

    if InfCore.Validate(missionInfoFormat,missionInfo,"mission addon for "..missionCode) then
      --tex TODO: check it has a valid location

      TppMissionList.missionPackTable[missionCode]=missionInfo.packs

      --tex LOCATION_HAVE_MISSION_LIST is in a pretty bad layout of
      --{<location>={<missioncode>,<missioncode>,...}
      --Given how it's used it should have just been {[missioncode]=<location>,...} or {<location>={[missioncode]=true,...},}
      local locationMissions=TppDefine.LOCATION_HAVE_MISSION_LIST[missionInfo.location] or {}
      InfUtil.InsertUniqueInList(locationMissions,missionCode)
      TppDefine.LOCATION_HAVE_MISSION_LIST[missionInfo.location]=locationMissions

      TppDefine.NO_HELICOPTER_MISSION_START_POSITION[missionCode]=missionInfo.startPos

      --tex TODO: add to format
      --tex indicates that theres no free roam mission box start (there are 7 of these in vanilla)
      if missionInfo.isNoOrderBoxMission then--tex these are awkwardly worded, it's alway a struggle to decide whether to chose a nicer new name or keep it closer to what it's called in the vanilla data.
        InfUtil.InsertUniqueInList(TppDefine.NO_ORDER_BOX_MISSION_LIST,tostring(missionCode))
        TppDefine.NO_ORDER_BOX_MISSION_ENUM=TppDefine.Enum(TppDefine.NO_ORDER_BOX_MISSION_LIST)
      end
      TppDefine.NO_BOX_MISSION_START_POSITION[missionCode]=missionInfo.noBoxMissionStartPosition
      --tex TODO
      --  TppDefine.NO_ORDER_FIX_HELICOPTER_ROUTE--tex only used for two missions (of the 7 no box mission starts)


      --tex pretty much just clears gvars.heli_missionStartRoute, TODO: how does this interact with NO_HELICOPTER_MISSION_START_POSITION?
      --tex TODO: add to (but allow via a param)
      --TppDefine.NO_HELICOPTER_ROUTE_MISSION_LIST
      --TppDefine.NO_HELICOPTER_ROUTE_ENUM=TppDefine.Enum(TppDefine.NO_HELICOPTER_ROUTE_MISSION_LIST)

      --tex base gmp for mission on mission clear
      TppResult.MISSION_GUARANTEE_GMP[missionCode]=missionInfo.missionGuaranteeGMP

      --tex TppResult.MISSION_TASK_LIST, but not totally sure what it is yet, passed to UI via TppUiCommand.RegisterMbMissionListFunction >> TppResult.GetMbMissionListParameterTable
      --TODO find when GetMbMissionListParameterTable actually called, I see I hooked it at some point, I presume to do just that lol
      TppResult.MISSION_TASK_LIST[missionCode]=missionInfo.missionTaskList

      --tex TODO: shouldn't be needed
      --TppTerminal.noAddVolunteerMissions

      TppEneFova.fovaSetupFuncs[missionCode]=missionInfo.fovaSetupFunc

      if missionInfo.noArmorForMission then
        TppEneFova.noArmorForMission[missionCode]=1
      end
      TppEneFova.missionArmorType[missionCode]=missionInfo.missionArmorType
      TppEneFova.missionHostageInfos[missionCode]=missionInfo.missionHostageInfos

    end--if validate
  end


  if this.debugModule then
    InfCore.PrintInspect(this.missionInfo,"missionInfo")
  end
end

--tex register missions with UI/TPP Mission system
--IN/SIDE: this.missionIds
--OUT/SIDE: this.missionListSlotIndices
--OUT/SIDE: TppDefine.MISSION_LIST, TppDefine.MISSION_ENUM
function this.RegisterMissions()
  --tex WORKAROUND exe/ui seems to have same limit as TppDefine.MISSION_COUNT_MAX
  --but there's issues with mission completed rank not matching and seemingly no lua>ui way to set it
  --unlike the rest of the information via Mission.RegisterMissionCodeList, the gmp and task completion via TppResult.GetMbMissionListParameterTable
  --so am reusing the MISSING_NUMBER_MISSION_LIST which is flyk and some uncompleted extreme/subsidence of other missions
  --
  --plus the 2 actual free missionlist slots
  this.missionListSlotIndices={}--tex need it for OpenMissions
  for i,missionCodeStr in ipairs(TppDefine.MISSING_NUMBER_MISSION_LIST)do
    local missionIndex=TppDefine.MISSION_ENUM[missionCodeStr]+1
    table.insert(this.missionListSlotIndices,missionIndex)
  end
  --DEBUGNOW verify MISSION_LIST is vanilla at this point and RegisterMissions isnt run more than one
  for i=#TppDefine.MISSION_LIST+1,TppDefine.MISSION_COUNT_MAX do
    table.insert(this.missionListSlotIndices,i)
  end
  table.sort(this.missionListSlotIndices)

  if this.debugModule then
    local numFreeMissions=TppDefine.MISSION_COUNT_MAX-(#TppDefine.MISSION_LIST-#TppDefine.MISSING_NUMBER_MISSION_LIST)
    --tex or just TppDefine.MISSION_COUNT_MAX-#this.missionListSlotIndices
    InfCore.Log("numFreeMissions="..numFreeMissions)
    InfCore.PrintInspect(this.missionListSlotIndices,"missionListSlotIndices")
    InfCore.PrintInspect(TppDefine.MISSION_LIST,"missionlist vanill")
  end

  local freeSlot=0
  for i,missionCode in ipairs(this.missionIds)do
    if freeSlot==#this.missionListSlotIndices then
      InfCore.Log("WARNING: No free MISSION_LIST slots")
      break
    else
      local missionIndex=this.missionListSlotIndices[freeSlot+1]
      freeSlot=freeSlot+1
      TppDefine.MISSION_LIST[missionIndex]=tostring(missionCode)
    end
  end
  TppDefine.MISSION_ENUM=TppDefine.Enum(TppDefine.MISSION_LIST)

  if this.debugModule then
    InfCore.PrintInspect(TppDefine.MISSION_LIST,"missionlist modded")
    InfCore.PrintInspect(#TppDefine.MISSION_LIST,"#missionlist")
  end

  local highestMissionNum=this.highestUIMission
  for i,missionCode in ipairs(this.missionIds)do
    highestMissionNum=highestMissionNum+1
    InfCore.Log("RegistMissionEpisodeNo("..missionCode..","..highestMissionNum..")")
    TppUiCommand.RegistMissionEpisodeNo(missionCode,highestMissionNum)--TODO see if this is happy with being called more than once for a mission code (ie via reloadmodules)
  end

  --tex register modified list
  Mission.RegisterMissionCodeList{codeList=TppDefine.MISSION_LIST}--TODO see if this is happy with being called more than once for a mission code (ie via reloadmodules), it's already been called once anyway in vanilla in TppDefine
end

function this.LoadLibraries()
  if InfCore.gameId~="TPP" then
    return
  end

  InfCore.LogFlow("InfMission SetupMissions")

  this.LoadLocationDefs()
  this.LoadMissionDefs()

  this.AddInLocations()
  this.AddInMissions()


  this.missionIds={}--clear
  for missionCode,missionInfo in pairs(this.missionInfo)do
    table.insert(this.missionIds,missionCode)
  end
  table.sort(this.missionIds)

  this.RegisterMissions()

  if this.debugModule then
    InfCore.PrintInspect(this.missionIds,"missionIds")
    InfCore.PrintInspect(this.locationInfo,"locationInfo")
    InfCore.PrintInspect(this.missionInfo,"missionInfo")
    InfCore.PrintInspect(TppMissionList.locationPackTable,"TppMissionList.locationPackTable")
    InfCore.PrintInspect(TppMissionList.missionPackTable,"TppMissionList.missionPackTable")
    InfCore.PrintInspect(TppDefine.LOCATION_ID,"TppDefine.LOCATION_ID")
    InfCore.PrintInspect(TppDefine.LOCATION_HAVE_MISSION_LIST,"TppDefine.LOCATION_HAVE_MISSION_LIST")
    InfCore.PrintInspect(TppDefine.NO_HELICOPTER_MISSION_START_POSITION,"TppDefine.NO_HELICOPTER_MISSION_START_POSITION")
    --InfCore.PrintInspect(mbdvc_map_location_parameter,"mbdvc_map_location_parameter")
  end
end

--CALLER: mbdvc_map_location_parameter.GetMapLocationParameter --tex cant patch in to script since it seems mbdvc_map_location_parameter is torn down/reloaded so instead called from mbdvc_map_location_parameter
function this.GetMapLocationParameter(locationId)
  local locationInfo=this.locationInfo[locationId]
  if locationInfo then
    return locationInfo.locationMapParams
  end
end

--CALLER: mbdvc_map_mission_parameter.GetMissionParameter
function this.GetMapMissionParameter(missionCode)
  --TODO mgo style map param for location
  --TODO see if mgo map params are useful
  local missionInfo=this.missionInfo[missionCode]
  if missionInfo then
    return missionInfo.missionMapParams
  end
end

--str_missionOpenPermission ? DEBUGNOW
local gvarFlagNames={
  "str_missionOpenFlag",
  "str_missionNewOpenFlag",
  "str_missionClearedFlag",
}

--CALLER: TppStory.UpdateStorySequence
--IN/SIDE: this.missionListSlotIndices
function this.OpenMissions()
  InfCore.LogFlow("InfMission.OpenMissions")

  --tex close all missing number missions and > vanilla missions first so its ok if user uninstalls mission
  for i,missionListIndex in ipairs(this.missionListSlotIndices)do
    InfCore.Log("Clearing "..missionListIndex)
    gvars.str_missionOpenPermission[missionListIndex-1]=false
    gvars.str_missionOpenFlag[missionListIndex-1]=false
    gvars.str_missionNewOpenFlag[missionListIndex-1]=false
    gvars.str_missionClearedFlag[missionListIndex-1]=false

    --tex see _GetLastCompletedFlagIndex how to index ui_isTaskLastComleted
    for i=0,TppDefine.MAX_MISSION_TASK_COUNT-1 do
      local missionTaskNo=(missionListIndex-1)*TppDefine.MAX_MISSION_TASK_COUNT+i
      gvars.ui_isTaskLastComleted[missionTaskNo]=0
      -- <r233 BUG was: gvars.ui_isTaskLastComleted[missionListIndex-1]=0
    end
  end

  --tex TODO: save/restore mission flags

  for i,missionCode in ipairs(this.missionIds)do
    InfCore.Log("Opening "..missionCode)
    TppStory.PermitMissionOpen(missionCode)
    TppStory.SetMissionOpenFlag(missionCode,true)
    --TppStory.MissionOpen(missionCode)
  end
end

--tex set missionCleared gvars from ih_save state
--IN/SIDE: ih_save
--REF ih_save
--this.missionStates={
--  <mission name>=<bitfield of mission cleared gvar states>,
--}
function this.ReadSaveStates()
  InfCore.LogFlow"InfMission.ReadSaveStates"

  if ih_save==nil then
    local errorText="ReadSaveStates Error: ih_save==nil"
    InfCore.Log(errorText,true,true)
    return
  end

  local saveStates=ih_save.missionStates

  if saveStates==nil then
    InfCore.Log"ReadSaveStates: ih_save.missionStates==nil"
    return {}
  end

  if type(saveStates)~="table" then
    local errorText="ReadSaveStates Error: ih_save.missionStates type~=table"
    InfCore.Log(errorText,true,true)
    return
  end

  for name,saveState in pairs(saveStates)do
  --DEBUGNOW
  end

  return saveStates
end

local saveStates={}--tex cache of last to compare against for isdirty
--CALLER: IvarProc.BuildSaveText
function this.GetCurrentSaveStates()

  local gvars=gvars
  local bor=bit.bor

  local isSaveDirty=false



  if isSaveDirty then
    return saveStates
  end

  return nil
end


--CALLER: TppTerminal.ReleaseFreePlay
function this.EnableLocationChangeMissions()
--  TppUiCommand.EnableChangeLocationMenu{locationId=45,missionId=12000}
end

--orig in TppResult.GetMbMissionListParameterTable
-- currently conflict with Anyones Improvements
--OFF CULL
function this.GetMbMissionListParameterTable()
  InfCore.LogFlow("InfMission.GetMbMissionListParameterTable")--tex DEBUG
  local missionListParameterTable={}
  for missionCodeStr,enum in pairs(TppDefine.MISSION_ENUM)do
    local missionCode=tonumber(missionCodeStr)
    local missionParameters={}
    missionParameters.missionId=missionCode
    if this.MISSION_GUARANTEE_GMP[missionCode]then
      missionParameters.baseGmp=101--DEBUGNOW setting to magic number to see if working--ORIG this.MISSION_GUARANTEE_GMP[missionCode]
      missionParameters.currentGmp=101--DEBUGNOW setting to magic number to see if working --ORIG this.GetMissionGuaranteeGMP(missionCode)
    end
    if this.MISSION_TASK_LIST[missionCode]then
      missionParameters.completedTaskNum=TppUI.GetTaskCompletedNumber(missionCode)
      missionParameters.maxTaskNum=#this.MISSION_TASK_LIST[missionCode]
      missionParameters.taskList=this.MISSION_TASK_LIST[missionCode]
    end

    --OFF tex DEBUGNOW TODO what was I trying to do here?
    --    local isMissingNumberMission=TppDefine.MISSING_NUMBER_MISSION_ENUM[missionCodeStr]--tex
    --    if isMissingNumberMission then
    --      InfCore.Log("---------- GetMbMissionListParameterTable "..missionCodeStr)
    --    end
    --    if not isMissingNumberMission then--tex added skip
    --      table.insert(missionListParameterTable,missionParameters)
    --    end
    --
  end

  return missionListParameterTable
end

--
--tex need to patch in some orderbox data into the free roam mission scripts.
--TppMission.OnAllocate (which is run before this?) sets mvars.mis_orderBoxList to .missionStartPosition.orderBoxList, but doesn't seem to be used till later in execution
--OnAllocate is just before <sequence>.MissionPrepare which in freeroam calls:
--TppScriptBlock.RegisterCommonBlockPackList( "orderBoxBlock", f30020_orderBoxList.orderBoxBlockList )
--REF
--<free roam>_sequence.missionStartPosition = {
--    orderBoxList = {
--      "box_s10033_00",
--      "box_s10033_01",
--      ...
--REF
--<free roam>_orderBoxList.orderBoxBlockList[10081] = { "/Assets/tpp/pack/mission2/story/s10081/s10081_order_box.fpk" }
function this.OnAllocate(missionTable)
  local missionCode=vars.missionCode
  if TppMission.IsFreeMission(missionCode)then
    local missionStartPosition=missionTable.sequence.missionStartPosition--tex such a strange name for what the table is used for. ASSUMPTION always exists (it should if the sequence script has been cribbed from a vanilla script)
    --  local sequenceModule = _G["f"..missionCode.."_sequence] -- is just missionTable.sequence
    local orderBoxListModule=_G["f"..missionCode.."_orderBoxList"]

    --tex TODO: since this uses TppDefine.LOCATION_HAVE_MISSION_LIST
    -- this may be an issue for custom locations that don't have a free roam
    -- (outside of the fact that locations without a free roam wouldn't have order boxes)
    local freeRoamLocation=TppPackList.GetLocationNameFormMissionCode(missionCode)
    if not freeRoamLocation then

    else
      for missionCode,missionInfo in pairs(this.missionInfo)do
        if missionInfo.orderBoxList then
          if not missionStartPosition.orderBoxList then
            InfCore.Log("WARNING: missionTable.sequence.missionStartPosition.orderBoxList==nil")
            missionStartPosition.orderBoxList={}
          end
          for i,boxName in ipairs(missionInfo.orderBoxList)do
            InfUtil.InsertUniqueInList(missionStartPosition.orderBoxList,boxName)
          end
        end--if missionInfo.orderBoxList

        if missionInfo.orderBoxBlockList then
          if not orderBoxListModule then
            InfCore.Log("WARNING: no _orderBoxList module for "..missionCode)
          else
            local missionLocation=TppPackList.GetLocationNameFormMissionCode(missionInfo.missionCode)--TODO this function is slow
            if missionLocation==freeRoamLocation then
              orderBoxListModule.orderBoxBlockList[missionInfo.missionCode]=missionInfo.orderBoxBlockList
            end
          end
        end--missionInfo.orderBoxBlockList
      end--for this.missionInfo
    end--if freeRoamLocation

    if this.debugModule then
      InfCore.PrintInspect(missionStartPosition.orderBoxList,"missionStartPosition.orderBoxList")
      InfCore.PrintInspect(orderBoxListModule,"orderBoxListModule")
    end

  end--if IsFreeMission

end

function this.Init(missionTable)
  -- OFF
  --tex Original in TppResult.Init ,  TODO: log to see when this is called in relation to that
  --  if TppUiCommand.RegisterMbMissionListFunction then
  --    if TppUiCommand.IsTppUiReady()then
  --    InfCore.LogFlow("TppUiCommand.RegisterMbMissionListFunction InfMission.GetMbMissionListParameterTable")
  --    --TppUiCommand.RegisterMbMissionListFunction("InfMission","GetMbMissionListParameterTable")
  --    end
  --  end

  --tex TODO figure out zone system,
  local missionInfo=this.missionInfo[vars.missionCode]
  if missionInfo then
    --tex KLUDGE: this was originally when I was thrashing out the mission addons and messing with OMBS and mgo maps just to kill the out of bounds system,
    --but now it's kind of stuck since those are still being passed around.
    --So now you have to manually add the flag to the mission addon module so it 'enables' it,
    --when really it's just not-disabling it.
    if not missionInfo.enableOOB then
      --tex in tppmission.init
      mvars.mis_isAlertOutOfMissionArea=false

      --tex in tppui init
      TppUiCommand.HideInnerZone()
      TppUiCommand.HideOuterZone()
    end
  end
end

function this.LoadMissionManual(missionCode)
  local loadDirect=false--DEBUGNOW

  --TppMission.Load( tonumber(settingStr), vars.missionCode, { showLoadingTips = false } )
  --TppMission.RequestLoad(tonumber(settingStr),vars.missionCode,{force=true,showLoadingTips=true})--,ignoreMtbsLoadLocationForce=mvars.mis_ignoreMtbsLoadLocationForce})
  --TppMission.RequestLoad(10036,vars.missionCode,{force=true,showLoadingTips=true})--,ignoreMtbsLoadLocationForce=mvars.mis_ignoreMtbsLoadLocationForce})
  if loadDirect then
    gvars.mis_nextMissionCodeForMissionClear=missionCode
    mvars.mis_showLoadingTipsOnMissionFinalize=false
    --mvars.heli_missionStartRoute
    --mvars.mis_nextLayoutCode
    --mvars.mis_nextClusterId
    --mvars.mis_ignoreMtbsLoadLocationForce

    TppMission.ExecuteMissionFinalize()
  else
    TppMission.ReserveMissionClear{
      missionClearType=TppDefine.MISSION_CLEAR_TYPE.FROM_HELISPACE,
      nextMissionId=missionCode,
    }
  end
end

function this.GetMissionCodes()
  return {
    --LOC,TYPE,Notes
    --    "1",--INIT
    --    "5",--TITLE
    --storyMissions
    "10010",--CYPR
    "10020",
    "10030",
    "10036",
    "10043",
    "10033",
    "10040",
    "10041",
    "10044",
    "10052",
    "10054",
    "10050",
    "10070",
    "10080",
    "10086",
    "10082",
    "10090",
    "10195",
    "10091",
    "10100",
    "10110",
    "10121",
    "10115",
    "10120",
    "10085",
    "10200",
    "10211",
    "10081",
    "10130",
    "10140",
    "10150",
    "10151",
    "10045",
    "10156",
    "10093",
    "10171",
    "10240",
    "10260",
    "10280",--CYPR
    --hard missions
    "11043",
    "11041",--missingno
    "11054",
    "11085",--missingno
    "11082",
    "11090",
    "11036",--missingno
    "11033",
    "11050",
    "11091",--missingno
    "11195",--missingno
    "11211",--missingno
    "11140",
    "11200",--missingno
    "11080",
    "11171",--missingno
    "11121",
    "11115",--missingno
    "11130",
    "11044",
    "11052",--missingno
    "11151",
    --
    --"10230",--FLYK,missing completely, chap 3, no load
    --in PLAY_DEMO_END_MISSION, no other refs
    --    "11070",
    --    "11100",
    --    "11110",
    --    "11150",
    --    "11240",
    --    "11260",
    --    "11280",
    --    "11230",
    --free mission
    "30010",--AFGH,FREE
    "30020",--MAFR,FREE
    "30050",--MTBS,FREE
    "30150",--MTBS,MTBS_ZOO,FREE
    "30250",--MBQF,MBTS_WARD,FREE
    --heli space
    "40010",--AFGH,AFGH_HELI,HLSP
    "40020",--MAFR,MAFR_HELI,HLSP
    "40050",--MTBS
  --"40060",--HLSP,HELI_SPACE,--no load
  --online
  --"50050",--MTBS,FOB
  --select??
  --"60000",--SELECT --6e4
  --show demonstrations (not demos lol)
  --    "65020",--AFGH,e3_2014
  --    "65030",--MTBS,e3_2014
  --    "65050",--MAFR??,e3_2014
  --    "65060",--MAFR,tgs_2014
  --    "65414",--gc_2014
  --    "65415",--tgs_2014
  --    "65416",--tgs_2014
  }
end

return this
