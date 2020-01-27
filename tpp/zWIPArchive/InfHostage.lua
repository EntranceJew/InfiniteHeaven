--InfHostage.lua WIP DEBUGWIP DEBUGNOW
local this={}

--LOCALOPT
local InfMain=InfMain
local NULL_ID=GameObject.NULL_ID
local GetGameObjectId=GameObject.GetGameObjectId
local SendCommand=GameObject.SendCommand

this.debugModule=false

this.numHostages=30--4--SYNC num locators--DEBUGWIP

this.hostageNames={}

this.hostageTypes={}--DEBUGNOW

--DEBUGNOW
this.packages={
  afgh={
    "/Assets/tpp/pack/mission2/ih/ih_hostage_prs3.fpk",
    "/Assets/tpp/pack/mission2/ih/ih_hostage_loc4.fpk",
  },
  mafr={
    "/Assets/tpp/pack/mission2/common/mis_com_mafr_hostage_woman.fpk",
    "/Assets/tpp/pack/mission2/ih/ih_hostage_prs6_def.fpk",
    "/Assets/tpp/pack/mission2/ih/ih_hostage_loc4.fpk",
  }
}

function this.PostAllModulesLoad()
  this.hostageNames=InfLookup.GenerateNameList("ih_hostage_%04d",this.numHostages)
end

function this.AddMissionPacks(missionCode,packPaths)
  if not Ivars.mbAdditionalNpcs:EnabledForMission() then
    return
  end

  if InfMain.IsMbEvent() then
    return
  end

  --DEBUGWIP

    local additionalMobs=true--DEBUGNOW TODO Ivar
    --if additionalMobs then--DEBUGNOW


    --DEBUGNOW
    local goodSys=true
    local hostageMob=true
    if goodSys then
      local bodyTypes={}
      for hostageName,npcInfo in pairs(this.npcInfo)do
        bodyTypes[npcInfo.bodyType]=true
      end
      for bodyType,bool in pairs(bodyTypes)do
        local bodyInfo=InfBodyInfo.bodyInfo[bodyType]
        if bodyInfo and bodyInfo.partsPathHostage then
          InfEneFova.AddBodyPackPaths(bodyInfo,"HOSTAGE")
        end
      end
      InfCore.PrintInspect(bodyTypes,"bodyTypes")--DEBUGNOW

      if hostageMob then--DEBUGNOW
        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage2mob.fpk"
        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage2mob_def12.fpk"
        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_loc30.fpk"
      else
        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_def.fpk"
        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_loc4.fpk"
      end

      if TppHostage2.SetUniquePartsPath then
        local uniquePartsPath={}
        for hostageName,npcInfo in pairs(this.npcInfo)do
          local bodyInfo=InfBodyInfo.bodyInfo[npcInfo.bodyType]
          if bodyInfo and bodyInfo.partsPathHostage then
            uniquePartsPath[hostageName]=bodyInfo.partsPathHostage
          end
        end

        for locatorName,parts in pairs(uniquePartsPath)do
          TppHostage2.SetUniquePartsPath{gameObjectType="TppHostage2",locatorName=locatorName,parts=parts}
        end
        InfCore.PrintInspect(uniquePartsPath,"uniquePartsPath")--DEBUGNOW

        local settings={}
        for hostageName,npcInfo in pairs(this.npcInfo)do
          if npcInfo.bodyId or npcInfo.faceId then
            settings[#settings+1]={type="hostage",name=hostageName,bodyId=npcInfo.bodyId,faceId=npcInfo.faceId}
          end
        end
        if #settings>0 then
          TppEneFova.AddUniqueSettingPackage(settings)
        end
      end

    else
      --TODO: running into the crash from quit from title after exiting from load with just
      --          packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/common/mis_com_mafr_hostage.fpk"
      --        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_def.fpk"
      --        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_loc4.fpk"
      --changelog says I fixed similar issue in r179, but I don't remeber how lol
      --but comparing r179 r178 it seems I did remove hostage entitie defs from f30050_npc.fox2

      --DEBUGNOW experiment/manual
      this.hostageTypes={--DEBUGNOW
        --        "PRISONER_AFGH",
        --        "PRISONER_MAFR",
        --        "PRISONER_AFGH_FEMALE",
        --        "PRISONER_MAFR_FEMALE",
        --        "PATIENT",
        --        "DDS_RESEARCHER",
        --        "DDS_RESEARCHER_FEMALE",
        "DDS_GROUNDCREW",
        --"WSS1_MAIN0",
        --"DDS_PILOT1",
        "DDS_PILOT2",
      }

      for i,hostageType in ipairs(this.hostageTypes)do
        local bodyInfo=InfBodyInfo.bodyInfo[hostageType]
        if bodyInfo and bodyInfo.partsPathHostage then
        -- InfEneFova.AddBodyPackPaths(bodyInfo,"HOSTAGE")
        end
      end

      --packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_base.fpk"--DEBUGNOW
      --packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/prs2_main0_mdl.fpk"--DEBUGNOW
      --packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/dds4_main0_mdl.fpk"--DEBUGNOW
      packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/common/mis_com_mafr_hostage.fpk"


      --      if hostageMob then--DEBUGNOW
      --        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage2mob.fpk"
      --        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage2mob_def10.fpk"
      --        packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_loc12.fpk"
      --      else
      packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_def.fpk"
      packPaths[#packPaths+1]="/Assets/tpp/pack/mission2/ih/ih_hostage_loc4.fpk"
      -- end

      --DEBUGNOW
      local uniquePartsPath={
        --ih_hostage_0000="/Assets/tpp/parts/chara/prs/prs2_main0_def_v00_ih_hos.parts",
        ih_hostage_0000="/Assets/tpp/parts/chara/dds/dds4_main0_def_v00_ih_hos.parts",
      }
      for locatorName,parts in pairs(uniquePartsPath)do
      -- TppHostage2.SetUniquePartsPath{gameObjectType="TppHostage2",locatorName=locatorName,parts=parts}
      end

      local settings={
        {type="hostage",name="ih_hostage_0000",bodyId=300,faceId="male"},
        {type="hostage",name="ih_hostage_0001",bodyId=301,faceId="female"},
        {type="hostage",name="ih_hostage_0002",bodyId=302},
        {type="hostage",name="ih_hostage_0003",bodyId=303},
      }
      -- TppEneFova.AddUniqueSettingPackage(settings)
    end

    if TppHostage2.SetHostageType then
    --    TppHostage2.SetHostageType{gameObjectType="TppHostageUnique",hostageType="Volgin"}
    --    TppHostage2.SetHostageType{gameObjectType="TppHostage2",hostageType="Parasite"}
    --TppHostage2.SetHostageType{gameObjectType="TppHostage2",hostageType="NoStand"}
    --TppHostage2.SetHostageType{gameObjectType="TppHostage2",hostageType="Mob"}
    end






  --DEBUGNOW split from mbmobs

  if not Ivars.enableWildCardHostageFREE:EnabledForMission() then
    return
  end

  local locationName=InfUtil.GetLocationName()
  for i,packpath in ipairs(this.packages[locationName])do
    packPaths[#packPaths+1]=packpath
  end
end

function this.PreMissionLoad(missionCode,currentMissionId)
  --DEBUGWIP
  if missionCode==30050 then
    --    local bodies={TppEnemyBodyId.ddr0_main0_v00}
    --   TppSoldierFace.OverwriteMissionFovaData{body=bodies,additionalMode=true}

    --TppSoldierFace.SetBodyFovaUserType{hostage={TppEnemyBodyId.ddr0_main0_v00}}
    --TppHostage2.SetDefaultBodyFovaId{parts="/Assets/tpp/parts/chara/dds/ddr0_main0_def_v00.parts",bodyId=TppEnemyBodyId.ddr0_main0_v00}

    --    ddr0_main0_v00=146,
    --  ddr0_main0_v01=147,
    --  ddr0_main0_v02=148,

    --  ddr0_main1_v00=149,
    --  ddr0_main1_v01=150,
    --  ddr0_main1_v02=151,
    --  ddr0_main1_v03=152,
    --  ddr0_main1_v04=153,

    --  ddr1_main0_v00=154,
    --  ddr1_main0_v01=155,
    --  ddr1_main0_v02=156,
    --  ddr1_main1_v00=157,
    --  ddr1_main1_v01=158,
    --  ddr1_main1_v02=159,

    --ptn patients 300 303 ok
    --304 334 ? even though the fv2s are in the same fpk, missing some fmdls?

    local settings={
      {type="hostage",name="ih_hostage_0000",bodyId=300},
      {type="hostage",name="ih_hostage_0001",bodyId=301},
      {type="hostage",name="ih_hostage_0002",bodyId=302},
      {type="hostage",name="ih_hostage_0003",bodyId=303},
    }
    -- TppEneFova.AddUniqueSettingPackage(settings)

    local settings={
      --      {type="hostage",name="ih_hostage_0000",faceId="male"},
      --      {type="hostage",name="ih_hostage_0001",faceId="male"},
      --      {type="hostage",name="ih_hostage_0002",faceId="male"},
      --      {type="hostage",name="ih_hostage_0003",faceId="male"},
      --
      --      {type="hostage",name="ih_hostage_0004",faceId="female"},
      --      {type="hostage",name="ih_hostage_0005",faceId="female"},
      --      {type="hostage",name="ih_hostage_0006",faceId="female"},
      --      {type="hostage",name="ih_hostage_0008",faceId="female"},

      --      {type="hostage",name="ptn_p21_010410_0004",faceId=82,bodyId=348},
      --      {type="hostage",name="ptn_p21_010410_0005",faceId=2,bodyId=349},


      --      {type="hostage",name="ptn_p21_010410_0000",faceId=82,bodyId=146},
      --      {type="hostage",name="ptn_p21_010410_0001",faceId=2,bodyId=147},
      --      {type="hostage",name="ptn_p21_010410_0002",faceId=88,bodyId=148},
      --      {type="hostage",name="ptn_p21_010410_0003",faceId=93,bodyId=149},
      --      {type="hostage",name="ptn_p21_010410_0004",faceId=93,bodyId=150},
      --      {type="hostage",name="ptn_p21_010410_0005",faceId=93,bodyId=151},
      --      {type="hostage",name="ptn_p21_010410_0006",faceId=93,bodyId=152},
      --      {type="hostage",name="ptn_p21_010410_0007",faceId=93,bodyId=153},
      --
      --      {type="hostage",name="ptn_p21_010410_0008",faceId="female",bodyId=154},
      --      {type="hostage",name="ptn_p21_010410_0009",faceId="female",bodyId=155},
      --      {type="hostage",name="ptn_p21_010410_0010",faceId="female",bodyId=156},
      --      {type="hostage",name="ptn_p21_010410_0011",faceId="female",bodyId=157},
      --      {type="hostage",name="ptn_p21_010410_0012",faceId="female",bodyId=158},
      --      {type="hostage",name="ptn_p21_010410_0013",faceId="female",bodyId=159},


      --{type="hostage",name="ptn_p21_010410_0005",bodyId=TppEnemyBodyId.dct0_v01},--,bodyId=TppEnemyBodyId.ddr0_main1_v02},
      --{type="hostage",name="ptn_p21_010410_0006",faceId=108},--,bodyId=TppEnemyBodyId.ddr0_main1_v03},
      --{type="hostage",name="ptn_p21_010410_0007",faceId=128},--,bodyId=TppEnemyBodyId.ddr0_main1_v04},
      --    {type="hostage",name="ptn_p21_010410_0008",faceId="male",bodyId=TppEnemyBodyId.ddr0_main0_v00},
      --    {type="hostage",name="ptn_p21_010410_0009",faceId="male",bodyId=TppEnemyBodyId.ddr0_main0_v00},
      --    {type="hostage",name="ptn_p21_010410_0010",faceId="male",bodyId=TppEnemyBodyId.ddr0_main0_v00},
      }
    --TppEneFova.AddUniqueSettingPackage(settings)


  end--DEBUGWIP

  if not Ivars.enableWildCardHostageFREE:EnabledForMission(missionCode) then
    return
  end

  local settings={
    {type="hostage",name="ih_hostage_0000",faceId="female"},
    {type="hostage",name="ih_hostage_0001",faceId="female"},
    {type="hostage",name="ih_hostage_0002",faceId="female"},
    {type="hostage",name="ih_hostage_0003",faceId="female"},
  }
  TppEneFova.AddUniqueSettingPackage(settings)
