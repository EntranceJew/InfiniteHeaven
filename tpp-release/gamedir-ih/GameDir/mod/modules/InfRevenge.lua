--InfRevenge.lua
local this={}

--tex TODO: put in some util or math module
function this.round(num,idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function GetMinMaxIvars(name)
  return Ivars[name.."_MIN"],Ivars[name.."_MAX"]
end

local function GetNonDefaultRandom(ivarMin,ivarMax,nonDefaultOnly)
  if nonDefaultOnly and (ivarMin:IsDefault() and ivarMax:IsDefault()) then
    return nil
  end
  return math.random(ivarMin:Get(),ivarMax:Get())
end
--tex onlyNonDefault will only add powerTypes to revengeConfig if their repsective Ivar isn't its default.
function this.CreateCustomRevengeConfig(onlyNonDefault)
  local InfRevengeIvars=InfRevengeIvars

  local revengeConfig={}
  InfMain.RandomSetToLevelSeed()
  for n,powerTableName in ipairs(InfRevengeIvars.percentagePowerTables)do
    local powerTable=InfRevengeIvars[powerTableName]
    for m,powerType in ipairs(powerTable)do
      local ivarMin,ivarMax=GetMinMaxIvars(powerType)
      local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
      if random~=nil then
        random=this.round(random)
        --InfCore.DebugPrint(ivarName.." min:"..tostring(min).." max:"..tostring(max).. " random:"..tostring(random))--DEBUG
        if random>0 then
          revengeConfig[powerType]=tostring(random).."%"
        end
      end
    end
  end

  for n,powerType in ipairs(InfRevengeIvars.abilitiesWithLevels)do
    local ivarMin,ivarMax=GetMinMaxIvars(powerType)
    local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
    if random~=nil and random>0 then
      local powerType=powerType.."_"..ivarMin.settings[random+1]
      revengeConfig[powerType]=true
    end
  end

  for n,powerType in ipairs(InfRevengeIvars.weaponStrengthPowers)do
    local ivarMin,ivarMax=GetMinMaxIvars(powerType)
    local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
    if random~=nil and random==1 then
      revengeConfig[powerType]=true
    end
  end

  for n,powerType in ipairs(InfRevengeIvars.cpEquipBoolPowers)do
    local ivarMin,ivarMax=GetMinMaxIvars(powerType)
    local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
    if random~=nil and random==1 then
      revengeConfig[powerType]=true
    end
  end

  local ivarMin,ivarMax=GetMinMaxIvars"reinforceLevel"
  local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
  if random~=nil and random>0 then
    revengeConfig[ ivarMin.settings[random+1] ]=true
  end

  local ivarMin,ivarMax=GetMinMaxIvars"revengeIgnoreBlocked"
  local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
  if random~=nil and random>0 then
    revengeConfig.IGNORE_BLOCKED=true
  end

  local ivarMin,ivarMax=GetMinMaxIvars"reinforceCount"
  local random=GetNonDefaultRandom(ivarMin,ivarMax,onlyNonDefault)
  if random~=nil then
    revengeConfig.REINFORCE_COUNT=random
  end

  --tex TODO if not onlyNonDefault or not missionvar mbDDEquipNonLethal IsDefault
  if Ivars.mbDDEquipNonLethal:EnabledForMission() then
    revengeConfig.NO_KILL_WEAPON=true
  end

  local bodyInfo=InfEneFova.GetMaleBodyInfo()
  if bodyInfo and (not bodyInfo.hasArmor) and (vars.missionCode==30050 or vars.missionCode==30250) then--tex TODO: handle mother base special case better, especially with the male/female split
    revengeConfig.ARMOR=nil
  end

  InfMain.RandomResetToOsTime()

  --  InfCore.Log("CreateCustomRevengeConfig onlyNonDefault:"..tostring(onlyNonDefault))--DEBUG
  --  InfCore.PrintInspect(revengeConfig)
  return revengeConfig
end

local function AvePowerSetting(powerType)
  if Ivars[powerType.."_MIN"]==nil or Ivars[powerType.."_MAX"]==nil then
    InfCore.Log("WARNING: AvePowerSetting: cannot find powertype:"..powerType)--DEBUG
    return 0
  end

  return (Ivars[powerType.."_MIN"]:Get()+Ivars[powerType.."_MAX"]:Get())/2
end

function this.SetCustomRevengeUiParameters()
  --tex ui params range is 0-3
  local uiRange=3

  --tex just averaging between min/max, could probably save actual chosen value somewhere but would only be accurate for Global config and not per cp config mode
  local fulton=this.round(AvePowerSetting"FULTON")

  local headShot=this.round(uiRange*AvePowerSetting"HELMET")

  --REF stealth 5
  --    STEALTH_SPECIAL=true,
  --    HOLDUP_HIGH=true,
  --    ACTIVE_DECOY=true,
  --    GUN_CAMERA=true},

  local stealthPowers={
    "DECOY",
    "MINE",
    "CAMERA",
  }

  local ave=0
  for n,powerType in ipairs(stealthPowers) do
    ave=ave+AvePowerSetting(powerType)
  end
  ave=ave/#stealthPowers

  local stealth=this.round(uiRange*ave)--TODO incorporate-^- stralth and holdup abilities at least

  --REF combat 5
  --STRONG_WEAPON=true,
  --COMBAT_SPECIAL=true,
  --SUPER_REINFORCE=true,
  --BLACK_SUPER_REINFORCE=true,
  --REINFORCE_COUNT=3},
  local combatPowers={
    "ARMOR",
    "SOFT_ARMOR",
    "SHIELD",
    "MG",
    "SHOTGUN",
    "MISSILE",--tex in normal game I don't think missile is even accounted for in ui params?
  }
  local ave=0
  for n,powerType in ipairs(combatPowers) do
    ave=ave+AvePowerSetting(powerType)
  end
  ave=ave/(#combatPowers/2)--tex KLUDGE half the count

  local combat=this.round(uiRange*ave)--tex TODO incorporate rest of combat powers

  local nightPowers={
    "NVG",
    "GUN_LIGHT",
  }
  local ave=0
  for n,powerType in ipairs(nightPowers) do
    ave=ave+AvePowerSetting(powerType)
  end
  ave=ave/(#nightPowers/2)--tex KLUDGE bump
  if ave>1 then
    ave=1
  end
  local night=this.round(uiRange*ave)

  local sniperPowers={
    "SNIPER",
    "STRONG_SNIPER",--tex mixing unalike values here, sniper is percentage, strong is intbool
  }
  local ave=0
  for n,powerType in ipairs(sniperPowers) do
    ave=ave+AvePowerSetting(powerType)
  end
  ave=ave/(#sniperPowers/2)--tex KLUDGE bump
  if ave>1 then
    ave=1
  end
  local longRange=this.round(uiRange*ave)

  InfCore.Log("InfRevenge.SetCustomRevengeUiParameters "..tostring(vars.missionCode)..": fulton="..fulton.." headShot="..headShot.." stealth="..stealth.." combat="..combat.." night="..night.." longRange="..longRange)--DEBUG
  TppUiCommand.RegisterEnemyRevengeParameters{fulton=fulton,headShot=headShot,stealth=stealth,combat=combat,night=night,longRange=longRange}
end

--CALLER: TppRevenge._ApplyRevengeToCp
function this.GetSumBalance(balanceTypes,revengeConfig,totalSoldierCount,originalSettingsTable)
  local sumBalance=0
  local numBalance=0

  for n,powerType in pairs(balanceTypes) do
    local powerSetting=revengeConfig[powerType]
    if powerSetting~=nil and powerSetting~=0 then--tex powersetting should never be 0 from what I've seen, but checking anyway

      local percentage=0
      --tex convert from num soldiers to percentage
      if Tpp.IsTypeNumber(powerSetting)then
        if powerSetting>totalSoldierCount then
          powerSetting=totalSoldierCount
        end
        if totalSoldierCount~=0 then
          percentage=(powerSetting/totalSoldierCount)*100
          originalSettingsTable[powerType]=percentage
          numBalance=numBalance+1
          sumBalance=sumBalance+percentage
          --InfCore.DebugPrint("powerType:"..powerType.." powerSetting:"..tostring(powerSetting).." numtopercentage:"..percentage)--DEBUG
        end
      elseif Tpp.IsTypeString(powerSetting)then
        if powerSetting:sub(-1)=="%"then
          percentage=powerSetting:sub(1,-2)+0
          originalSettingsTable[powerType]=percentage
          numBalance=numBalance+1
          sumBalance=sumBalance+percentage
          --InfCore.DebugPrint("powerType:"..powerType.." powerSetting:"..powerSetting.." stringtopercentage:"..percentage)--DEBUG
        end
      end
    end--if powersetting
  end--for balanceGearTypes

  return numBalance,sumBalance,originalSettingsTable
end


--CALLER: TppRevenge._ApplyRevengeToCp
function this.BalancePowers(numBalance,reservePercent,originalSettingsTable,revengeConfig)
  if numBalance==0 then
    InfCore.DebugPrint"BalancePowers numballance==0"
    return
  end

  local balancePercent=0
  if numBalance>0 then
    local maxPercent=100-reservePercent
    balancePercent=maxPercent/numBalance
    --tex bump up the balance percent from those that are under
    --TODO: bump up on an individual power basis biased by those that have higher original requested percentage
    local aboveBalance=numBalance
    local underflow=0
    for powerType,percentage in pairs(originalSettingsTable) do
      if percentage < balancePercent then
        underflow=underflow+(balancePercent-percentage)
        aboveBalance=aboveBalance-1
      end
    end

    --InfCore.DebugPrint("numBalance:"..numBalance.." balancePercent:"..balancePercent.." underflow:"..underflow)--DEBUG

    --OFF if underflow>0 then--tex distribute underflow evenly
    -- balancePercent=balancePercent+(underflow/aboveBalance)
    -- underflow=0
    --end

    --tex distribute underflow in ballanceGearType order
    for powerType,percentage in pairs(originalSettingsTable) do
      if percentage>balancePercent then
        local toOriginalPercent=originalSettingsTable[powerType]-balancePercent
        local bump=math.min(underflow,toOriginalPercent)
        underflow=underflow-bump
        -- InfCore.DebugPrint("numBalance:"..numBalance.." powerType:"..powerType.." balancePercent:"..balancePercent.." bump:"..bump)--DEBUG
        revengeConfig[powerType]=tostring(balancePercent+bump).."%"
      end
    end
    --InfCore.DebugPrint("numBalance:"..numBalance.." sumBalance:"..sumBalance.." balancePercent:"..balancePercent)--DEBUG
  end--if numbalance
  return revengeConfig--tex already been edited in-place, but this is clearer
end--function


return this
