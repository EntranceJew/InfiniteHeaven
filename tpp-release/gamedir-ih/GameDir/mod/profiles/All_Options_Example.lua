-- All_Options_Example.lua
-- Defaults / example of all profile options for IH r258
-- Profiles are lists of settings for IH options.
-- IH only reads this file/does not write to it.
-- You can load a profile through the IH system menu by pressing <Action> on the Selected profile.
-- Or by setting loadOnACCStart=true, below.
-- This profile lists all options, with their default settings.
-- See Features and Options.html for longer descriptions of some settings.
-- Options are added and sometimes changed as IH develops, use the defaults profile and compare with a prior version using a tool like WinMerge to see changes to make sure your own profiles are correct.
local this={
	description="Defaults/All disabled",
	firstProfile=false,--puts profile first for the IH menu option, only one profile should have this set.
	loadOnACCStart=false,--If set to true profile will be applied on first load of ACC (actual, not just title). Any profile can have this setting, profiles will be applied in same order as listed in IH menu (alphabetical, and firstProfile first)
	profile={
		--IH system menu
		enableIHExt=0,--{ 0-1 } -- Enable IHExt
		menu_enableHelp=1,--{ 0-1 } -- Enable help text.
		menu_enableCursorOnMenuOpen=1,--{ 0-1 } -- Enable mouse cursor on menu open
		menu_disableToggleMenuHold=0,--{ 0-1 } -- Disable hold menu toggle
		enableQuickMenu=0,--{ 0-1 } -- Enable Quick Menu
		startOffline=0,--{ 0-1 } -- Start offline
		skipLogos=0,--{ 0-1 } -- Skip startup logos
		ihMissionsPercentageCount=0,--{ 0-1 } -- Include addon missions in completion percentage
		--Cam - AroundCam menu
		updateStageBlockLoadPositionToCameraPosition=0,--{ 0-1 } -- Update stage position with camera
		moveScale=0.5,--{ 0.01-10 } -- Cam speed scale
		focalLengthFreeCam=21,--{ 0.1-10000 } -- 
		focusDistanceFreeCam=8.175,--{ 0.01-1000 } -- 
		apertureFreeCam=1.875,--{ 0.001-100 } -- 
		distanceFreeCam=0,--{ 0-100 } -- 
		targetInterpTimeFreeCam=0,--{ 0-100 } -- 
		rotationLimitMinXFreeCam=-90,--{ -90-0 } -- 
		rotationLimitMaxXFreeCam=90,--{ 0-90 } -- 
		alphaDistanceFreeCam=0,--{ 0-10 } -- 
		disableCamText=0,--{ 0-1 } -- Disable mode text feedback
		--Cam - PlayCam menu
		cam_focalLength=21,--{ 0.1-10000 } -- Focal length
		cam_focusDistance=0.9,--{ 0.1-30 } -- Focus distance
		cam_aperture=1.875,--{ 0.001-100 } -- Apeture
		cam_isFollowPos=0,--{ 0-1 } -- Follow Position
		cam_isFollowRot=0,--{ 0-1 } -- Follow Rotation
		cam_offsetTargetX=0,--{ -1000-1000 } -- Target offset X
		cam_offsetTargetY=0,--{ -1000-1000 } -- Target offset Y
		cam_offsetTargetZ=0,--{ -1000-1000 } -- Target offset Z
		cam_offsetPosX=0,--{ -1000-1000 } -- Position offset X
		cam_offsetPosY=0,--{ -1000-1000 } -- Position offset Y
		cam_offsetPosZ=0,--{ -1000-1000 } -- Position offset Z
		cam_followTime=5,--{ 0-10000 } -- Follow time
		cam_followDelayTime=0.3,--{ 0-1 } -- Follow delay time
		cam_timeToSleep=10,--{ 0-10000 } -- Time till end
		cam_fitOnCamera=0,--{ 0-1 } -- Fit on camera
		cam_timeToStartToFitCamera=0.01,--{ 0-1000 } -- Fit start time
		cam_fitCameraInterpTime=0.24,--{ 0-5 } -- Fit interp time
		cam_diffFocalLengthToReFitCamera=16,--{ 0-100 } -- Fit diff focal length
		cam_callSeOfCameraInterp=0,--{ 0-1 } -- Call Se of Camera Interp
		cam_useLastSelectedIndex=0,--{ 0-1 } -- Use last selected index
		cam_isCollisionCheck=0,--{ 0-1 } -- Collision check
		--Cam - Player Cam hook menu
		camhook_enable=0,--{ 0-1 } -- Enable Player Cam hook
		camhook_focalLength_NORMAL=21,--{ 0.01-3500 } -- FocalLength Normal
		camhook_focalLength_AIMING=22,--{ 0.01-3500 } -- FocalLength Aiming
		camhook_focalLength_HIDING=26,--{ 0.01-3500 } -- FocalLength Hiding
		camhook_focalLength_CQC=32,--{ 0.01-3500 } -- FocalLength CQC
		camhook_ApplyFOV=81,--{ 1-179 } -- Apply FOV
		--Cutscenes menu
		useSoldierForDemos=0,--{ 0-1 } -- Use selected soldier in all cutscenes and missions
		mbDemoSelection=0,--{ DEFAULT, PLAY, DISABLED } -- MB cutscene play mode
		mbSelectedDemo="GoToMotherBaseAfterQuietBattle",--{ GoToMotherBaseAfterQuietBattle, ArrivedMotherBaseAfterQuietBattle, ArrivedMotherBaseFromDeathFactory, ArrivedMotherBaseLiquid, QuietReceivesPersecution, TheGreatEscapeLiquid, ParasiticWormCarrierKill, AnableDevBattleGear, DevelopedBattleGear1, QuietHasFriendshipWithChild, QuietOnHeliInRain, InterrogateQuiet, DecisionHuey, EntrustDdog, DdogComeToGet, DdogGoWithMe, HappyBirthDayWithQuiet, HappyBirthDay, AttackedFromOtherPlayer_KnowWhereFrom, AttackedFromOtherPlayer_UnknowWhereFrom, QuietWishGoMission, NuclearEliminationCeremony, ForKeepNuclearElimination, SacrificeOfNuclearElimination, MoraleOfMBIsLow, EliLookSnake, LiquidAndChildSoldier, OcelotIsPupilOfSnake, CodeTalkerSunBath, LongTimeNoSee_DdogSuperHighLikability, LongTimeNoSee_DdogHighLikability, LongTimeNoSee_DdogLowLikability, LongTimeNoSee_DdogPup, LongTimeNoSee_DDSoldier, SnakeHasBadSmell_000, SnakeHasBadSmell_001, SnakeHasBadSmell_WithoutQuiet, PazPhantomPain1, PazPhantomPain2, PazPhantomPain4, PazPhantomPain4_jp, DetailsNuclearDevelop, EndingSacrificeOfNuclear, DevelopedBattleGear2, DevelopedBattleGear4, DevelopedBattleGear5, ArrivedMotherBaseChildren } -- Select MB cutscene (REQ: Play selected)
		forceDemoAllowAction=0,--{ 0-1 } -- Force allow actions
		mbDemoOverrideTime=0,--{ DEFAULT, CURRENT, CUSTOM } -- Override time
		mbDemoHour=0,--{ 0-23 } -- Hour
		mbDemoMinute=0,--{ 0-59 } -- Minute
		mbDemoOverrideWeather=0,--{ DEFAULT, CURRENT, SUNNY, CLOUDY, RAINY, SANDSTORM, FOGGY, POURING } -- Override weather
		--Debug menu
		telopMode=0,--{ 0-1 } -- Disable mission intro credits
		--Enemy Prep menu
		revengeModeFREE=0,--{ DEFAULT, CUSTOM, NONDEFAULT } -- Free roam prep mode
		revengeModeMISSION=0,--{ DEFAULT, CUSTOM, NONDEFAULT } -- Missions prep mode
		revengeModeMB_ALL=0,--{ OFF, FOB, DEFAULT, CUSTOM, NONDEFAULT } -- Mother base prep mode
		customSoldierTypeFREE=0,--{ OFF, RANDOM, DRAB, TIGER, SNEAKING_SUIT, BATTLE_DRESS, SWIMWEAR, SWIMWEAR2, SWIMWEAR3, PFA_ARMOR, SOVIET_A, SOVIET_B, PF_A, PF_B, PF_C, SOVIET_BERETS, SOVIET_HOODIES, SOVIET_ALL, PF_MISC, PF_ALL, MSF_GZ, MSF_TPP, XOF, XOF_GASMASK, XOF_GZ, GENOME_SOLDIER } -- Custom soldier type in Free roam
		customSoldierTypeMISSION=0,--{ OFF, RANDOM, DRAB, TIGER, SNEAKING_SUIT, BATTLE_DRESS, SWIMWEAR, SWIMWEAR2, SWIMWEAR3, PFA_ARMOR, SOVIET_A, SOVIET_B, PF_A, PF_B, PF_C, SOVIET_BERETS, SOVIET_HOODIES, SOVIET_ALL, PF_MISC, PF_ALL, MSF_GZ, MSF_TPP, XOF, XOF_GASMASK, XOF_GZ, GENOME_SOLDIER } -- Custom soldier type in Missions
		changeCpTypeFREE=0,--{ DEFAULT, TYPE_SOVIET, TYPE_AMERICA, TYPE_AFRIKAANS } -- Force CP type in Free Roam
		changeCpTypeMISSION=0,--{ DEFAULT, TYPE_SOVIET, TYPE_AMERICA, TYPE_AFRIKAANS } -- Force CP type in Missions
		changeCpTypeMB_ALL=0,--{ DEFAULT, TYPE_SOVIET, TYPE_AMERICA, TYPE_AFRIKAANS } -- Force CP type in MB
		changeCpSubTypeFREE=0,--{ 0-1 } -- Random CP subtype in free roam
		changeCpSubTypeMISSION=0,--{ 0-1 } -- Random CP subtype in missions
		enableInfInterrogation=0,--{ 0-1 } -- IH interrogation in free roam
		--Custom prep menu
		reinforceCount_MIN=1,--{ 1-99 } -- Reinforce calls min
		reinforceCount_MAX=5,--{ 1-99 } -- Reinforce calls max
		reinforceLevel_MIN="NONE",--{ NONE, SUPER_REINFORCE, BLACK_SUPER_REINFORCE } -- Vehicle reinforcement level min
		reinforceLevel_MAX="BLACK_SUPER_REINFORCE",--{ NONE, SUPER_REINFORCE, BLACK_SUPER_REINFORCE } -- Vehicle reinforcement level max
		revengeIgnoreBlocked_MIN=0,--{ 0-1 } -- Ignore combat-deploy supply blocks min
		revengeIgnoreBlocked_MAX=0,--{ 0-1 } -- Ignore combat-deploy supply blocks max
		--Weapon deployment
		SNIPER_MIN=0,--{ 0-100 } --  (percentage)
		SNIPER_MAX=100,--{ 0-100 } --  (percentage)
		MISSILE_MIN=0,--{ 0-100 } --  (percentage)
		MISSILE_MAX=100,--{ 0-100 } --  (percentage)
		MG_MIN=0,--{ 0-100 } --  (percentage)
		MG_MAX=100,--{ 0-100 } --  (percentage)
		SHOTGUN_MIN=0,--{ 0-100 } --  (percentage)
		SHOTGUN_MAX=100,--{ 0-100 } --  (percentage)
		SMG_MIN=0,--{ 0-100 } --  (percentage)
		SMG_MAX=100,--{ 0-100 } --  (percentage)
		ASSAULT_MIN=0,--{ 0-100 } --  (percentage)
		ASSAULT_MAX=100,--{ 0-100 } --  (percentage)
		GUN_LIGHT_MIN=0,--{ 0-100 } --  (percentage)
		GUN_LIGHT_MAX=100,--{ 0-100 } --  (percentage)
		--Armor deployment
		ARMOR_MIN=0,--{ 0-100 } --  (percentage)
		ARMOR_MAX=100,--{ 0-100 } --  (percentage)
		SOFT_ARMOR_MIN=0,--{ 0-100 } --  (percentage)
		SOFT_ARMOR_MAX=100,--{ 0-100 } --  (percentage)
		SHIELD_MIN=0,--{ 0-100 } --  (percentage)
		SHIELD_MAX=100,--{ 0-100 } --  (percentage)
		--Headgear deployment
		HELMET_MIN=0,--{ 0-100 } --  (percentage)
		HELMET_MAX=100,--{ 0-100 } --  (percentage)
		NVG_MIN=0,--{ 0-100 } --  (percentage)
		NVG_MAX=100,--{ 0-100 } --  (percentage)
		GAS_MASK_MIN=0,--{ 0-100 } --  (percentage)
		GAS_MASK_MAX=100,--{ 0-100 } --  (percentage)
		--CP deterrent deployment
		DECOY_MIN=0,--{ 0-100 } --  (percentage)
		DECOY_MAX=100,--{ 0-100 } --  (percentage)
		MINE_MIN=0,--{ 0-100 } --  (percentage)
		MINE_MAX=100,--{ 0-100 } --  (percentage)
		CAMERA_MIN=0,--{ 0-100 } --  (percentage)
		CAMERA_MAX=100,--{ 0-100 } --  (percentage)
		--Soldier abilities
		STEALTH_MIN="NONE",--{ NONE, LOW, HIGH, SPECIAL } -- Adjusts enemy soldiers notice,cure,reflex and speed ablilities.
		STEALTH_MAX="SPECIAL",--{ NONE, LOW, HIGH, SPECIAL } -- 
		COMBAT_MIN="NONE",--{ NONE, LOW, HIGH, SPECIAL } -- Adjusts enemy soldiers shot,grenade,reload,hp and speed abilities.
		COMBAT_MAX="SPECIAL",--{ NONE, LOW, HIGH, SPECIAL } -- 
		HOLDUP_MIN="NONE",--{ NONE, LOW, HIGH, SPECIAL } -- 
		HOLDUP_MAX="SPECIAL",--{ NONE, LOW, HIGH, SPECIAL } -- 
		FULTON_MIN="NONE",--{ NONE, LOW, HIGH, SPECIAL } -- 
		FULTON_MAX="SPECIAL",--{ NONE, LOW, HIGH, SPECIAL } -- 
		--Weapon strength menu
		STRONG_WEAPON_MIN=0,--{ 0-1 } -- 
		STRONG_WEAPON_MAX=1,--{ 0-1 } -- 
		STRONG_SNIPER_MIN=0,--{ 0-1 } -- 
		STRONG_SNIPER_MAX=1,--{ 0-1 } -- 
		STRONG_MISSILE_MIN=0,--{ 0-1 } -- 
		STRONG_MISSILE_MAX=1,--{ 0-1 } -- 
		--CP equip strength menu
		ACTIVE_DECOY_MIN=0,--{ 0-1 } -- 
		ACTIVE_DECOY_MAX=1,--{ 0-1 } -- 
		GUN_CAMERA_MIN=0,--{ 0-1 } -- 
		GUN_CAMERA_MAX=1,--{ 0-1 } -- 
		--Prep system menu
		revengeBlockForMissionCount=3,--{ 0-10 } -- Resupply in #missions
		applyPowersToOuterBase=0,--{ 0-1 } -- Apply enemy prep to guard posts
		applyPowersToLrrp=0,--{ 0-1 } -- Apply enemy prep to patrol soldiers
		allowHeavyArmorFREE=0,--{ 0-1 } -- Allow heavy armor in free roam (may have issues)
		allowHeavyArmorMISSION=0,--{ 0-1 } -- Allow heavy armor in all missions (may have issues)
		disableMissionsWeaponRestriction=0,--{ 0-1 } -- Disable weapon restrictions in certain missions
		disableNoStealthCombatRevengeMission=0,--{ 0-1 } -- Allow Enemy Prep change from free roam
		revengeDecayOnLongMbVisit=0,--{ 0-1 } -- Enemy prep decrease on long MB visit
		allowHeadGearCombo=0,--{ 0-1 } -- Allow helmet and NVG or Gas mask combo
		balanceHeadGear=0,--{ 0-1 } -- Ballance heavy armor and head gear distribution
		allowMissileWeaponsCombo=0,--{ 0-1 } -- Allow missile combo with other weapons
		enableMgVsShotgunVariation=0,--{ 0-1 } -- Mg vs Shotgun variation
		randomizeSmallCpPowers=0,--{ 0-1 } -- Balance small CPs
		disableConvertArmorToShield=0,--{ 0-1 } -- Disable convert armor to shield (if armor off)
		randomizeMineTypes=0,--{ 0-1 } -- Randomize minefield mine types
		additionalMineFields=0,--{ 0-1 } -- Enable additional minefields
		--Custom soldier equip menu
		weaponTableGlobalFREE=0,--{ DEFAULT } -- Global soldier weapon table in FreeRoam
		weaponTableGlobalMISSION=0,--{ DEFAULT } -- Global soldier weapon table in Missions
		weaponTableGlobalMB_ALL=0,--{ DEFAULT } -- Global soldier weapon table in MB
		customWeaponTableFREE=0,--{ 0-1 } -- Enemy use custom weapon table in free roam
		customWeaponTableMISSION=0,--{ 0-1 } -- Enemy use custom equip table in missions
		customWeaponTableMB_ALL=0,--{ 0-1 } -- MB staff use custom equip table
		weaponTableStrength="NORMAL",--{ NORMAL, STRONG, COMBINED } -- Weapon stengths
		weaponTableAfgh=1,--{ 0-1 } -- Include Soviet weapons
		weaponTableMafr=1,--{ 0-1 } -- Include PF weapons
		weaponTableSkull=1,--{ 0-1 } -- Include XOF weapons
		weaponTableDD=0,--{ 0-1 } -- Include DD weapons
		soldierEquipGrade_MIN=3,--{ 1-15 } -- DD weapons grade MIN
		soldierEquipGrade_MAX=15,--{ 1-15 } -- DD weapons grade MAX
		allowUndevelopedDDEquip=0,--{ 0-1 } -- Allow undeveloped DD weapons
		mbDDEquipNonLethal=0,--{ 0-1 } -- DD equipment non-lethal
		--Enemy phases menu
		phaseUpdate=0,--{ 0-1 } -- Enable phase modifications
		minPhase="PHASE_SNEAK",--{ PHASE_SNEAK, PHASE_CAUTION, PHASE_EVASION, PHASE_ALERT } -- Minimum phase
		maxPhase="PHASE_ALERT",--{ PHASE_SNEAK, PHASE_CAUTION, PHASE_EVASION, PHASE_ALERT } -- Maximum phase
		keepPhase=0,--{ 0-1 } -- Don't downgrade phase
		phaseUpdateRate=3,--{ 1-255 } -- Phase mod update rate (seconds)
		phaseUpdateRange=0,--{ 0-255 } -- Phase mod random variation
		soldierAlertOnHeavyVehicleDamage="PHASE_SNEAK",--{ PHASE_SNEAK, PHASE_CAUTION, PHASE_EVASION, PHASE_ALERT } -- Alert phase on vehicle attack
		printPhaseChanges=0,--{ 0-1 } -- Print phase changes
		--Enemy reinforcements menu
		forceSuperReinforce=0,--{ OFF, ON_CONFIG, FORCE_CONFIG } -- Vehicle reinforcements
		enableHeliReinforce=0,--{ 0-1 } -- Force enable enemy heli reinforce (disables heli sideops)
		forceReinforceRequest=0,--{ 0-1 } -- Force reinforce request for heli
		disableReinforceHeliPullOut=0,--{ 0-1 } -- Disable reinforce heli pull-out
		enableSoldiersWithVehicleReinforce=0,--{ 0-1 } -- Soldier reinforce with all vehicle reinforce types
		--Events menu
		gameevent_chanceHUNTED=0,--{ 0-100 } -- Hunted event chance (percentage)
		gameevent_chanceCRASHLAND=0,--{ 0-100 } -- Crashland event chance (percentage)
		gameevent_chanceLOST_COMS=0,--{ 0-100 } -- Lost Coms event chance (percentage)
		gameevent_chanceTRAINING=0,--{ 0-100 } -- DD Training wargame event chance (percentage)
		gameevent_chanceINVASION=0,--{ 0-100 } -- Invasion event chance (percentage)
		gameevent_chanceZOMBIE_DD=0,--{ 0-100 } -- DD Infection event chance (percentage)
		gameevent_chanceZOMBIE_OBLITERATION=0,--{ 0-100 } -- Zombie Obliteration event chance (percentage)
		--Skulls event menu
		parasite_enableEventFREE=0,--{ 0-1 } -- Enable Skull attacks in Free roam
		parasite_enabledARMOR=1,--{ 0-1 } -- Allow armor skulls
		parasite_enabledMIST=1,--{ 0-1 } -- Allow mist skulls
		parasite_enabledCAMO=1,--{ 0-1 } -- Allow sniper skulls
		parasite_eventPeriod_MIN=10,--{ 0-180 } -- Skull attack min (minutes)
		parasite_eventPeriod_MAX=30,--{ 0-180 } -- Skull attack max (minutes)
		parasite_weather="PARASITE_FOG",--{ NONE, PARASITE_FOG, RANDOM } -- Weather on Skull attack
		parasite_zombieLife=300,--{ 0-10000 } -- 
		parasite_zombieStamina=200,--{ 0-10000 } -- 
		parasite_msfRate=10,--{ 0-100 } -- Percentage chance a zombified soldier will have msf zombie behaviour
		parasite_msfCombatLevel_MIN=0,--{ 0-9 } -- 
		parasite_msfCombatLevel_MAX=9,--{ 0-9 } -- 
		parasite_playerRange=175,--{ 0-1000 } -- 
		parasite_sightDistance=25,--{ 0-1000 } -- 
		parasite_sightDistanceCombat=75,--{ 0-1000 } -- 
		parasite_sightVertical=40,--{ 0-1000 } -- 
		parasite_sightHorizontal=60,--{ 0-1000 } -- 
		parasite_noiseRate=8,--{ 0-100 } -- 
		parasite_avoidSideMin=8,--{ 0-100 } -- 
		parasite_avoidSideMax=12,--{ 0-100 } -- 
		parasite_areaCombatBattleRange=50,--{ 0-1000 } -- 
		parasite_areaCombatBattleToSearchTime=1,--{ 0-100 } -- 
		parasite_areaCombatLostSearchRange=1000,--{ 0-10000 } -- 
		parasite_areaCombatLostToGuardTime=120,--{ 0-1000 } -- 
		parasite_throwRecastTime=10,--{ 0-1000 } -- 
		parasite_defenseValueMain=4000,--{ 0-100000 } -- 
		parasite_defenseValueArmor=7000,--{ 0-100000 } -- 
		parasite_defenseValueWall=8000,--{ 0-100000 } -- 
		parasite_offenseGrade=2,--{ 0-100 } -- 
		parasite_defenseGrade=7,--{ 0-100 } -- 
		parasite_defenseValueCAMO=4000,--{ 0-100000 } -- 
		parasite_offenseGradeCAMO=2,--{ 0-100 } -- 
		parasite_defenseGradeCAMO=7,--{ 0-100 } -- 
		parasite_escapeDistanceARMOR=250,--{ 0-10000 } -- 
		parasite_escapeDistanceMIST=0,--{ 0-10000 } -- 
		parasite_escapeDistanceCAMO=250,--{ 0-10000 } -- 
		parasite_spawnRadiusARMOR=40,--{ 0-1000 } -- 
		parasite_spawnRadiusMIST=20,--{ 0-1000 } -- 
		parasite_spawnRadiusCAMO=10,--{ 0-1000 } -- 
		parasite_timeOutARMOR=0,--{ 0-1000 } -- 
		parasite_timeOutMIST=60,--{ 0-1000 } -- 
		parasite_timeOutCAMO=0,--{ 0-1000 } -- 
		--Fulton menu
		fulton_autoFultonFREE=0,--{ 0-1 } -- Extraction team in Free Roam
		fulton_autoFultonMISSION=0,--{ 0-1 } -- Extraction team in Missions
		fulton_recoverCritical=0,--{ 0-1 } -- Extraction recover critical
		disableFulton=0,--{ 0-1 } -- Disable fulton action
		--Fulton levels menu
		itemLevelFulton=0,--{ DEFAULT, GRADE1, GRADE2, GRADE3, GRADE4 } -- Fulton Level
		itemLevelWormhole=0,--{ DEFAULT, DISABLE, ENABLE } -- Wormhole Level
		--Fulton success menu
		fultonVariationRange=0,--{ 0-100 } -- Fulton success variation
		fultonSoldierVariationRange=0,--{ 0-100 } -- Soldier fulton success variation
		fultonVariationInvRate=100,--{ 1-1000 } -- Fulton variation inv rate
		fultonDyingPenalty=70,--{ 0-100 } -- Target dying penalty
		fultonSleepPenalty=0,--{ 0-100 } -- Target sleeping penalty
		fultonHoldupPenalty=10,--{ 0-100 } -- Target holdup penalty
		fultonHostageHandling=0,--{ DEFAULT, ZERO } -- Hostage handling
		--Mission-prep features menu
		heliSpace_SkipMissionPreparetionFREE=0,--{ DEFAULT, FALSE, TRUE } -- Skip mission prep for Free Roam
		heliSpace_SkipMissionPreparetionMISSION=0,--{ DEFAULT, FALSE, TRUE } -- Skip mission prep for Story Mission
		heliSpace_SkipMissionPreparetionMB_ALL=0,--{ DEFAULT, FALSE, TRUE } -- Skip mission prep for MB
		heliSpace_NoBuddyMenuFromMissionPreparetionFREE=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-buddy for Free Roam
		heliSpace_NoBuddyMenuFromMissionPreparetionMISSION=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-buddy for Story Mission
		heliSpace_NoBuddyMenuFromMissionPreparetionMB_ALL=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-buddy for MB
		heliSpace_NoVehicleMenuFromMissionPreparetionFREE=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-vehicle for Free Roam
		heliSpace_NoVehicleMenuFromMissionPreparetionMISSION=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-vehicle for Story Mission
		heliSpace_NoVehicleMenuFromMissionPreparetionMB_ALL=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-vehicle for MB
		heliSpace_DisableSelectSortieTimeFromMissionPreparetionFREE=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-sortie time for Free Roam
		heliSpace_DisableSelectSortieTimeFromMissionPreparetionMISSION=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-sortie time for Story Mission
		heliSpace_DisableSelectSortieTimeFromMissionPreparetionMB_ALL=0,--{ DEFAULT, FALSE, TRUE } -- Disable select-sortie time for MB
		--Mother Base menu
		mbSoldierEquipRange="SHORT",--{ SHORT, MEDIUM, LONG, RANDOM } -- MB Equip Range Type (MB Prep mode FOB only)
		customSoldierTypeMB_ALL=0,--{ OFF, RANDOM, DRAB, TIGER, SNEAKING_SUIT, BATTLE_DRESS, SWIMWEAR, SWIMWEAR2, SWIMWEAR3, PFA_ARMOR, SOVIET_A, SOVIET_B, PF_A, PF_B, PF_C, SOVIET_BERETS, SOVIET_HOODIES, SOVIET_ALL, PF_MISC, PF_ALL, MSF_GZ, MSF_TPP, XOF, XOF_GASMASK, XOF_GZ, GENOME_SOLDIER } -- DD Suit
		customSoldierTypeFemaleMB_ALL=0,--{ OFF, RANDOM, DRAB_FEMALE, TIGER_FEMALE, SNEAKING_SUIT_FEMALE, BATTLE_DRESS_FEMALE, SWIMWEAR_FEMALE, SWIMWEAR2_FEMALE, SWIMWEAR3_FEMALE } -- DD Suit female
		mbDDHeadGear=0,--{ 0-1 } -- DD Head gear
		supportHeliPatrolsMB=0,--{ 0-3 } -- NPC support heli patrols in MB
		attackHeliPatrolsMB="0",--{ 0, 1, 2, 3, 4, ENEMY_PREP } -- Attack heli patrols in MB
		attackHeliTypeMB="SBH",--{ SBH, UTH } -- Attack heli type in MB
		attackHeliFovaMB=0,--{ DEFAULT, BLACK, RED, RANDOM, RANDOM_EACH, ENEMY_PREP } -- Attack heli class in MB
		enableWalkerGearsMB=0,--{ 0-1 } -- Walker gears in MB
		mbWalkerGearsColor="SOVIET",--{ SOVIET, ROGUE_COYOTE, CFA, ZRS, DDOGS, HUEY_PROTO, RANDOM, RANDOM_EACH } -- Walker gears type
		mbWalkerGearsWeapon=0,--{ DEFAULT, MINIGUN, MISSILE, RANDOM, RANDOM_EACH } -- Walker gears weapons
		mbCollectionRepop=0,--{ 0-1 } -- Repopulate plants and diamonds
		mbEnableBuddies=0,--{ 0-1 } -- Enable all buddies
		mbAdditionalSoldiers=0,--{ 0-1 } -- More soldiers on MB plats
		mbqfEnableSoldiers=0,--{ 0-1 } -- Force enable Quaranine platform soldiers
		mbNpcRouteChange=0,--{ 0-1 } -- Soldiers move between platforms
		mbEnableLethalActions=0,--{ 0-1 } -- Allow lethal actions
		mbWargameFemales=0,--{ 0-100 } -- Women in Enemy Invasion mode (percentage)
		mbWarGamesProfile=0,--{ OFF, TRAINING, INVASION, ZOMBIE_DD, ZOMBIE_OBLITERATION } -- Mother Base War Games
		--Staff menu
		mbPrioritizeFemale=0,--{ OFF, DISABLE, MAX, HALF } -- Female staff selection
		mbMoraleBoosts=0,--{ 0-1 } -- Staff-wide morale boost for good visit
		mbIncreaseStaffSaluteReactions=0,--{ 0-1 } -- Add more salute reactions
		--Show characters menu
		mbEnableOcelot=0,--{ 0-1 } -- Enable Ocelot
		mbEnablePuppy=0,--{ OFF, MISSING_EYE, NORMAL_EYES } -- Puppy DDog
		mbShowCodeTalker=0,--{ 0-1 } -- Show Code Talker
		mbShowEli=0,--{ 0-1 } -- Show Eli
		mbShowHuey=0,--{ 0-1 } -- Show Huey
		mbEnableBirds=0,--{ 0-1 } -- Enable Birds
		--Additional NPCs menu
		mbNpc_NURSE_3_FEMALE=0,--{ 0-1 } -- Female nurse
		mbNpc_DOCTOR_0=0,--{ 0-1 } -- Male doctor
		mbNpc_DDS_RESEARCHER=0,--{ 0-1 } -- Male researcher
		mbNpc_DDS_RESEARCHER_FEMALE=0,--{ 0-1 } -- Female researcher
		mbNpc_DDS_GROUNDCREW=0,--{ 0-1 } -- Male groundcrew
		mbNpc_CHILD_0=0,--{ 0-1 } -- Children
		mbNpc_KAZ=0,--{ 0-1 } -- Kaz Miller
		--Show assets menu
		mbShowBigBossPosters=0,--{ 0-1 } -- Show Big Boss posters
		mbShowMbEliminationMonument=0,--{ 0-1 } -- Show nuke elimination monument
		mbShowSahelan=0,--{ 0-1 } -- Show Sahelanthropus
		mbShowShips=0,--{ 0-1 } -- Show ships
		enableFultonAlarmsMB=0,--{ 0-1 } -- Enable asset alarms
		enableIRSensorsMB=0,--{ 0-1 } -- Enable IR sensors
		hideContainersMB=0,--{ 0-1 } -- Hide containers
		hideAACannonsMB=0,--{ 0-1 } -- Hide AA cannons
		hideAAGatlingsMB=0,--{ 0-1 } -- Hide AA gatlings
		hideTurretMgsMB=0,--{ 0-1 } -- Hide turret machineguns
		hideMortarsMB=0,--{ 0-1 } -- Hide mortars
		mbUnlockGoalDoors=0,--{ 0-1 } -- Unlock goal doors
		mbForceBattleGearDevelopLevel=0,--{ 0-5 } -- Force BattleGear built level
		--Patrols and deployments menu
		enableLrrpFreeRoam=0,--{ 0-1 } -- Foot patrols in free roam
		enableWildCardFreeRoam=0,--{ 0-1 } -- Wildcard soldiers Free roam
		attackHeliPatrolsFREE="0",--{ 0, 1, 2, 3, 4, ENEMY_PREP } -- Attack heli patrols in free roam
		attackHeliTypeFREE="SBH",--{ SBH, UTH } -- Attack heli type in FreeRoam
		attackHeliFovaFREE=0,--{ DEFAULT, BLACK, RED, RANDOM, RANDOM_EACH, ENEMY_PREP } -- Attack heli class in FreeRoam
		enableWalkerGearsFREE=0,--{ 0-1 } -- Walker gears in free roam
		vehiclePatrolProfile=0,--{ OFF, SINGULAR, EACH_VEHICLE } -- Vehicle patrols in free roam
		vehiclePatrolClass=0,--{ DEFAULT, DARK_GRAY, OXIDE_RED, RANDOM, RANDOM_EACH, ENEMY_PREP } -- Vehicle patrol class
		vehiclePatrolLvEnable=1,--{ 0-1 } -- Allow jeeps
		vehiclePatrolTruckEnable=1,--{ 0-1 } -- Allow trucks
		vehiclePatrolWavEnable=1,--{ 0-1 } -- Allow wheeled armored vehicles
		vehiclePatrolWavHeavyEnable=1,--{ 0-1 } -- Allow heavy wheeled armored vehicles
		vehiclePatrolTankEnable=1,--{ 0-1 } -- Allow tanks
		putEquipOnTrucks=0,--{ 0-1 } -- Equipment on trucks
		--Player restrictions menu
		disableHeliAttack=0,--{ 0-1 } -- Disable support heli attack
		setSubsistenceSuit=0,--{ 0-1 } -- Force subsistence suit (Olive Drab, no headgear)
		setDefaultHand=0,--{ 0-1 } -- Set hand type to default
		abortMenuItemControl=0,--{ 0-1 } -- Disable abort mission from pause menu
		disableRetry=0,--{ 0-1 } -- Disable retry on mission fail
		gameOverOnDiscovery=0,--{ 0-1 } -- Game over on combat alert
		disableKillChildSoldierGameOver=0,--{ 0-1 } -- Disable game over on killing child soldier
		disableOutOfBoundsChecks=0,--{ 0-1 } -- Disable out of bounds checks
		disableGameOver=0,--{ 0-1 } -- Disable game over
		disableSpySearch=0,--{ 0-1 } -- Disable Intel team enemy spotting
		disableHerbSearch=0,--{ 0-1 } -- Disable Intel team herb spotting (requires game restart)
		dontOverrideFreeLoadout=0,--{ 0-1 } -- Keep equipment Free<>Mission
		--Marking display menu
		disableHeadMarkers=0,--{ 0-1 } -- Disable head markers
		disableXrayMarkers=0,--{ 0-1 } -- Disable Xray marking
		disableWorldMarkers=0,--{ 0-1 } -- Disable world markers
		--Disable mission support-menus menu
		disableMenuDrop=0,--{ 0-1 } -- Disable Supply drop support-menu
		disableMenuBuddy=0,--{ 0-1 } -- Disable Buddies support-menu
		disableMenuAttack=0,--{ 0-1 } -- Disable Attack support-menu
		disableMenuHeliAttack=0,--{ 0-1 } -- Disable Heli attack support-menu
		disableSupportMenu=0,--{ 0-1 } -- Disable Support-menu
		--Item level menu
		itemLevelIntScope=0,--{ DEFAULT, GRADE1, GRADE2, GRADE3, GRADE4 } -- Int-Scope level
		itemLevelIDroid=0,--{ DEFAULT, GRADE1, GRADE2, GRADE3, GRADE4 } -- IDroid level
		--Hand abilities levels menu
		handLevelSonar=0,--{ DEFAULT, DISABLE, GRADE2, GRADE3, GRADE4 } -- Sonar level
		handLevelPhysical=0,--{ DEFAULT, DISABLE, GRADE2, GRADE3, GRADE4 } -- Mobility level
		handLevelPrecision=0,--{ DEFAULT, DISABLE, GRADE2, GRADE3, GRADE4 } -- Precision level
		handLevelMedical=0,--{ DEFAULT, DISABLE, GRADE2, GRADE3, GRADE4 } -- Medical level
		--OSP menu
		primaryWeaponOsp=0,--{ OFF, EQUIP_NONE } -- Primary weapon OSP
		secondaryWeaponOsp=0,--{ OFF, EQUIP_NONE } -- Secondary weapon OSP
		tertiaryWeaponOsp=0,--{ OFF, EQUIP_NONE } -- Back Weapon OSP
		clearItems=0,--{ OFF, EQUIP_NONE } -- Items OSP
		clearSupportItems=0,--{ OFF, EQUIP_NONE } -- Support items OSP
		--Player settings menu
		playerHealthScale=100,--{ 0-650 } -- Player life scale (percentage)
		hero_dontSubtractHeroPoints=0,--{ 0-1 } -- Don't subtract hero points
		hero_dontAddOgrePoints=0,--{ 0-1 } -- Don't add demon points
		hero_heroPointsSubstractOgrePoints=0,--{ 0-1 } -- Hero points subtract demon points
		--Progression menu
		repopulateRadioTapes=0,--{ 0-1 } -- Repopulate music tape radios
		repopAARadars=0,--{ 0-100 } -- Repopulate AA Radars
		--Resource scale menu
		enableResourceScale=0,--{ 0-1 } -- Enable resource amount scales
		resourceScaleMaterial=100,--{ 10-1000 } -- Material case scale (percentage)
		resourceScalePlant=100,--{ 10-1000 } -- Plant scale (percentage)
		resourceScalePoster=100,--{ 10-1000 } -- Poster scale (percentage)
		resourceScaleDiamond=100,--{ 10-1000 } -- Diamond scale (percentage)
		resourceScaleContainer=100,--{ 10-1000 } -- Container scale (percentage)
		--RouteSet menu
		routeset_randomizeRouteSetsMISSION=0,--{ 0-1 } -- Randomize RouteSets in missions
		routeset_randomizeRouteSetsFREE=0,--{ 0-1 } -- Randomize RouteSets in free roam
		routeset_randomizeOnShiftChange=0,--{ 0-1 } -- Randomize on shift change
		routeset_randomizeOnPhaseChange=0,--{ 0-1 } -- Randomize on phase change
		routeset_randomizePriority=0,--{ 0-1 } -- Randomize group priority
		routeset_randomizeGroups=0,--{ 0-1 } -- Randomize group routes
		--Side ops menu
		unlockSideOpNumber=0,--{ 0-157 } -- Open specific sideop #
		unlockSideOps=0,--{ OFF, REPOP, OPEN } -- Unlock Sideops mode
		sideOpsSelectionMode=0,--{ OFF, RANDOM, STORY, EXTRACT_INTERPRETER, BLUEPRINT, EXTRACT_HIGHLY_SKILLED, PRISONER, CAPTURE_ANIMAL, WANDERING_SOLDIER, DDOG_PRISONER, ELIMINATE_HEAVY_INFANTRY, MINE_CLEARING, ELIMINATE_ARMOR_VEHICLE, EXTRACT_GUNSMITH, ELIMINATE_TANK_UNIT, ELIMINATE_PUPPETS, ADDON_QUEST } -- Sideop selection mode
		showAllOpenSideopsOnUi=0,--{ 0-1 } -- Show all open sideops
		ihSideopsPercentageCount=0,--{ 0-1 } -- Include add-on sideops in completion percentage
		quest_enableShootingPracticeRetry=0,--{ 0-1 } -- Enable Shooting Practice Retry
		quest_setShootingPracticeCautionTimeToBestTime=0,--{ 0-1 } -- Set Shooting Practice caution time to best time
		--Sideops category filter menu
		sideops_STORY=1,--{ 0-1 } -- Story/unique
		sideops_EXTRACT_INTERPRETER=1,--{ 0-1 } -- Extract interpreter
		sideops_BLUEPRINT=1,--{ 0-1 } -- Secure blueprint
		sideops_EXTRACT_HIGHLY_SKILLED=1,--{ 0-1 } -- Extract highly-skilled soldier
		sideops_PRISONER=1,--{ 0-1 } -- Prisoner extraction
		sideops_CAPTURE_ANIMAL=1,--{ 0-1 } -- Capture animals
		sideops_WANDERING_SOLDIER=1,--{ 0-1 } -- Extract wandering Mother Base soldier
		sideops_DDOG_PRISONER=1,--{ 0-1 } -- Unlucky Dog
		sideops_ELIMINATE_HEAVY_INFANTRY=1,--{ 0-1 } -- Eliminate heavy infantry
		sideops_MINE_CLEARING=1,--{ 0-1 } -- Mine clearing
		sideops_ELIMINATE_ARMOR_VEHICLE=1,--{ 0-1 } -- Eliminate the armored vehicle unit
		sideops_EXTRACT_GUNSMITH=1,--{ 0-1 } -- Extract the Legendary Gunsmith
		sideops_ELIMINATE_TANK_UNIT=1,--{ 0-1 } -- Eliminate tank unit
		sideops_ELIMINATE_PUPPETS=1,--{ 0-1 } -- Eliminate wandering puppets
		sideops_TARGET_PRACTICE=1,--{ 0-1 } -- Target practice
		--Side ops in missions menu
		enableMissionQuest=0,--{ 0-1 } -- Enable side ops in missions
		forceEnableMissionAllQuest=0,--{ 0-1 } -- Force use all side ops in missions
		--Soldier parameters menu
		soldierParamsProfile=0,--{ 0-1 } -- Enable soldier parameter settings
		soldierHealthScale=100,--{ 0-900 } -- Soldier life scale (percentage)
		soldierSightDistScale=100,--{ 0-400 } -- Soldier sight scale (percentage)
		soldierNightSightDistScale=100,--{ 0-400 } -- Soldier night sight scale (percentage)
		soldierHearingDistScale=100,--{ 0-400 } -- Soldier hearing distance scale (percentage)
		itemDropChance=0,--{ 0-100 } -- Soldier item drop chance (percentage)
		--Support heli menu
		setInvincibleHeli=0,--{ 0-1 } -- Set heli invincible
		setSearchLightForcedHeli=0,--{ DEFAULT, OFF, ON } -- Force searchlight
		disablePullOutHeli=0,--{ 0-1 } -- Disable pull-out
		setLandingZoneWaitHeightTop=20,--{ 5-50 } -- Set LZ wait height
		defaultHeliDoorOpenTime=15,--{ 0-120 } -- Mission start time till open door
		disableLzs=0,--{ OFF, ASSAULT, REGULAR } -- Disable landing zones
		startOnFootFREE=0,--{ OFF, NOT_ASSAULT, ALL } -- Start free roam on foot
		startOnFootMISSION=0,--{ OFF, NOT_ASSAULT, ALL } -- Start missions on foot
		startOnFootMB_ALL=0,--{ OFF, NOT_ASSAULT, ALL } -- Start Mother base on foot
		--Time scale menu
		speedCamContinueTime=10,--{ 0-1000 } -- TSM length (seconds)
		speedCamWorldTimeScale=0.3,--{ 0-100 } -- TSM world time scale
		speedCamPlayerTimeScale=1,--{ 0-100 } -- TSM player time scale
		speedCamNoDustEffect=0,--{ 0-1 } -- No screen effect
		clockTimeScale=20,--{ 1-10000 } -- Clock time scale
		--Weather menu
		weather_fogDensity=0.1,--{ 0-1 } -- Fog density
		weather_fogType="NORMAL",--{ NORMAL, PARASITE, EERIE } -- Fog type
		weather_requestTagInterpTime=0,--{ 0-100 } -- RequestTag interp time
		weather_skyParameterSetSkyScale=0,--{ 0-100 } -- Upper clouds scale
		weather_skyParameterAddOffsetY=-1000,--{ -1000-1000 } -- Horizon clouds height
		weather_skyParameterSetScrollSpeedRate=-100000,--{ -100000-100000 } -- Horizon clouds speed
		--Buddy menu
		quietRadioMode="[Autoplay]",--{ [Autoplay], Heavens Divide, Koi no Yokushiryoku, Gloria, Kids In America, Rebel Yell, The Final Countdown, Nitrogen, Take On Me, Ride A White Horse, Maneater, A Phantom Pain, Only Time Will Tell, Behind the Drapery, Love Will Tear Us Apart, All the Sun Touches, TRUE, Take The DW, Friday Im In Love, Midnight Mirage, Dancing With Tears In My Eyes, The Tangerine, Planet Scape, How 'bout them zombies ey, Snake Eater, 204863, You Spin Me Round, Quiet Life, She Blinded Me With Science, Dormant Stream, Too Shy, Peace Walker } -- Quiets MB radio track
		--MB Ocean menu
		mbEnableOceanSettings=0,--{ 0-1 } -- 
		mbSetOceanBaseHeight=-23,--{ -100-100 } -- 
		mbSetOceanProjectionScale=60,--{ 0-2000 } -- 
		mbSetOceanBlendEnd=380,--{ 0-2000 } -- 
		mbSetOceanFarProjectionAmplitude=0,--{ -100-100 } -- 
		mbSetOceanSpecularIntensity=1,--{ -30-30 } -- 
		mbSetOceanDisplacementStrength=0.01,--{ 0-10 } -- 
		mbSetOceanWaveAmplitude=0.5,--{ 0-10 } -- 
		mbSetOceanWindDirectionP1=0.1,--{ -10-10 } -- 
		mbSetOceanWindDirectionP2=0.1,--{ -10-10 } -- 
		--Motions menu
		motionGroupIndex="NONE",--{ NONE } -- Motion group
		motionGaniIndex="NONE",--{ NONE } -- Motion number
		motionHold=0,--{ 0-1 } -- Hold motion
		motionRepeat=0,--{ 0-1 } -- Repeat motion
		motionCloseMenuOnPlay=0,--{ 0-1 } -- Close menu on Playing motion
		motionPrintOnPlay=0,--{ 0-1 } -- Print motion name on play
	}
}


return this