end

function this.Init(missionTable)
  this.messageExecTable=nil

  if vars.missionCode~=30050 then--DEBUGNOW
    --  if not IvarProc.EnabledForMission(this.enableIvars) then
    return
  end

  if InfMain.IsMbEvent() then
    return
  end

  this.messageExecTable=Tpp.MakeMessageExecTable(this.Messages())

  --tex TODO don't know if I want uniques on a random cluster or the first the player loads on
  --probably better to be random, but have uniques in a few prominant positions
  for npcType,bool in pairs(this.uniqueChars)do
    this.npcOnClusters[npcType]=MotherBaseStage.GetFirstCluster()--ALT math.random(0,6)
  end
  InfCore.PrintInspect(this.npcOnClusters,"InfHostage.npcOnClusters")

  this.InitCluster()
end

function this.OnReload(missionTable)
  this.messageExecTable=nil

  if vars.missionCode~=30050 then--DEBUGNOW
    --if not IvarProc.EnabledForMission(this.enableIvars) then
    return
  end

  if InfMain.IsMbEvent() then
    return
  end

  this.messageExecTable=Tpp.MakeMessageExecTable(this.Messages())
end

function this.Messages()
  return Tpp.StrCode32Table{
    MotherBaseStage={
      --{msg="MotherBaseCurrentClusterLoadStart",func=this.MotherBaseCurrentClusterLoadStart},
      {msg="MotherBaseCurrentClusterActivated",func=this.MotherBaseCurrentClusterActivated},
    },
  }
end
function this.OnMessage(sender,messageId,arg0,arg1,arg2,arg3,strLogText)
  if vars.missionCode~=30050 then--DEBUGNOW
    --if not IvarProc.EnabledForMission(this.enableIvars) then
    return
  end

  if InfMain.IsMbEvent() then
    return
  end

  Tpp.DoMessage(this.messageExecTable,TppMission.CheckMessageOption,sender,messageId,arg0,arg1,arg2,arg3,strLogText)
end

function this.SetUpEnemy(missionTable)
  if Ivars.enableWildCardHostageFREE:EnabledForMission() then
    this.SetupHostagesFree(missionTable)
  end
