-- quest_q52130_EXTERNAL.lua --DEBUGNOW
-- tex the normally internal (in fpk) quest script for the quest just returns this module
-- since this module is in \mod\modules you can just edit it then restart the game without having to re-pack the quest fpk

-- .frt is in \Assets\tpp\pack\mission2\quest\ih\quest_IH0005_ShifapRiver_fpk\Assets\tpp\pack\mission2\quest\extra\

InfCore.Log("q52130-EXTERNAL")--DEBUGNOW

return InfCore.PCallDebug(function()--DEBUG
  local this = {}
  local quest_step = {}

  local StrCode32 = Fox.StrCode32
  local StrCode32Table = Tpp.StrCode32Table
  local GetGameObjectId = GameObject.GetGameObjectId

  this.QUEST_TABLE = {

      questType = TppDefine.QUEST_TYPE.ELIMINATE,

      cpList = {
        {
          cpName = "quest_cp",
          cpPosition_x = -1854.596, cpPosition_y = 343.192, cpPosition_z = -299.520, cpPosition_r = 106.515,
          isOuterBaseCp = true,
          gtName = "gt_quest_0000",
          gtPosition_x = -1854.596, gtPosition_y = 343.192, gtPosition_z = -299.520, gtPosition_r = 106.515,
        },
      },

      enemyList = {
        {
          enemyName = "sol_quest_0000",
          route_d = "rt_quest_d_0000",   route_c = "rt_quest_d_0000",
          powerSetting = { },
          rideFromVehicleId = "vehicle_quest_0000",
        },
        {
          enemyName = "sol_quest_0001",
          route_d = "rt_quest_d_0001",   route_c = "rt_quest_d_0001",
          powerSetting = { },
        },
        {
          enemyName = "sol_quest_0002",
          route_d = "rt_quest_d_0002",   route_c = "rt_quest_d_0002",
          powerSetting = { "SOFT_ARMOR", "HELMET", "SHIELD" },
        },
        {
          enemyName = "sol_quest_0003",
          route_d = "rt_quest_d_0003",   route_c = "rt_quest_d_0003",
          powerSetting = { "SOFT_ARMOR", "HELMET" },
        },
      --		{
      --			enemyName = "sol_quest_0004",
      --			route_d = "rt_broken_bridge_and_river", 	route_c = "rt_broken_bridge_and_river",
      --			powerSetting = { "HELMET", "SOFT_ARMOR", "MISSILE" },
      --		},
      --		{
      --			enemyName = "sol_quest_0005",
      --			route_d = "rt_hill_top", 	route_c = "rt_hill_top",
      --			powerSetting = { "SOFT_ARMOR", "HELMET", "SNIPER" },
      --		},
      --		{
      --			enemyName = "sol_quest_0006",
      --			route_d = "rt_river_ledge", 	route_c = "rt_river_ledge",
      --			powerSetting = { "SOFT_ARMOR", "HELMET", "SNIPER" },
      --		},
      --		{
      --			enemyName = "sol_quest_0007",
      --			route_d = "rt_wav_river", 	route_c = "rt_wav_river",
      --			--route_d = "rt_aim_test", 	route_c = "rt_aim_test",--DEBUGNOW
      --			powerSetting = { "SOFT_ARMOR", "HELMET", "SNIPER" },
      --			--rideFromVehicleId = "vehicle_quest_0000",--DEBUGNOW
      --		},
      },

      vehicleList = {
        {
          id		= "Spawn",
          locator = "vehicle_quest_0000",
          type	= Vehicle.type.EASTERN_WHEELED_ARMORED_VEHICLE,
          class	= Vehicle.class.DARK_GRAY,
          priority = 1,

          warpPosition={pos={1311.654,295.101,2191.258},rotY=0},--DEBUGNOW--rotY=33.653},
        },
      --		{
      --			id		= "Spawn",
      --			locator = "vehicle_quest_0001",
      --			type	= Vehicle.type.EASTERN_WHEELED_ARMORED_VEHICLE,
      --			subType = Vehicle.subType.EASTERN_WHEELED_ARMORED_VEHICLE_ROCKET_ARTILLERY,
      --			class	= Vehicle.class.DARK_GRAY,
      --			priority = 1,
      --		},
      },

            heliList = {
              {
                routeName		= "rt_heli_quest_hover",
                coloringType		= TppDefine.ENEMY_HELI_COLORING_TYPE.BLACK,
              },
            },

      hostageList = {
        {
          hostageName   = "hos_quest_0000",
          isFaceRandom  = true,
          voiceType   = { "hostage_c", "hostage_b", },
          langType    = "english",
          bodyId      = TppDefine.QUEST_BODY_ID_LIST.AFGH_HOSTAGE_FEMALE,
          -- warpPosition={pos={1195.245,307.432,2231.345},rotY=0},
          route_d = "rt_quest_hostage_0000",
        },
      },

      uavList={
      --        {
      --          name="ih_uav_0000",
      --          developLevel=TppUav.DEVELOP_LEVEL_LMG_2,
      --          route_d="rt_quest_uav_0000",
      --          route_c="rt_quest_uav_0000",
      --          cpName="quest_cp",
      --        },
      },

      targetList = {
        "hos_quest_0000",
        "vehicle_quest_0000",
      -- "vehicle_quest_0001",
      --"sol_quest_0002",
      --		"sol_quest_0003",
      --		"sol_quest_0004",
      --		"sol_quest_0005",
      --		"sol_quest_0006",
      --		"sol_quest_0007",
      --TppReinforceBlock.REINFORCE_HELI_NAME,
      },
  }




  function this.OnAllocate()
    TppQuest.RegisterQuestStepList{
      "QStep_Start",
      "QStep_Main",
      nil
    }


    TppEnemy.OnAllocateQuestFova( this.QUEST_TABLE )

    TppQuest.RegisterQuestStepTable( quest_step )
    TppQuest.RegisterQuestSystemCallbacks{
      OnActivate = function()
        Fox.Log("quest_recv_child OnActivate")

        TppEnemy.OnActivateQuest( this.QUEST_TABLE )
      end,
      OnDeactivate = function()
        Fox.Log("quest_recv_child OnDeactivate")

        TppEnemy.OnDeactivateQuest( this.QUEST_TABLE )
      end,
      OnOutOfAcitveArea = function()
      end,
      OnTerminate = function()

        TppEnemy.OnTerminateQuest( this.QUEST_TABLE )
      end,
    }

    mvars.fultonInfo = TppDefine.QUEST_CLEAR_TYPE.NONE
  end




  this.Messages = function()
    return
      StrCode32Table {
        Block = {
          {
            msg = "StageBlockCurrentSmallBlockIndexUpdated",
            func = function() end,
          },
        },
      }
  end




  function this.OnInitialize()
    TppQuest.QuestBlockOnInitialize( this )
  end

  function this.OnUpdate()
    TppQuest.QuestBlockOnUpdate( this )
  end

  function this.OnTerminate()
    TppQuest.QuestBlockOnTerminate( this )
  end








  quest_step.QStep_Start = {
    OnEnter = function()
      InfCore.Log("quest_step.QStep_Start!!!!!!")--DEBUGNOW

      InfCore.PCall(this.WarpQuestObjects)--DEBUGNOW

      --DEBUGNOW
      local hostageRoute="rt_quest_hostage_0000"
      local hostageId=GameObject.GetGameObjectId("hos_quest_0000")

      --DEBUGNOW GameObject.SendCommand( hostageId, { id = "SetHostage2Flag", flag = "unlocked", on = true, } )
      --GameObject.SendCommand(hostageId,{id="SetSneakRoute",route=hostageRoute,})


      TppQuest.SetNextQuestStep( "QStep_Main" )
    end,
  }

  quest_step.QStep_Main = {

      Messages = function( self )
        return
          StrCode32Table {
            GameObject = {
              {
                msg = "RoutePoint2",
                func = function (gameObjectId, routeId ,routeNode, messageId )
                  if messageId == StrCode32("msg_questHeli_routeChange") then
                    Fox.Log("*** " .. tostring(gameObjectId) .. " ::RouteChangeGameObjectId ***")
                    this.SetHeliRoute( "rt_heli_quest_0000", true )
                  end
                end
              },
              {
                msg = "Dead",
                func = function( gameObjectId )
                  local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "Dead", gameObjectId )

                  if gameObjectId ~= GetGameObjectId("sol_quest_0000") and gameObjectId ~= GetGameObjectId("sol_quest_0001") then
                    TppQuest.ClearWithSave( isClearType )
                  end
                end
              },
              {
                msg = "FultonInfo",
                func = function( gameObjectId )
                  if mvars.fultonInfo ~= TppDefine.QUEST_CLEAR_TYPE.NONE then
                    TppQuest.ClearWithSave( mvars.fultonInfo )
                  end
                  mvars.fultonInfo = TppDefine.QUEST_CLEAR_TYPE.NONE
                end
              },
              {
                msg = "Fulton",
                func = function( gameObjectId )
                  local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "Fulton", gameObjectId )
                  mvars.fultonInfo = isClearType
                end
              },
              {
                msg = "FultonFailed",
                func = function( gameObjectId, locatorName, locatorNameUpper, failureType )
                  if failureType == TppGameObject.FULTON_FAILED_TYPE_ON_FINISHED_RISE then
                    local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "FultonFailed", gameObjectId )
                    TppQuest.ClearWithSave( isClearType )
                  end
                end
              },
              {
                msg = "VehicleBroken",
                func = function( gameObjectId, state )
                  if state == StrCode32("End") then
                    local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "VehicleBroken", gameObjectId )
                    TppQuest.ClearWithSave( isClearType )
                  end
                end
              },
              {
                msg = "PlacedIntoVehicle",
                func = function( gameObjectId, vehicleGameObjectId )
                  if Tpp.IsHelicopter( vehicleGameObjectId ) then
                    local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "InHelicopter", gameObjectId )
                    TppQuest.ClearWithSave( isClearType )
                  end
                end
              },
              {
                msg = "LostControl",
                func = function( gameObjectId, state )
                  if state == StrCode32("End") then
                    local isClearType = TppEnemy.CheckQuestAllTarget( this.QUEST_TABLE.questType, "LostControl", gameObjectId )
                    TppQuest.ClearWithSave( isClearType )
                  end
                end
              },
            },
          }
      end,

      OnEnter = function()
        Fox.Log("QStep_Main OnEnter")

        InfCore.PCall(this.SetFriendly)--DEBUGNOW
      end,
      OnLeave = function()
        Fox.Log("QStep_Main OnLeave")
      end,
  }

  --DEBUGNOW
  function this.SetFriendly()
    for i,enemyDef in ipairs(this.QUEST_TABLE.enemyList)do
      local gameId=GameObject.GetGameObjectId(enemyDef.enemyName)
      GameObject.SendCommand(gameId,{id="SetFriendly",enabled=true})
    end
  end

  function this.WarpQuestObjects()
    InfCore.LogFlow("WarpQuestObjects")--DEBUGNOW
    local warpFuncs={
      vehicleList=InfMainTpp.WarpVehicle,
      hostageList=InfMainTpp.WarpHostage,
    }
    local objectNameKeys={
      vehicleList="locator",
      hostageList="hostageName",
    }

    for listName,objectList in pairs(this.QUEST_TABLE)do
      local WarpFunc=warpFuncs[listName]
      if WarpFunc then
        for i,objectInfo in ipairs(objectList)do
          if objectInfo.warpPosition then
            local objectName=objectInfo[objectNameKeys[listName]]
            InfCore.Log("Warping "..tostring(objectName))--DEBUGNOW
            WarpFunc(objectName,objectInfo.warpPosition.pos,objectInfo.warpPosition.rotY)
          end
        end
      end
    end
  end

  return this

end)--DEBUG