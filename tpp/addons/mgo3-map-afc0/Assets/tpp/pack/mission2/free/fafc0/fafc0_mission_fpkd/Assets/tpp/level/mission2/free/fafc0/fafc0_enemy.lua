--DEBUGNOW
InfCore.Log("fafc0_enemy")--DEBUGNOW
return InfCore.PCall(function()

local this={}
local StrCode32=InfCore.StrCode32
local StrCode32Table=Tpp.StrCode32Table
local GetGameObjectId=GameObject.GetGameObjectId
local NULL_ID=GameObject.NULL_ID
local SendCommand=GameObject.SendCommand

this.requires={}

this.cpType=CpType.TYPE_AFRIKAANS

this.soldierDefine={
	briefing_cp = {--17
		"sol_afc0_0000",
		"sol_afc0_0001",
		"sol_afc0_0002",
		"sol_afc0_0003",
		"sol_afc0_0004",
		"sol_afc0_0005",
		"sol_afc0_0006",
		"sol_afc0_0007",
		"sol_afc0_0008",
		"sol_afc0_0009",
		"sol_afc0_0010",
		"sol_afc0_0011",
		"sol_afc0_0012",
		"sol_afc0_0013",
		"sol_afc0_0014",
		"sol_afc0_0015",
		"sol_afc0_0016",
		"sol_afc0_0017",
		"sol_afc0_0018",
		nil
	},--briefing_cp
	village_cp = {--21
		"sol_afc0_0019",
		"sol_afc0_0020",
		"sol_afc0_0021",
		"sol_afc0_0022",
		"sol_afc0_0023",
		"sol_afc0_0024",
		"sol_afc0_0025",
		"sol_afc0_0026",
		"sol_afc0_0027",
		"sol_afc0_0028",
		"sol_afc0_0029",
		"sol_afc0_0030",
		"sol_afc0_0031",
		"sol_afc0_0032",
		"sol_afc0_0033",
		"sol_afc0_0034",
		"sol_afc0_0035",
		"sol_afc0_0036",
		"sol_afc0_0037",
		"sol_afc0_0038",
		"sol_afc0_0039",
		nil
	},--village_cp	
	quest_cp={
		"sol_quest_0000",
		"sol_quest_0001",
		"sol_quest_0002",
		"sol_quest_0003",
		"sol_quest_0004",
		"sol_quest_0005",
		"sol_quest_0006",
		"sol_quest_0007",
	},
}--soldierDefine

this.soldierTypes={
	PF={--REF EnemyType["TYPE_"..soldierType]
		this.soldierDefine.briefing_cp,
		this.soldierDefine.village_cp,
	},
}--soldierTypes
this.soldierSubTypes={
	PF_C={
		this.soldierDefine.briefing_cp,
		this.soldierDefine.village_cp,
	},
}--soldierSubTypes

this.routeSets={
	briefing_cp={
		priority={
			"groupA",
			"groupB",
			"groupC",
			nil
		},
		sneak_day={
			groupA={
				"rt_afc0_d_0000",
				"rt_afc0_d_0001",
				"rt_afc0_d_0002",
				"rt_afc0_d_0003",
				"rt_afc0_d_0004",
			},
			groupB={
				"rt_afc0_d_0005",
				"rt_afc0_d_0006",
				"rt_afc0_d_0007",
				"rt_afc0_d_0008",
				"rt_afc0_d_0009",
				"rt_afc0_d_0010",
			},
			groupC={
				"rt_afc0_d_0031",
				"rt_afc0_d_0032",
				"rt_afc0_d_0033",
				"rt_afc0_d_0034",
				"rt_afc0_d_0035",
				"rt_afc0_d_0036",			
			},
		},--sneak_day
		sneak_night= {
			groupA={
				"rt_afc0_d_0000",
				"rt_afc0_d_0001",
				"rt_afc0_d_0002",
				"rt_afc0_d_0003",
				"rt_afc0_d_0004",
			},
			groupB={
				"rt_afc0_d_0005",
				"rt_afc0_d_0006",
				"rt_afc0_d_0007",
				"rt_afc0_d_0008",
				"rt_afc0_d_0009",
				"rt_afc0_d_0010",
			},
			groupC={
				"rt_afc0_d_0031",
				"rt_afc0_d_0032",
				"rt_afc0_d_0033",
				"rt_afc0_d_0034",
				"rt_afc0_d_0035",
				"rt_afc0_d_0036",			
			},
		},--sneak_night
	},--briefing_cp
	village_cp={
		priority={
			"groupA",
			"groupB",
			"groupC",
			"groupD",
			nil
		},
		sneak_day={
			groupA={
				"rt_afc0_d_0011",
				"rt_afc0_d_0012",
				"rt_afc0_d_0013",
				"rt_afc0_d_0014",
				"rt_afc0_d_0015",
			},
			groupB={			
				"rt_afc0_d_0016",
				"rt_afc0_d_0017",
				"rt_afc0_d_0018",
				"rt_afc0_d_0019",
				"rt_afc0_d_0020",
				"rt_afc0_d_0021",
			},
			groupC={
				"rt_afc0_d_0022",
				"rt_afc0_d_0023",
				"rt_afc0_d_0024",
				"rt_afc0_d_0025",
				"rt_afc0_d_0026",
			},
			groupD={
				"rt_afc0_d_0027",
				"rt_afc0_d_0028",
				"rt_afc0_d_0029",
				"rt_afc0_d_0030",
				"rt_afc0_d_0031",
			},
		},--sneak_day
		sneak_night= {
			groupA={
				"rt_afc0_d_0011",
				"rt_afc0_d_0012",
				"rt_afc0_d_0013",
				"rt_afc0_d_0014",
				"rt_afc0_d_0015",
			},
			groupB={			
				"rt_afc0_d_0016",
				"rt_afc0_d_0017",
				"rt_afc0_d_0018",
				"rt_afc0_d_0019",
				"rt_afc0_d_0020",
				"rt_afc0_d_0021",
			},
			groupC={
				"rt_afc0_d_0022",
				"rt_afc0_d_0023",
				"rt_afc0_d_0024",
				"rt_afc0_d_0025",
				"rt_afc0_d_0026",
			},
			groupD={
				"rt_afc0_d_0027",
				"rt_afc0_d_0028",
				"rt_afc0_d_0029",
				"rt_afc0_d_0030",
				"rt_afc0_d_0031",
			},
		},--sneak_night
	},--village_cp
	--quest_cp					= { USE_COMMON_ROUTE_SETS = true, },
}--routeSets

this.combatSetting={
	nil
}

this.InitEnemy=function()
end

this.SetUpEnemy=function()
	TppEnemy.SetupQuestEnemy()
	--DEBUGNOW
	for i,soldierName in ipairs(this.soldierDefine.afc0_cp) do
		local gameObjectId=GetGameObjectId("TppSoldier2",soldierName)
		if gameObjectId~=NULL_ID then
			SendCommand(gameObjectId, {id="SetZombie",enabled=true,isMsf=false,isZombieSkin=true,isHagure=false})
		end
	end--for afc0_cp
end--SetUpEnemy

this.OnLoad=function()
end

return this

end)--DEBUGNOW