end
function this.SetupHostagesFree(missionTable)
  if not Ivars.enableWildCardHostageFREE:EnabledForMission() then
    return
  end

  InfMain.RandomSetToLevelSeed()

  --  TppHostage2.SetHostageType{
  --    gameObjectType="TppHostage2",
  --    hostageType="NoStand",
  --  }

  for i,hostageName in ipairs(this.hostageNames)do
    local hostageId=GetGameObjectId(hostageName)
    if hostageId==NULL_ID then
    else
      InfSoldier.RegenerateStaffParams(hostageId)

      local voices={
        "hostage_a",
        "hostage_b",
        "hostage_c",
        "hostage_d",
      }
      local rndVoice=voices[math.random(#voices)]
      GameObject.SendCommand(hostageId,{id="SetVoiceType",voiceType=rndVoice})
      --REF
      --"pashto"
      --          local defaultLanguages={
      --            afgh="russian",
      --            mafr="afrikaans",
      --          }
      --          local locationName=InfUtil.GetLocationName()
      --          local langType=hostageInfo.langType or defaultLanguages[locationName] or "english"
      --          local isFemale=GameObject.SendCommand(gameId,{id="isFemale"})
      --          if isFemale then
      --            langType="english"
      --          end
      local langType="english"
      GameObject.SendCommand(hostageId,{id="SetLangType",langType=langType})


      --      local hostagePos=Vector3(vars.playerPosX,vars.playerPosY,vars.playerPosZ)
      --          local hostagePos=Vector3(2,1,4)
      --
      --      local command={id="Warp",degRotationY=vars.playerRotY,position=hostagePos)}
      --      GameObject.SendCommand(hostageId,command)-
    end
  end

  local jeepsWithSeats={}

  local enemyTable=missionTable.enemy
  local soldierDefine=enemyTable.soldierDefine
  local patrolVehicleInfo=InfVehicle.inf_patrolVehicleInfo
  for cpName,cpDefine in pairs(soldierDefine)do
    local vehicleName=cpDefine.lrrpVehicle
    if vehicleName then
      if InfVehicle.inf_patrolVehicleInfo then
        local vehicleDef=patrolVehicleInfo[vehicleName]
        if vehicleDef then
          if vehicleDef.baseType=="LIGHT_VEHICLE" then--jeep
            --            InfCore.Log("InfHostage.SetupEnemy found jeep")--DEBUG
            --            InfCore.PrintInspect(cpDefine)--DEBUG
            local numSeats=InfSoldier.GetNumSeats(vehicleName)

            if #cpDefine<numSeats then
              jeepsWithSeats[#jeepsWithSeats+1]=vehicleName
            end
          end
        end
      end
    end
  end

  if this.debugModule then
    InfCore.PrintInspect(jeepsWithSeats,{varName="jeepsWithSeats"})
  end

  for i,hostageName in ipairs(this.hostageNames)do
    if #jeepsWithSeats==0 then
      break
    end

    local hostageId=GetGameObjectId(hostageName)
    if hostageId==NULL_ID then
    else
      local vehicleName=InfUtil.GetRandomPool(jeepsWithSeats)
      if vehicleName==nil then
      else
        InfCore.Log("InfHostage.SetupEnemy: Adding "..hostageName.." to "..vehicleName)

        local vehicleId=GetGameObjectId(vehicleName)

        --TppEnemy.RegistHoldRecoveredState(vehicleName)

        local command={
          id="SetHostage2Flag",
          flag="unlocked",
          on=true,
        }
        SendCommand(hostageId,command)

        local vehiclePos=SendCommand(vehicleId,{id="GetPosition"})
        --InfCore.Log(vehiclePos:GetX()..","..vehiclePos:GetY()..","..vehiclePos:GetZ())--DEBUG

        local vehiclePos=Vector3(vehiclePos:GetX(),vehiclePos:GetY()+2,vehiclePos:GetZ())
        local command={id="Warp",position=vehiclePos,degRotationY=0}
        SendCommand(hostageId,command)
        --tex TODO no go for some reason, think it requires route
        local setVehicle={id="SetRelativeVehicle",targetId=vehicleId,rideFromBeginning=true}
        --SendCommand(hostageId,setVehicle)
      end
    end
  end

  InfMain.RandomResetToOsTime()
end

function this.DEBUG_WarpHostagesToPlayerPos()--
  local hostageNames={
    --"hos_quest_0000",
    "ih_hostage_0000",
    "ih_hostage_0001",
    "ih_hostage_0002",
    "ih_hostage_0003",
  }

for i,hostageName in ipairs(hostageNames)do
  local hostageObject=GetGameObjectId(hostageName)

  if hostageObject==NULL_ID then
    InfCore.Log(hostageName.."==NULL_ID",true)
  else
    local playerPos=Vector3(vars.playerPosX,vars.playerPosY,vars.playerPosZ)
    local command={id="Warp",degRotationY=vars.playerRotY,position=playerPos}
    GameObject.SendCommand(hostageObject,command)
  end
end
end

function this.DEBUG_SomeHostageShiz()
  local hostageNames={
    --"hos_quest_0000",
    "ih_hostage_0000",
    "ih_hostage_0001",
    "ih_hostage_0002",
    "ih_hostage_0003",
  }
  for i,hostageName in ipairs(hostageNames)do
    local hostageId=GetGameObjectId(hostageName)


    TppEnemy.RegistHoldRecoveredState(hostageName)


    local command={
      id="SetHostage2Flag",
      flag="unlocked",
      on=true,
    }
    SendCommand(hostageId,command)
    --
    --                 TppHostage2.SetHostageType{
    --      gameObjectType  = "TppHostage2",
    --      hostageType   = "Mob",
    --    }


    --     GameObject.SendCommand( hostageId, { id = "SetFollowed", enable = true } )
    --     local command={id="SetHostage2Flag",flag="commonNpc",on=true}
    --     GameObject.SendCommand( hostageId,command)

    local command = { id = "SetNoticeState", state = TppGameObject.HOSTAGE_NOTICE_STATE_FLEE }
    SendCommand(hostageId,command)


    local vehicleId=GetGameObjectId("veh_lv_0002")
    local setVehicle={id="SetRelativeVehicle",targetId=vehicleId,rideFromBeginning=true}
    SendCommand(hostageId,setVehicle)
  end
end

--DEBUGNOW
--tex used to limit unique charaters to one cluster so they dont magically transport to other clusters as you do
this.npcOnClusters={
  }


--tex buch of these  too short/repeating with too specific action to make good idle
this.motionPaths={
  --OFF  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_a_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_b_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_c_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_d_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_e_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_f_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_g_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_h_idl.gani",
  --OFF  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_i_idl.gani",--clutching side,
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_j_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_k_idl.gani",
--OFF  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_l_idl.gani",
--OFF  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_m_idl.gani",
--OFF "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_ish_idl.gani",--leaning over quite a bit
}

this.motionPathsSleeping={
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_cutn_01_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_cutn_02_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_cutn_03_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_cutn_01_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_cutn_02_idl.gani",
}

--tex TODO: find mtar these are in
this.moreMotionPaths={
  "/Assets/tpp/motion/SI_game/fani/bodies/nrs0/nrs0/nrs0_guilty_a_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/nrs0/nrs0/nrs0_guilty_b_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/nrs0/nrs0/nrs0_guilty_c_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/dct0/dct0/dct0_guilty_a_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/dct0/dct0/dct0_guilty_b_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/dct0/dct0/dct0_guilty_a_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/dct0/dct0/dct0_guilty_a_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/dct0/dct0/dct0_tuto_idl.gani",
  "/Assets/tpp/motion/SI_game/fani/bodies/nrs0/nrs0/nrs0_tuto_idl.gani",
}

--DEBUGNOW
--{"Command","Combat","Develop","Support","Medical","Spy","BaseDev"}
--DEBUGNOW teleport to each and check cluterid, fix walkgergear if so

--DEBUGNOW these positions are for layout003

--[clusterId][platId]
this.npcPositions={
  --command
  {
    --main
    {
      {pos={-15.070,20.800,24.918},rotY=176.028,},--command looking at code talker orig pos
      {pos={-1.389,24.802,4.863},rotY=-0.044,}, --command upper helipad under eaves
      {pos={-8.524,24.800,-2.706},rotY=-57.954,},--upper looking toward intel dome
      {pos={6.174,24.825,-5.242},rotY=93.085,},--outside core door overlooking command plats
      {pos={0.997,20.800,-1.294},rotY=17.494,},--
      {pos={22.476,0.800,1.900},rotY=155.419,},--
      {pos={20.986,0.800,-2.108},rotY=-34.112,},--
      {pos={10.943,0.800,20.757},rotY=39.755,},--
      {pos={18.199,0.800,20.015},rotY=91.617,},--
      {pos={20.078,0.800,21.038},rotY=60.013,},--
      {pos={-12.544,0.800,24.727},rotY=-83.662,},--
      {pos={-19.198,0.798,28.951},rotY=-2.266,},--
      {pos={-32.830,0.798,15.040},rotY=-124.140,},--
      {pos={-18.755,0.800,-5.655},rotY=-170.810,},--
      {pos={-8.265,0.800,-1.633},rotY=-80.527,},--
      {pos={-17.946,0.800,4.842},rotY=-92.019,},--
      {pos={-7.051,0.800,19.366},rotY=-147.335,},--
      {pos={-4.819,0.800,-19.002},rotY=-25.023,},--
      {pos={0.799,0.800,-18.767},rotY=66.884,},--
      {pos={-19.555,4.800,-18.518},rotY=-144.732,},--
      {pos={-22.456,4.800,-7.170},rotY=-40.297,},--
      {pos={-14.467,4.800,20.937},rotY=34.957,},--
      {pos={24.396,8.800,0.053},rotY=90.567,},--
      {pos={13.745,12.800,26.653},rotY=42.258,},--
      {pos={-17.262,12.800,2.391},rotY=45.731,},--
      {pos={-15.061,12.800,-17.886},rotY=114.731,},--
      {pos={-1.819,12.800,-5.867},rotY=148.967,},--
      {pos={23.391,12.800,-2.974},rotY=104.796,},--
      {pos={-7.582,16.800,-4.632},rotY=-159.934,},--
      {pos={-23.082,16.800,-8.944},rotY=-66.051,},--
      {pos={-8.004,20.800,-3.626},rotY=-121.567,},--
      {pos={12.717,0.800,-28.643},rotY=-154.735,},--command lower helipad in square looking out
    },
    {--command plat 1
      {pos={115.799,0.800,-4.337},rotY=115.064,},--next to walker pos
      {pos={138.609,-3.200,14.213},rotY=-106.014,},--
      {pos={133.789,-3.200,21.330},rotY=-59.577,},--
      {pos={127.105,-3.200,10.110},rotY=75.833,},--
      {pos={88.830,0.800,18.599},rotY=-95.874,},--
      {pos={83.394,0.862,26.296},rotY=-59.053,},--
      {pos={101.831,0.798,-32.518},rotY=-179.963,},--
      {pos={124.208,0.800,-29.460},rotY=-55.440,},--
      {pos={134.706,0.800,-28.546},rotY=113.276,},--
      {pos={137.220,0.798,-32.362},rotY=-177.108,},--
      {pos={146.694,0.800,-20.950},rotY=-15.898,},--
      {pos={119.408,0.800,13.611},rotY=106.680,},--
      {pos={147.830,0.800,3.533},rotY=77.999,},--helipad left side
    },
    {--command plat 2
      {pos={234.865,0.800,-58.714},rotY=-29.576,},--next to walker pos
      {pos={204.471,0.800,-45.697},rotY=7.381,},
      {pos={218.293,0.798,-44.346},rotY=64.339,},
      {pos={226.915,0.798,-47.749},rotY=51.977,},
      {pos={190.294,0.800,-92.213},rotY=-136.231,},
      {pos={174.578,-0.204,-86.219},rotY=-61.783,},
      {pos={186.005,0.796,-97.328},rotY=-167.162,},
      {pos={192.986,0.800,-105.771},rotY=178.287,},
      {pos={204.433,0.798,-118.630},rotY=-175.011,},
      {pos={208.691,0.863,-123.608},rotY=-72.476,},
      {pos={248.138,0.797,-85.541},rotY=94.239,},
      {pos={238.400,0.800,-73.211},rotY=-71.482,},
      {pos={247.675,0.797,-85.869},rotY=167.248,},--helipad right
    },
    {--command plat 3
      {pos={204.471,0.800,-45.697},rotY=7.381,},
      {pos={218.293,0.798,-44.346},rotY=64.339,},
      {pos={226.915,0.798,-47.749},rotY=51.977,},
      {pos={234.865,0.800,-58.714},rotY=-29.576,},
      {pos={190.294,0.800,-92.213},rotY=-136.231,},
      {pos={174.578,-0.204,-86.219},rotY=-61.783,},
      {pos={186.005,0.796,-97.328},rotY=-167.162,},
      {pos={192.986,0.800,-105.771},rotY=178.287,},
      {pos={204.433,0.798,-118.630},rotY=-175.011,},
      {pos={208.691,0.863,-123.608},rotY=-72.476,},
      {pos={248.138,0.797,-85.541},rotY=94.239,},
      {pos={238.400,0.800,-73.211},rotY=-71.482,},
      {pos={325.164,0.800,-53.336},rotY=9.314,},
      {pos={328.353,0.800,-54.714},rotY=172.036,},
      {pos={309.296,0.798,-37.986},rotY=-15.134,},
      {pos={305.851,0.800,-52.341},rotY=-70.063,},
      {pos={310.881,0.800,-51.147},rotY=97.076,},
      {pos={321.217,0.798,-34.227},rotY=-8.461,},
      {pos={319.174,0.798,-99.535},rotY=-146.480,},
      {pos={305.833,-0.202,-92.193},rotY=-77.814,},
      {pos={298.470,0.863,-73.032},rotY=-45.055,},
      {pos={341.044,0.800,-95.255},rotY=-106.012,},
      {pos={361.274,0.863,-99.274},rotY=-177.263,},
      {pos={363.431,0.800,-88.255},rotY=77.581,},
      {pos={363.373,0.798,-72.880},rotY=85.897,},
      {pos={364.583,0.800,-65.446},rotY=93.349,},
      {pos={375.331,0.800,-55.283},rotY=6.301,},
      {pos={355.675,0.798,-34.692},rotY=8.389,},
      {pos={322.791,4.800,-46.608},rotY=52.401,},--top of that vehicle lift square thing --ELEVATED
    },
  },
  --combat
  {
    {
      {pos={1107.550,0.800,-613.607},rotY=-129.872,},--eaves med side
      {pos={1094.703,-0.202,-604.137},rotY=-62.551,},--ground outer walkway overlook med
      {pos={1125.146,0.800,-581.443},rotY=-33.777,},--eaves r&d
      {pos={1150.264,0.800,-592.433},rotY=-33.450,},--walker pos
      {pos={1154.808,0.800,-602.553},rotY=-34.242,},--shower
      {pos={1110.128,0.800,-607.906},rotY=113.499,},--passageway 2doors
      {pos={1135.134,4.800,-608.884},rotY=145.496,},--f1 entrance
      {pos={1142.560,9.800,-596.879},rotY=141.275,},--f2 raised plat elec cabinet
      {pos={1121.479,8.800,-600.558},rotY=-31.299,},--f2 eaves bridge overlook
      {pos={1128.686,8.800,-607.253},rotY=-133.662,},--f2 eaves doorcubby
      {pos={1117.558,4.800,-598.112},rotY=-51.426,},--f2 doorway power switch bridge overlook
      {pos={1133.797,28.850,-610.000},rotY=158.761,},--topf overlook
      {pos={1128.498,28.850,-609.337},rotY=-109.123,},--topf overlook2
      {pos={1118.996,28.800,-601.950},rotY=-47.131,},--topf overlook3
      {pos={1135.354,28.850,-605.245},rotY=126.098,},--topf overlook4
      {pos={1155.885,0.800,-626.247},rotY=130.847,},--combat main helipad
    },
    {
      {pos={1136.231,0.798,-760.292},rotY=-131.025,},
      {pos={1164.339,0.797,-760.095},rotY=137.074,},
      {pos={1176.423,0.798,-722.209},rotY=57.170,},
      {pos={1161.336,0.800,-702.536},rotY=-16.442,},
      {pos={1132.828,-0.200,-716.895},rotY=67.930,},
      {pos={1129.153,-0.200,-723.359},rotY=-150.462,},
      {pos={1110.214,0.798,-715.511},rotY=-12.713,},
      {pos={1115.899,-0.204,-704.599},rotY=39.451,},
      {pos={1120.087,0.800,-726.070},rotY=119.111,},
      {pos={1113.951,0.800,-734.504},rotY=-159.593,},
      {pos={1110.210,0.798,-734.563},rotY=-51.364,},
      {pos={1113.700,0.800,-749.054},rotY=160.958,},
      {pos={1122.059,0.800,-759.076},rotY=85.150,},
      {pos={1129.141,0.800,-754.043},rotY=83.206,},
      {pos={1148.184,0.800,-741.441},rotY=-169.141,},
      {pos={1147.399,0.800,-737.192},rotY=177.510,},
      {pos={1146.073,0.800,-761.718},rotY=-151.643,},--combat plat1 helipad
    },
    {
      {pos={1203.959,0.798,-801.051},rotY=-70.144,},
      {pos={1200.518,-0.202,-816.577},rotY=-118.528,},
      {pos={1220.292,0.800,-830.370},rotY=160.825,},
      {pos={1233.519,0.800,-843.444},rotY=-104.589,},
      {pos={1244.820,0.798,-848.294},rotY=119.332,},
      {pos={1254.436,0.798,-832.956},rotY=75.549,},
      {pos={1272.714,0.797,-814.587},rotY=60.580,},
      {pos={1277.865,0.863,-808.936},rotY=101.152,},
      {pos={1273.467,0.800,-799.590},rotY=13.103,},
      {pos={1262.964,0.800,-789.172},rotY=4.427,},
      {pos={1264.676,0.800,-801.014},rotY=174.399,},
      {pos={1256.255,0.800,-810.974},rotY=-152.949,},
      {pos={1260.909,0.800,-803.276},rotY=-38.561,},
      {pos={1252.221,-3.200,-825.910},rotY=119.013,},
      {pos={1232.150,-3.200,-834.191},rotY=-107.594,},
      {pos={1225.118,-3.200,-826.665},rotY=-7.313,},
      {pos={1247.724,-3.200,-832.050},rotY=148.350,},
      {pos={1245.051,-3.200,-826.208},rotY=-99.049,},
      {pos={1237.473,-3.200,-827.814},rotY=-14.614,},
      {pos={1243.325,-3.200,-816.283},rotY=44.295,},
      {pos={1226.480,1.800,-816.368},rotY=-132.600,},
      {pos={1262.262,0.800,-827.466},rotY=116.030,},--combat plat2 helipad
      {pos={1252.925,4.800,-807.273},rotY=-134.806,},--next to walker pos, top of that vehicle lift square thing --ELEVATED
    },
    {
      {pos={1325.596,0.862,-809.458},rotY=-111.525,},
      {pos={1331.508,-0.202,-818.257},rotY=-136.790,},
      {pos={1343.193,0.798,-827.269},rotY=172.595,},
      {pos={1367.144,0.800,-824.292},rotY=50.663,},
      {pos={1382.682,0.800,-824.386},rotY=-141.340,},
      {pos={1381.831,0.798,-762.808},rotY=-24.482,},
      {pos={1358.548,0.798,-761.567},rotY=31.563,},
      {pos={1334.964,0.798,-766.588},rotY=-63.610,},
      {pos={1329.044,0.800,-783.836},rotY=-98.876,},
      {pos={1347.949,-3.200,-771.547},rotY=15.303,},
      {pos={1342.862,-3.200,-792.030},rotY=-124.407,},
      {pos={1345.345,-3.200,-784.520},rotY=-36.817,},
      {pos={1369.686,0.800,-814.022},rotY=-106.066,},
      {pos={1371.479,1.800,-806.825},rotY=-85.575,},
      {pos={1378.243,1.800,-778.822},rotY=-14.375,},
      {pos={1390.848,0.800,-791.756},rotY=107.475,},--combat plat3 helipad
    },
  },
  --develop
  {
    --main
    {
      --r&d aipod/sahel pit
      --researcher, ground crew, characters
      {pos={1186.687,20.798,317.456},rotY=-108.292,},--
      {pos={1184.219,20.798,310.037},rotY=17.097,},--
      {pos={1181.865,20.798,321.180},rotY=21.767,},--
      {pos={1187.345,21.803,320.608},rotY=101.350,},--
      {pos={1191.868,21.803,322.071},rotY=-128.473,},--
      {pos={1192.484,21.803,320.006},rotY=-94.921,},--
      {pos={1191.019,23.050,329.068},rotY=-134.593,except={KAZ=true}},--ELEVATED
      {pos={1173.625,22.014,314.806},rotY=85.081,except={KAZ=true}},--ELEVATED

      {pos={1195.339,28.800,328.074},rotY=-134.556,},--overlooking pit
      {pos={1178.531,28.800,306.269},rotY=53.914,},--overlooking pit2
      {pos={1177.293,28.800,291.906},rotY=47.236,},--upper, machine with screen
      {pos={1199.309,24.800,305.900},rotY=48.848,},--between buildings two doors on walkway
      {pos={1201.835,16.800,304.952},rotY=-103.831,},--between buildings two doors on walkway one lower
      {pos={1191.951,16.800,298.702},rotY=-145.436,},--between buildings two doors on walkway one lower2
      {pos={1203.078,15.800,293.779},rotY=111.954,},--covered passage next to door
      {pos={1180.676,8.800,285.566},rotY=-137.589,},--covered passage2 looking over bridge
      {pos={1160.131,20.800,298.772},rotY=-110.381,},--walkway overlooking mb
      {pos={1168.636,20.800,288.161},rotY=-137.489,},--walkway overlooking bridge
      {pos={1169.538,12.800,300.118},rotY=38.722,},--covered passage3
      {pos={1161.451,12.800,297.225},rotY=-145.108,},--walkway overlooking bridge2

      {pos={1208.461,0.800,329.816},rotY=-13.650,},--r and d main helipad
      {pos={1195.817,32.800,281.671},rotY=87.793,},--upper helipad
      {pos={1192.044,32.800,277.948},rotY=-171.377,},--upper helipad2
    },
    {
      {pos={1277.597,0.863,310.668},rotY=-31.779,},
      {pos={1282.262,0.818,302.036},rotY=-116.126,},
      {pos={1284.291,-0.202,293.358},rotY=-145.761,},
      {pos={1290.720,-0.204,286.609},rotY=-62.022,},
      {pos={1297.732,0.798,284.273},rotY=-143.647,},
      {pos={1319.827,0.798,284.158},rotY=-141.387,},
      {pos={1333.638,0.798,284.185},rotY=-164.967,},
      {pos={1346.191,0.862,290.646},rotY=128.793,},
      {pos={1342.503,0.798,310.309},rotY=65.308,},
      {pos={1332.506,0.800,347.855},rotY=-37.947,},
      {pos={1312.552,0.798,349.632},rotY=-12.315,},
      {pos={1301.329,0.798,350.219},rotY=-70.887,},
      {pos={1293.108,0.798,345.948},rotY=-29.919,},
      {pos={1284.924,0.800,331.622},rotY=-0.126,},
      {pos={1344.188,0.800,320.030},rotY=74.442,},--r and d plat1 helipad
    },
    {
      {pos={1374.242,0.862,250.514},rotY=140.896,},
      {pos={1371.685,-0.202,239.837},rotY=-105.542,},
      {pos={1381.463,0.796,220.248},rotY=177.202,},
      {pos={1393.823,0.800,210.292},rotY=-33.721,},
      {pos={1400.452,0.800,203.313},rotY=118.525,},
      {pos={1413.629,0.800,200.535},rotY=77.592,},
      {pos={1428.363,0.798,215.289},rotY=160.572,},
      {pos={1444.478,0.797,230.451},rotY=84.900,},
      {pos={1448.300,0.863,235.129},rotY=102.540,},
      {pos={1443.786,0.800,245.041},rotY=35.653,},
      {pos={1431.270,0.798,260.370},rotY=32.830,},
      {pos={1423.655,0.798,268.634},rotY=-12.349,},
      {pos={1412.187,0.798,273.994},rotY=-2.486,},
      {pos={1402.948,0.798,274.042},rotY=-50.924,},
      {pos={1397.353,0.800,267.173},rotY=-39.188,},
      {pos={1398.265,0.800,256.625},rotY=-143.310,},
      {pos={1432.527,0.800,216.973},rotY=161.896,},--r and d plat2 helipad
    },
    {
      {pos={1495.865,0.863,243.180},rotY=88.531,},
      {pos={1501.755,0.798,230.287},rotY=-127.470,},
      {pos={1514.123,0.798,216.664},rotY=-168.384,},
      {pos={1524.492,0.796,218.580},rotY=142.080,},
      {pos={1548.316,0.800,218.898},rotY=136.032,},
      {pos={1563.759,0.798,225.385},rotY=75.696,},
      {pos={1559.748,0.798,245.426},rotY=109.788,},
      {pos={1553.230,0.798,281.376},rotY=54.528,},
      {pos={1531.231,0.800,280.270},rotY=13.560,},
      {pos={1518.477,0.798,282.730},rotY=-49.173,},
      {pos={1510.614,0.798,279.024},rotY=25.070,},
      {pos={1500.889,0.800,268.740},rotY=175.479,},
      {pos={1561.935,0.800,252.879},rotY=151.662,},--r and d plat3 helipad
    },
  },
  --support
  {
    --main
    {
      --support main basement plants
      --researcher,characters?
      --may look a bit odd if theyre standing right on rats in sideop lol
      {pos={359.289,-4.013,858.222},rotY=141.763,except={DDS_GROUNDCREW=true},},--
      {pos={359.289,-4.013,858.222},rotY=141.763,except={DDS_GROUNDCREW=true},},--
      {pos={357.656,-4.013,851.733},rotY=-50.512,except={DDS_GROUNDCREW=true},},--
      {pos={356.429,-4.013,854.618},rotY=-88.528,except={DDS_GROUNDCREW=true},},--
      {pos={367.299,-4.013,848.299},rotY=135.103,except={DDS_GROUNDCREW=true},},--
      {pos={368.424,-4.013,858.881},rotY=48.018,except={DDS_GROUNDCREW=true},},--
      {pos={375.046,-4.013,857.026},rotY=-141.125,except={DDS_GROUNDCREW=true},},--
      {pos={374.705,-4.013,849.362},rotY=-133.565,except={DDS_GROUNDCREW=true},},--
      {pos={383.712,-4.013,848.737},rotY=-179.609,except={DDS_GROUNDCREW=true},},--
      {pos={386.119,-4.013,848.781},rotY=59.610,except={DDS_GROUNDCREW=true},},--
      {pos={382.996,-4.013,854.479},rotY=-61.963,except={DDS_GROUNDCREW=true},},--
      {pos={384.038,-4.013,856.722},rotY=-10.950,except={DDS_GROUNDCREW=true},},--
      {pos={383.189,-4.013,858.506},rotY=-59.514,except={DDS_GROUNDCREW=true},},--
      {pos={385.162,-4.013,866.424},rotY=7.842,except={DDS_GROUNDCREW=true},},--
      {pos={385.165,-4.013,866.444},rotY=7.842,except={DDS_GROUNDCREW=true},},--
      {pos={385.693,-4.013,869.991},rotY=-90.079,except={DDS_GROUNDCREW=true},},--
      {pos={376.689,-4.013,869.225},rotY=-119.923,except={DDS_GROUNDCREW=true},},--
      {pos={374.893,-4.013,867.593},rotY=-92.707,except={DDS_GROUNDCREW=true},},--
      {pos={373.922,-4.013,869.923},rotY=-28.713,except={DDS_GROUNDCREW=true},},--
      {pos={376.726,-4.013,873.906},rotY=58.588,except={DDS_GROUNDCREW=true},},--
      {pos={377.633,-4.013,875.342},rotY=94.696,except={DDS_GROUNDCREW=true},},--
      {pos={377.983,-4.013,877.740},rotY=97.864,except={DDS_GROUNDCREW=true},},--
      {pos={374.927,-4.013,878.589},rotY=-103.341,except={DDS_GROUNDCREW=true},},--
      {pos={368.466,-4.013,878.475},rotY=-93.801,except={DDS_GROUNDCREW=true},},--
      {pos={366.398,-4.013,876.562},rotY=-146.038,except={DDS_GROUNDCREW=true},},--
      {pos={367.723,-4.013,874.678},rotY=148.694,except={DDS_GROUNDCREW=true},},--
      {pos={368.381,-4.013,871.281},rotY=-169.474,except={DDS_GROUNDCREW=true},},--
      {pos={366.352,-4.013,868.006},rotY=157.874,except={DDS_GROUNDCREW=true},},--
      {pos={360.848,-4.013,865.974},rotY=-111.549,except={DDS_GROUNDCREW=true},},--
      {pos={357.787,-4.013,867.672},rotY=-40.737,except={DDS_GROUNDCREW=true},},--
      {pos={358.161,-4.013,873.142},rotY=34.323,except={DDS_GROUNDCREW=true},},--
      {pos={356.977,-4.013,876.269},rotY=-34.293,except={DDS_GROUNDCREW=true},},--
      {pos={359.478,-4.013,878.751},rotY=97.053,except={DDS_GROUNDCREW=true},},--
      --
      {pos={373.573,0.800,875.099},rotY=-70.262,},--next to walker gear pos
      {pos={360.768,0.800,882.319},rotY=-86.415,},--elevator ground floor

      {pos={368.465,0.800,893.759},rotY=12.324,},--support main helipad
    },
    {
      {pos={431.465,0.863,929.112},rotY=176.466,},
      {pos={450.969,-0.202,921.021},rotY=167.034,},
      {pos={470.952,0.796,933.839},rotY=77.359,},
      {pos={478.371,0.800,943.100},rotY=44.455,},
      {pos={486.443,0.800,949.330},rotY=58.444,},
      {pos={492.929,0.798,961.996},rotY=57.775,},
      {pos={476.013,0.798,975.497},rotY=49.680,},
      {pos={457.430,0.797,994.060},rotY=8.971,},
      {pos={446.401,0.800,1003.425},rotY=-3.852,},
      {pos={443.795,0.800,994.276},rotY=-85.276,},
      {pos={422.221,0.798,975.818},rotY=-79.336,},
      {pos={416.763,0.798,964.638},rotY=-60.796,},
      {pos={418.701,0.800,950.486},rotY=135.895,},
      {pos={471.727,0.800,982.474},rotY=77.610,},--support plat1 helipad
    },
    {
      {pos={453.677,0.862,1044.683},rotY=80.412,},
      {pos={463.109,-0.202,1051.247},rotY=111.782,},
      {pos={472.193,0.798,1064.120},rotY=159.669,},
      {pos={467.024,0.800,1083.464},rotY=-1.272,},
      {pos={467.420,0.800,1102.511},rotY=167.150,},
      {pos={460.261,0.800,1109.446},rotY=-44.826,},
      {pos={443.062,0.798,1109.224},rotY=-38.548,},
      {pos={412.316,0.863,1108.975},rotY=-22.846,},
      {pos={407.936,0.800,1084.150},rotY=-116.734,},
      {pos={405.962,0.798,1078.522},rotY=-67.481,},
      {pos={405.889,0.798,1067.320},rotY=-124.456,},
      {pos={415.834,0.798,1049.751},rotY=-125.797,},
      {pos={419.500,0.800,1072.480},rotY=174.635,},
      {pos={428.408,0.800,1071.177},rotY=108.713,},
      {pos={415.732,0.800,1070.258},rotY=60.741,},
      {pos={436.188,0.800,1110.676},rotY=7.540,},--support plat2 helipad
      {pos={429.681,4.800,1073.251},rotY=92.522,},--top of that vehicle lift square thing --ELEVATED
    },
    {
      {pos={376.474,0.800,1134.658},rotY=-133.018,},
      {pos={381.167,-0.202,1164.788},rotY=31.940,},
      {pos={375.063,0.798,1169.920},rotY=-5.370,},
      {pos={364.181,0.798,1181.967},rotY=45.792,},
      {pos={347.885,0.800,1193.249},rotY=149.692,},
      {pos={341.867,0.798,1197.949},rotY=10.368,},
      {pos={324.910,0.798,1179.745},rotY=-98.190,},
      {pos={308.829,0.797,1163.967},rotY=-98.852,},
      {pos={305.546,0.798,1149.910},rotY=-109.249,},
      {pos={324.583,0.798,1128.825},rotY=-176.507,},
      {pos={330.651,0.798,1126.015},rotY=169.849,},
      {pos={337.865,0.798,1121.280},rotY=-170.618,},
      {pos={351.706,0.800,1123.064},rotY=16.014,},
      {pos={320.024,0.800,1176.748},rotY=-113.860,},--support plat3 helipad
    },
  },
  --medical
  {
    --main
    {
      --medical main
      --researcher, ground crew, characters
      {pos={-158.877,0.800,-960.767},rotY=-142.092,},--eaves, closest to helipad
      {pos={-161.945,0.800,-951.129},rotY=-36.057,},--eaves, building close to helipad
      {pos={-123.737,0.800,-938.880},rotY=24.794,},--eaves, next to bridge to mb center
      {pos={-111.897,0.800,-958.830},rotY=-172.163,},--eaves next to shower
      {pos={-142.571,0.800,-951.048},rotY=-36.968,},--courtyard next to door
      {pos={-142.906,0.800,-941.532},rotY=154.804,},--courtyard door2
      {pos={-127.209,0.800,-943.385},rotY=-89.710,},--courtyard eaves
      {pos={-147.908,12.800,-939.036},rotY=76.442,},--upper next to door where soldiers usually pile up
      {pos={-123.740,8.800,-957.702},rotY=-88.836,},--rooftop fire doors
      {pos={-154.079,8.800,-954.621},rotY=169.767,},--rooftop fire doors2
      {pos={-139.890,-0.204,-919.139},rotY=8.916,},--med main outer railing looking toward command
      {pos={-156.534,0.800,-980.978},rotY=-124.673,},--med plat0 helipad
    },
    {
      {pos={-138.783,0.862,-1044.349},rotY=-2.699,},
      {pos={-131.378,0.800,-1038.492},rotY=32.843,},
      {pos={-145.807,-0.202,-1049.659},rotY=-87.569,},
      {pos={-157.142,0.798,-1062.534},rotY=-83.638,},
      {pos={-156.983,0.798,-1082.252},rotY=-95.604,},
      {pos={-153.214,0.800,-1096.211},rotY=157.181,},
      {pos={-149.573,0.862,-1111.157},rotY=-169.429,},
      {pos={-144.427,0.800,-1106.890},rotY=95.719,},
      {pos={-128.660,0.800,-1101.798},rotY=9.470,},
      {pos={-102.729,0.797,-1107.548},rotY=171.901,},
      {pos={-93.296,0.800,-1082.692},rotY=77.798,},
      {pos={-91.304,0.798,-1066.248},rotY=71.483,},
      {pos={-94.925,0.798,-1054.751},rotY=32.654,},
      {pos={-104.973,0.800,-1049.605},rotY=-106.255,},
      {pos={-120.652,0.800,-1109.467},rotY=-173.912,},--med plat1 helipad
    },
    {
      {pos={-184.527,0.863,-1145.055},rotY=92.736,},
      {pos={-189.799,0.862,-1140.001},rotY=20.340,},
      {pos={-197.510,0.798,-1140.549},rotY=22.331,},
      {pos={-208.861,-0.204,-1136.494},rotY=-48.768,},
      {pos={-221.612,0.796,-1147.717},rotY=-55.543,},
      {pos={-230.073,0.800,-1159.061},rotY=70.372,},
      {pos={-245.420,0.798,-1168.671},rotY=-91.377,},
      {pos={-245.139,0.798,-1179.785},rotY=-168.417,},
      {pos={-229.412,0.798,-1190.122},rotY=-102.813,},
      {pos={-210.940,0.797,-1209.359},rotY=159.224,},
      {pos={-206.047,0.863,-1213.409},rotY=-166.749,},
      {pos={-197.971,0.862,-1213.224},rotY=151.132,},
      {pos={-180.892,0.798,-1196.651},rotY=141.160,},
      {pos={-175.741,0.798,-1192.297},rotY=127.112,},
      {pos={-168.562,0.798,-1179.738},rotY=89.348,},
      {pos={-166.421,0.798,-1168.731},rotY=8.470,},
      {pos={-175.504,0.800,-1160.422},rotY=31.964,},
      {pos={-223.789,0.800,-1198.227},rotY=-155.437,},--med plat2 helipad
    },
    {
      {pos={-206.123,0.836,-1264.635},rotY=-80.713,},
      {pos={-215.721,-0.202,-1267.686},rotY=-5.063,},
      {pos={-223.800,0.798,-1299.246},rotY=-62.554,},
      {pos={-224.207,0.798,-1316.645},rotY=-116.820,},
      {pos={-215.986,0.798,-1328.489},rotY=131.760,},
      {pos={-213.068,0.800,-1325.088},rotY=106.812,},
      {pos={-194.186,0.798,-1325.216},rotY=148.770,},
      {pos={-157.983,0.798,-1288.445},rotY=81.695,},
      {pos={-158.241,0.798,-1283.597},rotY=14.232,},
      {pos={-165.707,0.798,-1268.229},rotY=15.556,},
      {pos={-176.822,0.800,-1266.974},rotY=162.419,},
      {pos={-223.789,0.800,-1198.227},rotY=-155.437,},--med plat3 helipad looking toward sunset
    },
  },
  --intel
  {
    --main
    {
      --intel main
      --researcher, ground crew, characters?
      {pos={-698.130,4.925,530.658},rotY=59.610,},--outer mid 3 light doohickey
      {pos={-689.036,4.925,546.251},rotY=75.332,},--intel main lower power boards
      {pos={-686.236,8.800,542.537},rotY=145.050,},--inner lower machine with screen
      {pos={-692.792,8.800,535.372},rotY=28.452,},--inner lower beside door
      {pos={-668.694,16.800,534.313},rotY=173.543,},--inner mid looking out
      {pos={-671.383,27.800,543.246},rotY=-110.593,},--inner top looking at dome
      {pos={-673.428,27.800,535.440},rotY=154.124,},--inner top right looking out
      {pos={-680.678,27.800,526.692},rotY=124.719,},--inner top left looking out
      {pos={-655.239,4.800,538.215},rotY=143.736,},--outer mid, next to walker pos/looking out
      {pos={-657.063,4.800,530.029},rotY=-161.525,},--outer mid power box thing
      {pos={-704.688,0.800,555.878},rotY=-54.961,},--intel main helipad
    },
    {
      {pos={-683.935,0.862,623.558},rotY=-120.053,},
      {pos={-677.182,0.862,626.550},rotY=155.923,},
      {pos={-664.561,-0.204,634.484},rotY=86.695,},
      {pos={-658.781,0.798,644.318},rotY=128.491,},
      {pos={-663.531,0.800,667.459},rotY=138.355,},
      {pos={-662.323,0.800,679.270},rotY=13.255,},
      {pos={-679.318,0.800,684.524},rotY=-156.893,},
      {pos={-686.327,0.798,690.023},rotY=36.592,},
      {pos={-712.491,0.797,690.082},rotY=-31.663,},
      {pos={-719.058,0.863,690.116},rotY=-32.491,},
      {pos={-727.530,0.800,688.932},rotY=-66.259,},
      {pos={-722.558,0.800,664.427},rotY=-135.955,},
      {pos={-724.825,0.798,652.294},rotY=-127.748,},
      {pos={-721.121,0.798,639.311},rotY=-69.770,},
      {pos={-714.165,0.798,629.849},rotY=168.083,},
      {pos={-709.827,0.800,631.045},rotY=74.593,},
      {pos={-704.851,0.800,638.004},rotY=9.775,},
      {pos={-694.680,0.800,691.468},rotY=41.650,},--intel plat1 helipad
    },
    {
      {pos={-753.006,0.862,723.643},rotY=88.875,},
      {pos={-751.139,0.800,734.714},rotY=89.055,},
      {pos={-752.187,0.798,749.214},rotY=20.115,},
      {pos={-765.945,0.798,762.948},rotY=78.795,},
      {pos={-783.090,0.863,778.520},rotY=9.783,},
      {pos={-791.145,0.862,780.561},rotY=-17.901,},
      {pos={-803.053,0.831,761.543},rotY=-31.473,},
      {pos={-825.173,0.798,730.834},rotY=-68.031,},
      {pos={-803.238,0.798,706.838},rotY=-107.451,},
      {pos={-789.028,0.798,699.893},rotY=-150.406,},
      {pos={-777.042,0.800,707.003},rotY=174.386,},
      {pos={-810.317,0.800,757.305},rotY=-94.442,},--intel plat2 helipad
    },
    {
      {pos={-790.986,0.863,825.991},rotY=-103.854,},
      {pos={-766.235,0.800,845.237},rotY=114.593,},
      {pos={-767.699,0.831,865.313},rotY=-30.940,},
      {pos={-768.194,0.800,883.222},rotY=-143.745,},
      {pos={-773.079,0.798,894.807},rotY=-20.986,},
      {pos={-828.535,0.800,880.583},rotY=-94.138,},
      {pos={-828.389,0.800,855.063},rotY=-126.848,},
      {pos={-820.036,0.798,830.863},rotY=-151.904,},
      {pos={-812.437,0.800,831.687},rotY=-88.868,},
      {pos={-800.825,0.800,892.441},rotY=21.630,},--intel plat3 helipad
    },
  },
  --basedev
  {
    --main
    {
      {pos={-723.933,8.800,-365.184},rotY=132.996,},--basedev core overlooking medical
      {pos={-749.970,8.800,-355.458},rotY=-34.118,},--basedev mid by stacked railings
      {pos={-763.970,8.800,-354.248},rotY=-14.224,},--basedev mid, under roof by drums
      {pos={-768.742,4.946,-350.953},rotY=-47.044,},--ramp corner
      {pos={-716.225,0.800,-390.044},rotY=-11.991,},--by AA
      {pos={-764.672,0.800,-403.081},rotY=-150.380,},--next to bridge
      {pos={-716.225,0.800,-390.044},rotY=-11.991,},--elevator bottom
      {pos={-725.471,7.800,-385.384},rotY=-90.869,},--elevator top
      {pos={-750.509,0.800,-357.305},rotY=69.679,},--lower super corridoor window
      {pos={-750.342,0.800,-363.388},rotY=103.299,},--lower super corridoor electric box
      {pos={-753.762,0.800,-350.529},rotY=-151.057,},--generator/power switch
      {pos={-763.874,0.800,-344.187},rotY=-73.664,},--aa gatling
      {pos={-769.075,0.800,-355.836},rotY=57.417,},--shower
      {pos={-777.260,0.800,-375.675},rotY=-65.203,},--basedev main helipad
    },
    {
      {pos={-809.038,0.862,-433.559},rotY=13.130,},
      {pos={-828.574,-0.204,-430.413},rotY=11.690,},
      {pos={-853.012,0.798,-450.207},rotY=-51.910,},
      {pos={-860.909,0.798,-459.189},rotY=-68.420,},
      {pos={-865.750,0.862,-472.422},rotY=-87.838,},
      {pos={-857.044,0.800,-472.945},rotY=112.450,},
      {pos={-847.203,0.798,-485.074},rotY=-129.687,},
      {pos={-812.314,0.800,-500.846},rotY=131.603,},
      {pos={-803.775,0.800,-492.550},rotY=107.029,},
      {pos={-791.301,0.798,-481.864},rotY=92.597,},
      {pos={-786.136,0.798,-472.102},rotY=68.477,},
      {pos={-791.816,0.800,-456.659},rotY=84.864,},
      {pos={-842.464,0.800,-491.712},rotY=-120.655,},--basedev plat1 helipad
    },
    {
      {pos={-912.061,0.863,-471.934},rotY=126.545,},
      {pos={-929.235,0.800,-447.866},rotY=13.143,},
      {pos={-954.313,0.800,-449.136},rotY=-91.840,},
      {pos={-965.767,0.800,-449.257},rotY=-58.540,},
      {pos={-976.527,0.798,-471.266},rotY=-84.841,},
      {pos={-975.313,0.863,-504.489},rotY=-127.285,},
      {pos={-966.221,0.800,-509.504},rotY=170.831,},
      {pos={-946.757,0.798,-511.116},rotY=175.259,},
      {pos={-923.786,0.798,-507.118},rotY=154.710,},
      {pos={-918.301,0.800,-496.598},rotY=29.466,},
      {pos={-977.710,0.800,-482.065},rotY=-72.800,},--basedev plat2 helipad
      {pos={-953.322,0.800,-483.266},rotY=78.458,},--next to walker pos
    },
    {
      {pos={-1010.840,0.862,-539.909},rotY=17.512,},
      {pos={-1023.284,-0.202,-536.118},rotY=-59.743,},
      {pos={-1036.997,0.798,-540.355},rotY=-86.563,},
      {pos={-1046.374,0.796,-552.014},rotY=-74.971,},
      {pos={-1064.587,0.798,-569.437},rotY=-124.111,},
      {pos={-1060.559,0.800,-578.911},rotY=168.407,},
      {pos={-1045.347,0.798,-594.118},rotY=-125.317,},
      {pos={-1013.855,0.800,-606.683},rotY=144.647,},
      {pos={-1000.283,0.798,-596.203},rotY=112.146,},
      {pos={-988.158,0.798,-578.757},rotY=129.455,},
      {pos={-995.015,0.800,-559.584},rotY=45.337,},
      {pos={-995.015,0.800,-559.584},rotY=45.337,},
      {pos={-1043.576,0.800,-597.933},rotY=-131.106,},--basedev plat3 helipad
    },
  },
}


--TODO ground floor

--DEBUGNOW
--      --command code talker original pos
--      {pos={-14.766,20.800,21.617},rotY=-45.414,},

--DEBUGNOW TODO positions next to walker gears

this.uniqueChars={
  KAZ=true,
}

this.npcCounts={
  DDS_GROUNDCREW=8,
  DDS_RESEARCHER=3,
  DDS_RESEARCHER_FEMALE=3,
  KAZ=1,
}

this.npcTemplates={
  DDS_GROUNDCREW={
  },
  DDS_RESEARCHER={
    faceId="male",
  },
  DDS_RESEARCHER_FEMALE={
    faceId="female",
  },
  KAZ={},
}

--DEBUGNOW

this.npcInfo={
  ih_hostage_0000={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0001={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0002={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0003={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0004={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0005={
    bodyType="DDS_RESEARCHER",
    faceId="male",
  },
  ih_hostage_0006={
    bodyType="DDS_RESEARCHER",
    faceId="male",
  },
  ih_hostage_0007={
    bodyType="DDS_RESEARCHER_FEMALE",
    faceId="female",
  },
  ih_hostage_0008={
    bodyType="DDS_RESEARCHER_FEMALE",
    faceId="female",
  },
  --  ih_hostage_0009={
  --    bodyType="KAZ",
  --  },

  ih_hostage_0010={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0011={
    bodyType="DDS_GROUNDCREW",
  },
  ih_hostage_0012={
    bodyType="DDS_GROUNDCREW",
  },
  --  ih_hostage_0013={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0014={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  ih_hostage_0015={
    bodyType="DDS_RESEARCHER",
    faceId="male",
  },
  --  ih_hostage_0016={
  --    bodyType="DDS_RESEARCHER",
  --    faceId="male",
  --  },
  ih_hostage_0017={
    bodyType="DDS_RESEARCHER_FEMALE",
    faceId="female",
  },
  --  ih_hostage_0018={
  --    bodyType="DDS_RESEARCHER_FEMALE",
  --    faceId="female",
  --  },
  --  ih_hostage_0009={
  --    bodyType="KAZ",
  --  },

  --  ih_hostage_0020={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0021={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0022={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0023={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0024={
  --    bodyType="DDS_GROUNDCREW",
  --  },
  --  ih_hostage_0025={
  --    bodyType="DDS_RESEARCHER",
  --    faceId="male",
  --  },
  --  ih_hostage_0026={
  --    bodyType="DDS_RESEARCHER",
  --    faceId="male",
  --  },
  --  ih_hostage_0027={
  --    bodyType="DDS_RESEARCHER_FEMALE",
  --    faceId="female",
  --  },
  --  ih_hostage_0028={
  --    bodyType="DDS_RESEARCHER_FEMALE",
  --    faceId="female",
  --  },
  ih_hostage_0029={
    bodyType="KAZ",
  },
}




function this.MotherBaseCurrentClusterActivated(clusterId)
  this.InitCluster(clusterId)
end

--tex since hostage parts can only be set at loadtime the same total group of npcs are reused/repositioned on cluster change.
function this.InitCluster(clusterId)
  if vars.missionCode~=30050 then--DEBUGNOW
    return
  end

  clusterId=clusterId or MotherBaseStage.GetCurrentCluster()
  InfCore.Log("InfHostage.InitCluster "..tostring(clusterId))--DEBUGNOW

  local grade=TppLocation.GetMbStageClusterGrade(clusterId)--DEBUGNOW verify what indexed clusterId this takes, theres retardely both 0 and 1 based indexes for different functions
  --tex no plats on cluster
  if grade==0 then
    return
  end

  --DEBUGNOW TODO per plat bags and distribute npcs evenly across all plats
  --the current combined ext plats bag will create crowding on clusters with few platforms

  local positionBagMain=InfUtil.ShuffleBag:New()
  local positionBagExt=InfUtil.ShuffleBag:New()

  local clusterPositions={}
  for platIndex=1,grade do
    local positions=this.npcPositions[clusterId+1][platIndex]--tex positions for plat
    for i,position in ipairs(positions)do
      if platIndex==1 then
        positionBagMain:Add(position)
      else
        positionBagExt:Add(position)
      end
    end
  end
  --InfCore.PrintInspect(clusterPositions,"clusterPositions")--DEBUGNOW
  --DEBUGNOW TODO if positionBag empty then warn, abort


  --DEBUGNOW
  local motionTable={
    locatorName="ptn_p21_010410_0000",
    motionPath="/Assets/tpp/motion/SI_game/fani/bodies/ptn0/ptn0/ptn0_guilty_a_idl.gani",
    specialActionName="end_of_ptn0_guilty_a_idl",
    position=Vector3(-101.977997,102.175000,-1674.468872),
    idle=true,
    again=true,
  }

  --    motionTable=InfHostage.motionTable[index1]
  --
  local locatorName=motionTable.locatorName
  local motionPath=motionTable.motionPath
  local specialActionName=motionTable.specialActionName
  local position=motionTable.position
  local rotationY=motionTable.rotationY
  local idle=motionTable.idle
  local enableGunFire=motionTable.enableGunFire
  local OnStart=motionTable.OnStart
  local action=motionTable.action or "PlayMotion"
  local state=motionTable.state
  local enableAim=motionTable.enableAim
  local charaControl=motionTable.charaControl
  local startPos=motionTable.startPos
  local startRot=motionTable.startRot
  local interpFrame=motionTable.interpFrame
  local enableCollision=motionTable.enableCollision or false
  local enableSubCollision=motionTable.enableSubCollision or false
  local enableGravity=motionTable.enableGravity or false
  local enableCurtain=motionTable.enableCurtain

  local autoFinish=false

  for hostageName,npcInfo in pairs(this.npcInfo)do
    local locatorName=hostageName
    local gameObjectId=GameObject.GetGameObjectId(locatorName)

    InfCore.Log("locatorName:"..locatorName.." gameId:"..tostring(gameObjectId).." "..npcInfo.bodyType,true)--DEBUGNOW
    if gameObjectId~=GameObject.NULL_ID then
      local onClusterId=this.npcOnClusters[npcInfo.bodyType]
      if onClusterId==nil or clusterId==onClusterId then

        --tex TODO: need to bias selection toward target
        local position
        --        local positionOK=false
        --        for i=1,10 do
        --          position=positionBag:Next()
        --          if not position.target then
        --            positionOK=true
        --          elseif position.target[npcInfo.bodyType] then
        --            positionOK=true
        --          end
        --          if position.except and position.except[npcInfo.bodyType] then
        --            positionOK=false
        --          end
        --          if positionOK then
        --            break
        --          end
        --        end

        local platIndex=1--tex only main
        if npcInfo.bodyType=="DDS_GROUNDCREW" then
          platIndex=math.random(2,grade)--anything but main
        end

        InfCore.Log("------- playting"..platIndex)--DEBUGNOW
        --DEBUGNOW
        --        local positions=clusterPositions[platIndex]
        --        InfCore.PrintInspect(positions,"positions")
        --        position=InfUtil.GetRandomInList(positions)
        if platIndex==1 then
          position=positionBagMain:Next()
        else
          position=positionBagExt:Next()
        end


        local motionPath=InfHostage.motionPaths[math.random(#InfHostage.motionPaths)]--DEBUGNOW
        InfCore.Log("motionPath:"..InfUtil.GetFileName(motionPath),true)--DEBUGNOW

        GameObject.SendCommand(gameObjectId,{id="SetHostage2Flag",flag="disableMarker",on=true})--DEBUGNOW
        TppUiCommand.RegisterIconUniqueInformation{markerId=gameObjectId,langId="marker_friend_mb"}--DEBUGNOW
        --      local faceId=nil
        --      local bodyId=TppEnemyBodyId.ddr0_main0_v00
        --      GameObject.SendCommand( gameObjectId, { id = "ChangeFova", faceId = faceId, bodyId = bodyId, } )
        local enableMob=true
        GameObject.SendCommand(gameObjectId,{id="SetEnabled",enabled=enableMob})
        local command={id="SetHostage2Flag",flag="unlocked",on=true,updateModel=true}
        GameObject.SendCommand(gameObjectId,command)

        local command={id="SetHostage2Flag",flag="disableFulton",on=true}
        GameObject.SendCommand(gameObjectId,command)

        GameObject.SendCommand(gameObjectId,{id="SetHostage2Flag",flag="commonNpc",on=true,})
        --DEBUGNOW GameObject.SendCommand(gameObjectId,{id="SetHostage2Flag",flag="disableDamageReaction",on=true,})
        GameObject.SendCommand(gameObjectId,{id="SetDisableDamage",life=true,faint=true,sleep=true,})

        GameObject.SendCommand(gameObjectId,{
          id="SpecialAction",
          action=action,
          path=motionPath,
          state=state,
          autoFinish=autoFinish,
          enableMessage=true,
          enableGravity=motionTable.enableGravity,
          enableCollision=enableCollision,
          enableSubCollision=enableSubCollision,
          enableGunFire=enableGunFire,
          enableAim=enableAim,
          startPos=startPos,
          startRot=startRot,
          enableCurtain=enableCurtain,
        })

        --tex TODO
        local rotY=position.rotY
        rotY=math.random(360)--DEBUGNOW
        local randomOffset=0.2
        local offsetX=math.random(-randomOffset,randomOffset)
        local offsetZ=math.random(-randomOffset,randomOffset)
        local command={id="Warp",degRotationY=rotY,position=Vector3(position.pos[1]+offsetX,position.pos[2],position.pos[3]+offsetZ)}
        GameObject.SendCommand(gameObjectId,command)
      end
    end
  end
end

return this
