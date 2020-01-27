--InfBodyInfo.lua
--tex used for IH soldier type change, but can be used as a reference to what game chara models are (mostly look at partsPath)

local this={}
--tex GOTCHA on MB max bodyids are currently interacting with MAX_STAFF_NUM_ON_CLUSTER somehow, above which will force all faces to headgear
-- ex
--  SOME_BODY={
--    bodyIds={--tex if bodyId nil then will fall back to normal GetBodyId, if bodyId is a table (like this example) bodyId is chosen randomly (TODO example bodyId doesnt match body)
--      TppEnemyBodyId.dlf_enef0_def,
--      TppEnemyBodyId.dlf_enef1_def,
--    },
--    partsPath="/Assets/tpp/parts/chara/prs/prs6_main0_def_v00_ih_sol.parts",--tex parts for soldier base, usually matches a vanilla .parts (minus the _ih_sol suffix)
--    partsPathHostage="/Assets/tpp/parts/chara/prs/prs6_main0_def_v00_ih_hos.parts",--tex parts for hostage base
--    missionPackPath={
--      "BASE_PACK",--tex indicator for certain get body info functions to use base pack,
--      -- uses "/Assets/tpp/pack/mission2/ih/ih_soldier_base.fpk" for soldier
--      -- and  "/Assets/tpp/pack/mission2/ih/ih_hostage_base.fpk" for hostage
--      "/Assets/tpp/pack/mission2/ih/prs6_main0_mdl.fpk",
--    },
--    hasFace=true,--tex model includes it's own face so don't use fova face
--    hasArmor=true,--tex switches off armor at the config level (if false), for bodies that are mixed
--    isArmor=true,--tex switches armor on at the soldier config level, for bodies that are only armor
--    helmetOnly=true,--tex no gas mask or nvg.
--    hasHelmet=true,--tex indicator for DD headgear to not select gear markes as HELMET
--    soldierSubType="DD_FOB",--tex defaults to DD_FOB if not defined.
--    useDDHeadgear=true,--tex use DD headgear as balaclava/GetHeadGearForPowers system
--    noSkinTones=true,--tex body doesn't have different textures for skintones (a lot of models just sidestep this by not showing skin/having gloves), currently only as a note, no system acting on the value
--  },

this.bodyInfo={
  DRAB={--DDS, mother base default
    bodyIds={TppEnemyBodyId.dds8_main0_v00},
    partsPath="/Assets/tpp/parts/chara/dds/dds3_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_wait.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_WAIT
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  DRAB_FEMALE={--DDS, mother base default
    gender="FEMALE",
    bodyIds={TppEnemyBodyId.dds8_main0_v00},
    partsPath="/Assets/tpp/parts/chara/dds/dds8_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_wait.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_WAIT
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  TIGER={--DDS, FOB default
    bodyIds={TppEnemyBodyId.dds5_main0_v00},
    partsPath="/Assets/tpp/parts/chara/dds/dds5_enem0_def_v00.parts",--tex TODO also dds5_main0_v00?
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_attack.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_ATTACKER
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  TIGER_FEMALE={--DDS, FOB default
    gender="FEMALE",
    bodyIds={TppEnemyBodyId.dds6_main0_v00},
    partsPath="/Assets/tpp/parts/chara/dds/dds6_enef0_def_v00.parts",--tex also dds6_main0_def_v00.parts?
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_attack.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_ATTACKER
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  FATIGUES_CAMO_MIX={
    --tex see GOTCHA above
    bodyIds={
      TppEnemyBodyId.dds5_main0_ply_v00,
      TppEnemyBodyId.dds5_main0_ply_v01,
      TppEnemyBodyId.dds5_main0_ply_v02,
      TppEnemyBodyId.dds5_main0_ply_v03,
      TppEnemyBodyId.dds5_main0_ply_v05,
      TppEnemyBodyId.dds5_main0_ply_v06,
      TppEnemyBodyId.dds5_main0_ply_v07,
      TppEnemyBodyId.dds5_main0_ply_v08,
      --none TppEnemyBodyId.dds5_main0_ply_v09,
      TppEnemyBodyId.dds5_main0_ply_v10,
      TppEnemyBodyId.dds5_main0_ply_v11,
      TppEnemyBodyId.dds5_main0_ply_v12,
      TppEnemyBodyId.dds5_main0_ply_v13,
      TppEnemyBodyId.dds5_main0_ply_v14,
      --none TppEnemyBodyId.dds5_main0_ply_v15,
      TppEnemyBodyId.dds5_main0_ply_v16,
      TppEnemyBodyId.dds5_main0_ply_v17,
      TppEnemyBodyId.dds5_main0_ply_v18,
      TppEnemyBodyId.dds5_main0_ply_v19,
      TppEnemyBodyId.dds5_main0_ply_v20,
      --none TppEnemyBodyId.dds5_main0_ply_v21,
      TppEnemyBodyId.dds5_main0_ply_v22,
      TppEnemyBodyId.dds5_main0_ply_v23,
      TppEnemyBodyId.dds5_main0_ply_v24,
      TppEnemyBodyId.dds5_main0_ply_v25,
      TppEnemyBodyId.dds5_main0_ply_v26,
      TppEnemyBodyId.dds5_main0_ply_v27,
      TppEnemyBodyId.dds5_main0_ply_v28,
      TppEnemyBodyId.dds5_main0_ply_v29,
      TppEnemyBodyId.dds5_main0_ply_v30,
      TppEnemyBodyId.dds5_main0_ply_v31,
      TppEnemyBodyId.dds5_main0_ply_v32,
      TppEnemyBodyId.dds5_main0_ply_v33,
      TppEnemyBodyId.dds5_main0_ply_v35,
      TppEnemyBodyId.dds5_main0_ply_v36,
      TppEnemyBodyId.dds5_main0_ply_v37,
      TppEnemyBodyId.dds5_main0_ply_v38,
      TppEnemyBodyId.dds5_main0_ply_v39,
      TppEnemyBodyId.dds5_main0_ply_v40,
      TppEnemyBodyId.dds5_main0_ply_v41,
      TppEnemyBodyId.dds5_main0_ply_v42,
      TppEnemyBodyId.dds5_main0_ply_v43,
      TppEnemyBodyId.dds5_main0_ply_v44,
      TppEnemyBodyId.dds5_main0_ply_v45,
      TppEnemyBodyId.dds5_main0_ply_v46,
      TppEnemyBodyId.dds5_main0_ply_v47,
      TppEnemyBodyId.dds5_main0_ply_v48,
      TppEnemyBodyId.dds5_main0_ply_v49,
      TppEnemyBodyId.dds5_main0_ply_v50,
      TppEnemyBodyId.dds5_main0_ply_v51,
      TppEnemyBodyId.dds5_main0_ply_v52,
      TppEnemyBodyId.dds5_main0_ply_v53,
      TppEnemyBodyId.dds5_main0_ply_v54,
      TppEnemyBodyId.dds5_main0_ply_v55,
      TppEnemyBodyId.dds5_main0_ply_v56,
      TppEnemyBodyId.dds5_main0_ply_v57,
      TppEnemyBodyId.dds5_main0_ply_v58,
      TppEnemyBodyId.dds5_main0_ply_v59,
      TppEnemyBodyId.dds5_main0_ply_v60,
    },
    partsPath="/Assets/tpp/parts/chara/dds/dds3_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_wait.fpk",
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  --tex TODO fova not applying unlike males, dds5 fovas dont apply to dds6 either.
  FATIGUES_CAMO_MIX_FEMALE={
    gender="FEMALE",
    bodyIds={
      TppEnemyBodyId.dds6_main0_ply_v00,
      TppEnemyBodyId.dds6_main0_ply_v01,
      TppEnemyBodyId.dds6_main0_ply_v02,
      TppEnemyBodyId.dds6_main0_ply_v03,
      TppEnemyBodyId.dds6_main0_ply_v05,
      TppEnemyBodyId.dds6_main0_ply_v06,
      TppEnemyBodyId.dds6_main0_ply_v07,
      TppEnemyBodyId.dds6_main0_ply_v08,
      TppEnemyBodyId.dds6_main0_ply_v10,
      TppEnemyBodyId.dds6_main0_ply_v11,
      TppEnemyBodyId.dds6_main0_ply_v12,
      TppEnemyBodyId.dds6_main0_ply_v13,
      TppEnemyBodyId.dds6_main0_ply_v14,
      TppEnemyBodyId.dds6_main0_ply_v16,
      TppEnemyBodyId.dds6_main0_ply_v17,
      TppEnemyBodyId.dds6_main0_ply_v18,
      TppEnemyBodyId.dds6_main0_ply_v19,
      TppEnemyBodyId.dds6_main0_ply_v20,
      TppEnemyBodyId.dds6_main0_ply_v22,
      TppEnemyBodyId.dds6_main0_ply_v23,
      TppEnemyBodyId.dds6_main0_ply_v24,
      TppEnemyBodyId.dds6_main0_ply_v25,
      TppEnemyBodyId.dds6_main0_ply_v26,
      TppEnemyBodyId.dds6_main0_ply_v27,
      TppEnemyBodyId.dds6_main0_ply_v28,
      TppEnemyBodyId.dds6_main0_ply_v29,
      TppEnemyBodyId.dds6_main0_ply_v30,
      TppEnemyBodyId.dds6_main0_ply_v31,
      TppEnemyBodyId.dds6_main0_ply_v32,
      TppEnemyBodyId.dds6_main0_ply_v33,
      TppEnemyBodyId.dds6_main0_ply_v35,
      TppEnemyBodyId.dds6_main0_ply_v36,
      TppEnemyBodyId.dds6_main0_ply_v37,
      TppEnemyBodyId.dds6_main0_ply_v38,
      TppEnemyBodyId.dds6_main0_ply_v39,
      TppEnemyBodyId.dds6_main0_ply_v40,
      TppEnemyBodyId.dds6_main0_ply_v41,
      TppEnemyBodyId.dds6_main0_ply_v42,
      TppEnemyBodyId.dds6_main0_ply_v43,
      TppEnemyBodyId.dds6_main0_ply_v44,
      TppEnemyBodyId.dds6_main0_ply_v45,
      TppEnemyBodyId.dds6_main0_ply_v46,
      TppEnemyBodyId.dds6_main0_ply_v47,
      TppEnemyBodyId.dds6_main0_ply_v48,
      TppEnemyBodyId.dds6_main0_ply_v49,
      TppEnemyBodyId.dds6_main0_ply_v50,
      TppEnemyBodyId.dds6_main0_ply_v51,
      TppEnemyBodyId.dds6_main0_ply_v52,
      TppEnemyBodyId.dds6_main0_ply_v53,
      TppEnemyBodyId.dds6_main0_ply_v54,
      TppEnemyBodyId.dds6_main0_ply_v55,
      TppEnemyBodyId.dds6_main0_ply_v56,
      TppEnemyBodyId.dds6_main0_ply_v57,
      TppEnemyBodyId.dds6_main0_ply_v58,
      TppEnemyBodyId.dds6_main0_ply_v59,
      TppEnemyBodyId.dds6_main0_ply_v60,
    },

    partsPath="/Assets/tpp/parts/chara/dds/dds8_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_wait.fpk",
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  SNEAKING_SUIT={--DDS
    bodyIds={TppEnemyBodyId.dds4_enem0_def},
    partsPath="/Assets/tpp/parts/chara/sna/sna4_enem0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_sneak.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SNEAKING
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  SNEAKING_SUIT_FEMALE={--DDS
    gender="FEMALE",
    bodyIds={TppEnemyBodyId.dds4_enef0_def},
    partsPath="/Assets/tpp/parts/chara/sna/sna4_enef0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_sneak.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SNEAKING
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  BATTLE_DRESS={--DDS
    bodyIds={TppEnemyBodyId.dds5_enem0_def},
    partsPath="/Assets/tpp/parts/chara/sna/sna5_enem0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_btdrs.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_BTRDRS
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
  },
  BATTLE_DRESS_FEMALE={--DDS
    gender="FEMALE",
    bodyIds={TppEnemyBodyId.dds5_enem0_def},
    partsPath="/Assets/tpp/parts/chara/sna/sna5_enef0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_btdrs.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_BTRDRS
    soldierSubType="DD_FOB",
    useDDHeadgear=true,
    config={
      ARMOR=true,
    },
  },
  PFA_ARMOR={
    bodyIds={TppEnemyBodyId.pfa0_v00_a},
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_armor.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_ARMOR--tex this pack is essentially just the mis_com_mafr soldier pack
    isArmor=true,
    helmetOnly=true,--tex no gas mask or nvg.
    hasArmor=true,
    soldierSubType="DD_FOB",
    config={
      ARMOR=true,
    },
  },
  --prologue cyprus gasmask xof
  XOF_GASMASK={
    bodyIds={
      --1,
      TppEnemyBodyId.wss0_main0_v00,--tex applies light in helmet effect?
    },
    partsPath="/Assets/tpp/parts/chara/wss/wss0_main0_def_v00_ih_sol.parts",
    --REF \chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_l01_fpkd
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/wss0_main0_mdl.fpk",
    },
    hasFace=true,
    hasHelmet=true,
    soldierSubType="SKULL_CYPR",
    config={
      HELMET=true,
      GAS_MASK=true,
      NVG=false,
    },
  },
  WSS1_MAIN0={--tex soldier CRASH on loaded/soldier realize
    --bodyIds={1},
    partsPath="/Assets/tpp/parts/chara/wss/wss1_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/wss/wss1_main0_def_v00_ih_hos.parts",
    --REF \chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s06_fpkd
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/wss1_main0_mdl.fpk",
    },
    hasFace=true,
    hasHelmet=true,
    soldierSubType="SKULL_CYPR",
  },
  --GZ XOF, white helmet
  --tex imported from GZ
  XOF_GZ={
    --no bodyid = white helmets with blue bands, wet camo, ISSUE (included) face protudes goggles
    --DEBUGNOW bodyIds={1},--TODO. using non applicable bodyid so it doesnt fall back to SKULL_CYPR table
    --NOTE: GZ has heaps of WSS2 fovas (f00>f19)
    partsPath="/Assets/tpp/parts/chara/wss/wss2_main0_def_v00_ih_sol.parts",
    --REF \chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s06_fpkd
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/wss2_main0_mdl.fpk",
    },
    hasFace=true,
    hasHelmet=true,
    soldierSubType="SKULL_CYPR",
  },
  XOF={--tex Test: when XOF mission fpk loaded it stops salute morale from working?
    bodyIds={
      --tex default = goggles down, green stripe back of helmet
      --1,
      TppEnemyBodyId.wss4_main0_v00,--mixed: clava only, helmet with goggles down, helmet with goggles up | gloves at side
    --tex Cant really tell any difference
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10070\s10070_d01_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v01.fv2
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10070\s10070_d01_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v02.fv2
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10150\s10150_d03_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v01.fv2
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10150\s10150_d03_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v02.fv2
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10151\s10151_d01_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v01.fv2
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10151\s10151_d01_fpk\Assets\tpp\fova\chara\wss\wss4_main0_v02.fv2
    --411,--wss4_main0_v01
    --412,--wss4_main0_v02
    --TODO: TEST, intended for different fmdls, but some times get interesting results from shared textures/sub models
    --TppEnemyBodyId.wss0_main0_v00,
    --TppEnemyBodyId.wss3_main0_v00,
    --tex TODO seen different color stripes at back of helmet, but can't recall from which fova,
    },
    partsPath="/Assets/tpp/parts/chara/wss/wss4_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_xof_soldier.fpk",
    hasFace=true,
    hasHelmet=true,
    soldierSubType="SKULL_AFGH",
    useDDHeadgear=true,
  },
  SOVIET_A={
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    soldierSubType="SOVIET_A",
    hasArmor=true,
  },
  SOVIET_B={
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    soldierSubType="SOVIET_B",
    hasArmor=true,
  },
  PF_A={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    soldierSubType="PF_A",
    hasArmor=true,
  },
  PF_B={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    soldierSubType="PF_B",
    hasArmor=true,
  },
  PF_C={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    soldierSubType="PF_C",
    hasArmor=true,
  },
  --TODO invisibleMeshNames in .parts files, check both tpp and gz .parts
  --TODO theres a bunch of other head modesl (check both tpp and gz, related to above?)
  MSF_GZ={--DDS0_MAIN0 - MSF PW, dirty, 25 on back
    --TODO: blinking troubles
    --TODO: GZ has dds0_v00.fova > dds0_v13.fova
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/dds/dds0_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/dds0_main0_def_v00_ih_hos.parts",--DEBUGNOW
    --\chunk3_dat\Assets\tpp\pack\mission2\free\f30050\f30050_d8010_fpk\Assets\tpp\chara\dds\Scenes\dds0_main0_def.fmdl
    --\chunk3_dat\Assets\tpp\pack\mission2\free\f30050\f30050_d8040_fpk\Assets\tpp\chara\dds\Scenes\dds0_main0_def.fmdl
    --\chunk3_dat\Assets\tpp\pack\mission2\free\f30050\f30050_d8041_fpk\Assets\tpp\chara\dds\Scenes\dds0_main0_def.fmdl
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds0_main0_mdl.fpk",
    },
    hasFace=true,
  },
  --msf from s10115 retake plat
  --TODO no eyes for hostage? check sol again too (if thats ok then maybe need to apply bodyid to hostage?)
  MSF_TPP={--DDS0_MAIN1
    bodyIds={
      TppEnemyBodyId.dds0_main1_v00,--140, TppEnemy.bodyIdTable.DD_PW
    --TppEnemyBodyId.dds0_main1_v01,--141, Mosquito
    },
    partsPath="/Assets/tpp/parts/chara/dds/dds0_main1_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/dds0_main1_def_v00_ih_hos.parts",
    --\chunk3_dat\Assets\tpp\pack\mission2\story\s10115\s10115_area_fpkd
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds0_main1_mdl.fpk",
    },
    hasFace=true,
  },
  --msf 'the medic' body used in Truth photo/heli crash flashback demos
  --no head, but has trouble with soldierface system, eyes missing
  MSF_MEDIC={--DDS0_MAIN2
    bodyIds={
    --tex default/no set fova = no gloves
    --1,--TODO need a no-fova
    --TODO: add to TppEnemyBodyId
    --surgical gloves, clean > increasing bloodyness
    --      406,--dds0_main2_v01
    --      407,--dds0_main2_v02
    --      408,--dds0_main2_v04
    --      409,--dds0_main2_v05
    },
    partsPath="/Assets/tpp/parts/chara/dds/dds0_main2_def_v00_ih_sol.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds0_main2_mdl.fpk",
    },
  },
  --DD pilot 1 - with balaclava/ RIP Morpho, imported from GZ -- soldier CRASH on loaded/soldier realize
  DDS_PILOT1={--DDS1_MAIN0
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/dds/dds1_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/dds1_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds1_main0_mdl.fpk",
    },
    --REF \chunk0_dat\Assets\tpp\pack\mission2\story\s10280\s10280_d14_fpkd\Assets\tpp\parts\chara\dds\dds1_main0_def_v00.parts
    hasFace=true,
  },
  --msf kojima, imported from GZ
  --TODO: gz has dds2_main0_def_v00.parts, dds2_main0_def_v01.parts which adds differen head models via ConnectModelDescription
  --TODO: also hair sim.
  MSF_KOJIMA={--DDS2_MAIN0
    partsPath="/Assets/tpp/parts/chara/dds/dds2_main0_def_v00_ih_sol.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds2_main0_mdl.fpk",
    },
    hasFace=true,
  },
  --tex ground crew - yellow dude that marshals helis with his light sticks in a couple of cutscenes
  --TODO: had head but not face covering, so need to make sure hair is off
  --also side of face covering designed for this faces guys, wide cheeks push through the geometry
  --ISSUE: soldier CRASH on loading
  DDS_GROUNDCREW={--DDS4_MAIN0
    --bodyIds={1},
    partsPath="/Assets/tpp/parts/chara/dds/dds4_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/dds4_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds4_main0_mdl.fpk",
    },
    hasFace=true,--tex TODO but overriding seems fine/cant see any contention for many faces
    noSkinTones=true,
  },
  --DD pilot 2 - with face/Pequad
  DDS_PILOT2={--DDS9_MAIN0
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/dds/dds9_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/dds9_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dds9_main0_mdl.fpk",
    },
    --\chunk2_dat\Assets\tpp\pack\mission2\heli\h40010\h40010_area_fpkd
    hasFace=true,
  },
  MSF_SVS={--Wandering soldier msf
    --GOTCHA pfs and svs swapped due to retailbug, see TppEnemyBodyId/Soldier2FaceAndBodyData
    bodyIds={TppEnemyBodyId.pfs0_dds0_v00},--tex even though there's a lot more BodyId/Soldier2FaceAndBodyData entries, they're all identical/the same fova
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    soldierSubType="DD_FOB",
  },
  MSF_PFS={--Wandering soldier msf
    bodyIds={TppEnemyBodyId.svs0_dds0_v00},--tex as above
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    soldierSubType="DD_FOB",
  },
  SOVIET_BERETS={
    bodyIds={
      TppEnemyBodyId.svs0_unq_v010,
      TppEnemyBodyId.svs0_unq_v020,
      TppEnemyBodyId.svs0_unq_v070,
      TppEnemyBodyId.svs0_unq_v071,
      TppEnemyBodyId.svs0_unq_v072,
      TppEnemyBodyId.svs0_unq_v009,
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noHelmet=true,--tex TODO: just do a whole equip allowed/disallowed
  --soldierSubType="SOVIET_B",
  },
  SOVIET_HOODIES={
    bodyIds={
      TppEnemyBodyId.svs0_unq_v060,
      TppEnemyBodyId.svs0_unq_v100,
      TppEnemyBodyId.svs0_unq_v420,
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
  --soldierSubType="SOVIET_B",
  },
  SOVIET_ALL={
    bodyIds={
      TppEnemyBodyId.svs0_rfl_v00_a,
      TppEnemyBodyId.svs0_rfl_v01_a,
      TppEnemyBodyId.svs0_rfl_v02_a,
      TppEnemyBodyId.svs0_mcg_v00_a,
      TppEnemyBodyId.svs0_mcg_v01_a,
      TppEnemyBodyId.svs0_mcg_v02_a,
      TppEnemyBodyId.svs0_snp_v00_a,
      TppEnemyBodyId.svs0_rdo_v00_a,
      TppEnemyBodyId.svs0_rfl_v00_b,
      TppEnemyBodyId.svs0_rfl_v01_b,
      TppEnemyBodyId.svs0_rfl_v02_b,
      TppEnemyBodyId.svs0_mcg_v00_b,
      TppEnemyBodyId.svs0_mcg_v01_b,
      TppEnemyBodyId.svs0_mcg_v02_b,
      TppEnemyBodyId.svs0_snp_v00_b,
      TppEnemyBodyId.svs0_rdo_v00_b,
      TppEnemyBodyId.sva0_v00_a,
      TppEnemyBodyId.svs0_unq_v010,
      TppEnemyBodyId.svs0_unq_v080,
      TppEnemyBodyId.svs0_unq_v020,
      TppEnemyBodyId.svs0_unq_v040,
      TppEnemyBodyId.svs0_unq_v050,
      TppEnemyBodyId.svs0_unq_v060,
      TppEnemyBodyId.svs0_unq_v100,
      TppEnemyBodyId.svs0_unq_v070,
      TppEnemyBodyId.svs0_unq_v071,
      TppEnemyBodyId.svs0_unq_v072,
      TppEnemyBodyId.svs0_unq_v420,
      TppEnemyBodyId.svs0_unq_v009,
      TppEnemyBodyId.svs0_unq_v421,
      TppEnemyBodyId.pfs0_dds0_v00,--msf
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
  --soldierSubType="SOVIET_B",
  },
  PF_MISC={
    bodyIds={
      TppEnemyBodyId.pfs0_unq_v210,--black beret, glases, black vest, red shirt, tan pants
      TppEnemyBodyId.pfs0_unq_v250,--black beret, white coyote tshirt, black pants
      TppEnemyBodyId.pfs0_unq_v360,--red long sleeve shirt, black pants
      TppEnemyBodyId.pfs0_unq_v280,--black suit, white shirt, red white striped tie
      TppEnemyBodyId.pfs0_unq_v150,--green beret, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v140,--cap, glases, badly clipping medal, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v241,--brown leather top, light tan muddy pants
      --TppEnemyBodyId.pfs0_unq_v242,--brown leather top, light tan muddy pants, cant tell any difference?
      TppEnemyBodyId.pfs0_unq_v450,--red beret, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v440,--red beret, black leather top, black pants
    },
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
  --soldierSubType="PF_C",
  },
  PF_ALL={
    bodyIds={
      TppEnemyBodyId.pfs0_rfl_v00_a,
      TppEnemyBodyId.pfs0_rfl_v01_a,
      TppEnemyBodyId.pfs0_mcg_v00_a,
      TppEnemyBodyId.pfs0_snp_v00_a,
      TppEnemyBodyId.pfs0_rdo_v00_a,
      TppEnemyBodyId.pfs0_rfl_v00_b,
      TppEnemyBodyId.pfs0_rfl_v01_b,
      TppEnemyBodyId.pfs0_mcg_v00_b,
      TppEnemyBodyId.pfs0_snp_v00_b,
      TppEnemyBodyId.pfs0_rdo_v00_b,
      TppEnemyBodyId.pfs0_rfl_v00_c,
      TppEnemyBodyId.pfs0_rfl_v01_c,
      TppEnemyBodyId.pfs0_mcg_v00_c,
      TppEnemyBodyId.pfs0_snp_v00_c,
      TppEnemyBodyId.pfs0_rdo_v00_c,
      TppEnemyBodyId.pfa0_v00_b,
      TppEnemyBodyId.pfa0_v00_c,
      TppEnemyBodyId.pfa0_v00_a,
      TppEnemyBodyId.pfs0_unq_v210,
      TppEnemyBodyId.pfs0_unq_v250,
      TppEnemyBodyId.pfs0_unq_v360,
      TppEnemyBodyId.pfs0_unq_v280,
      TppEnemyBodyId.pfs0_unq_v150,
      TppEnemyBodyId.pfs0_unq_v220,
      TppEnemyBodyId.pfs0_unq_v140,
      TppEnemyBodyId.pfs0_unq_v241,
      TppEnemyBodyId.pfs0_unq_v242,
      TppEnemyBodyId.pfs0_unq_v450,
      TppEnemyBodyId.pfs0_unq_v440,
      TppEnemyBodyId.pfs0_unq_v155,
      TppEnemyBodyId.svs0_dds0_v00,--msf
    },
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
  --soldierSubType="PF_C",
  },
  SWIMWEAR={
    bodyIds={
      TppEnemyBodyId.dlf_enem0_def,
      TppEnemyBodyId.dlf_enem1_def,
      TppEnemyBodyId.dlf_enem2_def,
      TppEnemyBodyId.dlf_enem3_def,
      TppEnemyBodyId.dlf_enem4_def,
      TppEnemyBodyId.dlf_enem5_def,
      TppEnemyBodyId.dlf_enem6_def,
      TppEnemyBodyId.dlf_enem7_def,
      TppEnemyBodyId.dlf_enem8_def,
      TppEnemyBodyId.dlf_enem9_def,
      TppEnemyBodyId.dlf_enem10_def,
      TppEnemyBodyId.dlf_enem11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlf/dlf1_enem0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT,
    soldierSubType="DD_FOB",
  },
  SWIMWEAR_FEMALE={
    gender="FEMALE",
    bodyIds={
      TppEnemyBodyId.dlf_enef0_def,
      TppEnemyBodyId.dlf_enef1_def,
      TppEnemyBodyId.dlf_enef2_def,
      TppEnemyBodyId.dlf_enef3_def,
      TppEnemyBodyId.dlf_enef4_def,
      TppEnemyBodyId.dlf_enef5_def,
      TppEnemyBodyId.dlf_enef6_def,
      TppEnemyBodyId.dlf_enef7_def,
      TppEnemyBodyId.dlf_enef8_def,
      TppEnemyBodyId.dlf_enef9_def,
      TppEnemyBodyId.dlf_enef10_def,
      TppEnemyBodyId.dlf_enef11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlf/dlf0_enem0_def_f_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT,
    soldierSubType="DD_FOB",
  },
  SWIMWEAR2={--GOB SUIT Goblin Suit
    bodyIds={
      TppEnemyBodyId.dlg_enem0_def,
      TppEnemyBodyId.dlg_enem1_def,
      TppEnemyBodyId.dlg_enem2_def,
      TppEnemyBodyId.dlg_enem3_def,
      TppEnemyBodyId.dlg_enem4_def,
      TppEnemyBodyId.dlg_enem5_def,
      TppEnemyBodyId.dlg_enem6_def,
      TppEnemyBodyId.dlg_enem7_def,
      TppEnemyBodyId.dlg_enem8_def,
      TppEnemyBodyId.dlg_enem9_def,
      TppEnemyBodyId.dlg_enem10_def,
      TppEnemyBodyId.dlg_enem11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlg/dlg1_enem0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit2.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT2,
    soldierSubType="DD_FOB",
  },
  SWIMWEAR2_FEMALE={
    gender="FEMALE",
    bodyIds={
      TppEnemyBodyId.dlg_enef0_def,
      TppEnemyBodyId.dlg_enef1_def,
      TppEnemyBodyId.dlg_enef2_def,
      TppEnemyBodyId.dlg_enef3_def,
      TppEnemyBodyId.dlg_enef4_def,
      TppEnemyBodyId.dlg_enef5_def,
      TppEnemyBodyId.dlg_enef6_def,
      TppEnemyBodyId.dlg_enef7_def,
      TppEnemyBodyId.dlg_enef8_def,
      TppEnemyBodyId.dlg_enef9_def,
      TppEnemyBodyId.dlg_enef10_def,
      TppEnemyBodyId.dlg_enef11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlg/dlg0_enem0_def_f_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit2.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT2,
    soldierSubType="DD_FOB",
  },
  SWIMWEAR3={--MEG SUIT Megalodon Suit
    bodyIds={
      TppEnemyBodyId.dlh_enem0_def,
      TppEnemyBodyId.dlh_enem1_def,
      TppEnemyBodyId.dlh_enem2_def,
      TppEnemyBodyId.dlh_enem3_def,
      TppEnemyBodyId.dlh_enem4_def,
      TppEnemyBodyId.dlh_enem5_def,
      TppEnemyBodyId.dlh_enem6_def,
      TppEnemyBodyId.dlh_enem7_def,
      TppEnemyBodyId.dlh_enem8_def,
      TppEnemyBodyId.dlh_enem9_def,
      TppEnemyBodyId.dlh_enem10_def,
      TppEnemyBodyId.dlh_enem11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlh/dlh1_enem0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit3.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT3,
    soldierSubType="DD_FOB",
  },
  SWIMWEAR3_FEMALE={
    gender="FEMALE",
    bodyIds={
      TppEnemyBodyId.dlh_enef0_def,
      TppEnemyBodyId.dlh_enef1_def,
      TppEnemyBodyId.dlh_enef2_def,
      TppEnemyBodyId.dlh_enef3_def,
      TppEnemyBodyId.dlh_enef4_def,
      TppEnemyBodyId.dlh_enef5_def,
      TppEnemyBodyId.dlh_enef6_def,
      TppEnemyBodyId.dlh_enef7_def,
      TppEnemyBodyId.dlh_enef8_def,
      TppEnemyBodyId.dlh_enef9_def,
      TppEnemyBodyId.dlh_enef10_def,
      TppEnemyBodyId.dlh_enef11_def,
    },
    partsPath="/Assets/tpp/parts/chara/dlh/dlh0_enem0_def_f_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_swim_suit3.fpk",--TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SWIM_SUIT3,
    soldierSubType="DD_FOB",
  },
  PRISONER_AFGH={
    bodyIds={
      TppEnemyBodyId.prs2_main0_v00,
      TppEnemyBodyId.prs2_main0_v01,
    },
    partsPath="/Assets/tpp/parts/chara/prs/prs2_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/prs/prs2_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/prs2_main0_mdl.fpk",
    },
    --REF "/Assets/tpp/pack/mission2/common/mis_com_afgh_hostage.fpk",
    soldierSubType="DD_FOB",
  },
  PRISONER_AFGH_FEMALE={
    --TODO partsPath="/Assets/tpp/parts/chara/prs/prs3_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/prs/prs3_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/prs3_main0_mdl.fpk",
    },
  --REF \chunk1_dat\Assets\tpp\pack\mission2\quest\extra\quest_q20025_fpkd
  --and in bunch of other quest fpkds
  },
  --10040 : Mission 6 - Where Do the Bees Sleep Hamid prisoner
  PRISONER_4={
    partsPath="/Assets/tpp/parts/chara/prs/prs4_main0_def_v00.parts",
  --\chunk2_dat\Assets\tpp\pack\mission2\story\s10040\s10040_area_fpkd
  },
  PRISONER_MAFR={
    bodyIds=TppEnemyBodyId.prs5_main0_v00,
    partsPath="/Assets/tpp/parts/chara/prs/prs5_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/prs/prs5_main0_def_v00.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/prs5_main0_mdl.fpk",
    },
    --REF "/Assets/tpp/pack/mission2/common/mis_com_mafr_hostage.fpk",
    soldierSubType="DD_FOB",
  },
  PRISONER_MAFR_FEMALE={
    gender="FEMALE",
    bodyIds={TppEnemyBodyId.prs6_main0_v00},--113
    --TODO partsPath="/Assets/tpp/parts/chara/prs/prs6_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/prs/prs6_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/prs6_main0_mdl.fpk",
    },
    --REF "/Assets/tpp/pack/mission2/common/mis_com_mafr_hostage_woman.fpk",
    soldierSubType="DD_FOB",
  },
  --Kojima prisoner DD tiger body - sideop q99080 Intel Agent Extraction
  --partsPath="/Assets/tpp/parts/chara/prs/prs7_main0_def_v00.parts",
  --\chunk2_dat\Assets\tpp\pack\mission2\quest\afgh\cliffTown\cliffTown_q99080_fpkd

  --PRISONER_DD ??
  --\Assets\tpp\parts\chara\prs\pdd5_main0_def_v00.parts
  --Mission 22 - Retake the Platform
  --\chunk3_dat\Assets\tpp\pack\mission2\story\s10115\s10115_area_fpkd
  --Mission 17 - Rescue the Intel Agents
  --\chunk4_dat\Assets\tpp\pack\mission2\story\s10091\s10091_area_fpkd

  --Doctors
  --also dct0_face0_cov.fmdl, dct0_face1_cov.fmdl
  --also bunch of invisibleMeshNames in original .parts
  DOCTOR_0={
    bodyIds={
      -- fv2s are different faces,
      -- even if head mesh was hidden with custom fv2 the normal soldier faces neck stick through this bodies collar.
      TppEnemyBodyId.dct0_v00,--default face
      TppEnemyBodyId.dct0_v01,
    },
    partsPath="/Assets/tpp/parts/chara/dct/dct0_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dct/dct0_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dct0_main0_mdl.fpk",
    },
    hasFace=true,
  },
  --main prologue doctor
  --noSkinTones=true,--tex no skin tone support/only white
  --TODO fv2s, not in SoldierFaceAndData system
  --dct1_v00
  --dct1_v01
  --CRASH on non mob2
  DOCTOR_1={
    partsPath="/Assets/tpp/parts/chara/dct/dct1_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dct/dct1_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dct1_main0_mdl.fpk",
    },
    noSkinTones=true,--tex no skin tone support/only white
  },
  --TODO fv2s, not in SoldierFaceAndData system
  --dct2_v00
  --dct2_v01
  --dct2_v02
  DOCTOR_2={
    partsPath="/Assets/tpp/parts/chara/dct/dct2_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dct/dct2_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/dct2_main0_mdl.fpk",
    },
    --REF "/Assets/tpp/pack/mission2/common/mis_com_doctor.fpk",
    hasFace=true,
    soldierSubType="DD_FOB",
  },
  --nurses
  --nrs0_main0_def_v00
  --\chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s02_fpkd
  --nrs1_main0_def_v00
  --\chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s02_fpkd
  --nrs2_main0_def_v00
  --\chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s02_fpkd
  --blinking issues
  NURSE_3_FEMALE={
    bodyIds={
      --tex TODO: not in soldierfaceandbody sys
      --nrs3_v00,
      --nrs3_v01,
      --nrs3_v02,
      --nrs0 fovas seem to work on nrs3 too.
      TppEnemyBodyId.nrs0_v00,--brunette,bun
      TppEnemyBodyId.nrs0_v01,--black straight hair
      TppEnemyBodyId.nrs0_v02,--blond, glasses
      TppEnemyBodyId.nrs0_v03,--brunnete bun again? different face?
      TppEnemyBodyId.nrs0_v04,--brown straight, glasses
      TppEnemyBodyId.nrs0_v05,--blond and brunette
      TppEnemyBodyId.nrs0_v06,--brown, bun, glasses
      TppEnemyBodyId.nrs0_v07,--brown, bun
    },
    --partsPath="/Assets/tpp/parts/chara/nrs/nrs3_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/nrs/nrs3_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/nrs3_main0_mdl.fpk",
    },
  --REF "/Assets/tpp/pack/mission2/common/mis_com_nurse.fpk",
  },
  --prologue hospital patients
  PATIENT={
    --TODO has a whole bunch of fv2s
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/ptn0_main0_mdl.fpk",
    },
    --TODO partsPath="/Assets/tpp/parts/chara/ptn/ptn0_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/ptn/ptn0_main0_def_v00_ih_hos.parts",
    --\chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s03_fpkd
    hasFace=true,
  },
  SKULLFACE={--no collision/pushback
    bodyIds={
      TppEnemyBodyId.wsp_def,
      TppEnemyBodyId.wsp_dam,--bloody
    },
    partsPath="/Assets/tpp/parts/chara/wsp/wsp0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_skullface.fpk",
    hasFace=true,
    soldierSubType="SKULL_AFGH",
  },
  HUEY={
    bodyIds={
      TppEnemyBodyId.hyu0_main0_v00,--377 no glasses
      TppEnemyBodyId.hyu0_main0_v01,--378 oval glasses
      TppEnemyBodyId.hyu0_main0_v02,--379 rectangle glasses
    },
    partsPath="/Assets/tpp/parts/chara/hyu/hyu0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_huey.fpk",
    hasFace=true,
    soldierSubType="DD_FOB",
  },
  --kaz1_main0_def_v00.parts
  --\chunk0_dat\Assets\tpp\pack\mission2\story\s10280\s10280_d12_fpkd
  --kaz2_main0_def_v00.parts
  --\chunk2_dat\Assets\tpp\pack\mission2\story\s10020\s10020_area_fpkd
  --\chunk3_dat\Assets\tpp\pack\mission2\story\s10030\s10030_area_fpkd
  --tex no walk, or hit collision target. crash on cqc down
  --mb Kaz - coat and hat
  KAZ={
    --DEBUGNOW bodyIds={1},--tex no bodyId entries, so just using 1 since my code does an if bodyId check TODO see if there's any fovas elsewhere
    partsPath="/Assets/tpp/parts/chara/kaz/kaz0_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/kaz/kaz0_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/kaz0_main0_mdl.fpk",
    },
    --REF "/Assets/tpp/pack/mission2/common/mis_com_miller.fpk",
    hasFace=true,
    soldierSubType="DD_FOB",
  },
  --tex crashes
  KAZ_GZ={
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/kaz/kaz1_main1_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_miller_gz.fpk",
    hasFace=true,
    soldierSubType="DD_FOB",
  },
  OCELOT_0={
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/oce/oce0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/free/f30050/f30050_ocelot.fpk",
    hasFace=true,
  },
  OCELOT_1={
    partsPath="/Assets/tpp/parts/chara/oce/oce1_main0_def_v00.parts",
    --\chunk0_dat\Assets\tpp\pack\mission2\story\s10010\s10010_s07_fpkd
    --\chunk2_dat\Assets\tpp\pack\mission2\story\s10020\s10020_d01_fpkd
    hasFace=true,
  },
  PAZ_GZ={
    --bodyIds={},
    partsPath="/Assets/tpp/parts/chara/paz/paz0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_paz_gz.fpk",
    hasFace=true,
  },
  PAZ={
    partsPath="/Assets/tpp/parts/chara/paz/paz1_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/free/f30050/f30050_paz.fpk",
    hasFace=true,
  },
  --quiet
  --  qui0_main0_def_v00.parts
  --  qui0_main1_def_v00.parts
  --  qui1_main0_def_v00.parts
  --  qui2_main0_def_v00.parts
  --  qui3_main0_def_v00.parts
  --  qui4_main0_def_v00.parts
  --  qui5_main0_def_v00.parts
  --volgin
  --vol0_main0_def_v00.parts
  --vol1_main0_def_v00.parts

  --vol2_main0_def_v00.parts

  --Skulls/parasite unit
  --wmu0_main0_def_v00.parts
  --wmu1_main0_def_v00.parts
  --wmu3_main0_def_v00.parts
  --tex lab coat and red id tag, used in epidemic/quarantine
  --fmdl also contains some dds (drab,tiger) since it's used in shining lights
  DDS_RESEARCHER={
    --bodyIds={
    --1,
    --tex dont know why wolbachia throat shows by default, should only be with the shining lights nvg. and I'm sure I had it at some point without it showing, maybe when they are as soldier, not hostage?
    --TppEnemyBodyId.ddr0_main0_v00,--wolbachia throat, default clean lab coat, ocasionally lab goggles
    --TppEnemyBodyId.ddr0_main0_v01,--wolbachia throat, dds DRAB
    --TppEnemyBodyId.ddr0_main0_v02,--wolbachia throat, dds tiger

    --TppEnemyBodyId.ddr0_main1_v00=149,--bloody lab coat
    --TppEnemyBodyId.ddr0_main1_v01=150,--bloody lab coat with knife stuck in?
    --TppEnemyBodyId.ddr0_main1_v02=151,--fova not in fova common packs, likely in shining lights mission pack
    --TppEnemyBodyId.ddr0_main1_v03=152,--bloody drab
    --TppEnemyBodyId.ddr0_main1_v04=153,--bloody tiger
    -- all have bloody eyeballs
    --not sure goggles are binary on specific fovas or using fova seed/randomisation

    --fovas not in fova common packs, in shining lights mission pack
    -- TppEnemyBodyId.ddr0_main0_v03=166,
    -- TppEnemyBodyId.ddr0_main0_v04=167,
    --
    --  ddr0_main1_v05=168,
    --  ddr0_main1_v06=169,
    --},
    partsPath="/Assets/tpp/parts/chara/dds/ddr0_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/ddr0_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/ddr0_main0_mdl.fpk",
    },
    noSkinTones=true,
  },
  DDS_RESEARCHER_FEMALE={
    --  ddr1_main0_v00=154,
    --  ddr1_main0_v01=155,
    --  ddr1_main0_v02=156,
    --
    --  ddr1_main1_v00=157,
    --  ddr1_main1_v01=158,
    --  ddr1_main1_v02=159,
    gender="FEMALE",
    -- bodyIds={},--tex TODO
    partsPath="/Assets/tpp/parts/chara/dds/ddr1_main0_def_v00_ih_sol.parts",
    partsPathHostage="/Assets/tpp/parts/chara/dds/ddr1_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/ddr1_main0_mdl.fpk",
    },
    noSkinTones=true,
  },
  CODETALKER={
    partsPath="/Assets/tpp/parts/chara/cdt/cdt0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_codetalker.fpk",
    hasFace=true,
  },
  CHICO_GZ={
    partsPath="/Assets/tpp/parts/chara/chi/chi1_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_chico_gz.fpk",
    hasFace=true,
  },
  ISHMAEL={
    partsPath="/Assets/tpp/parts/chara/ish/ish0_main0_def_v00.parts",
    hasFace=true,
  },
  -- kids
  --crash
  CHILD_0={
    bodyIds={
      TppEnemyBodyId.chd0_v00,
      TppEnemyBodyId.chd0_v01,
      TppEnemyBodyId.chd0_v02,
      TppEnemyBodyId.chd0_v03,
      TppEnemyBodyId.chd0_v04,
      TppEnemyBodyId.chd0_v05,
      TppEnemyBodyId.chd0_v06,
      TppEnemyBodyId.chd0_v07,
      TppEnemyBodyId.chd0_v08,
      TppEnemyBodyId.chd0_v09,
      TppEnemyBodyId.chd0_v10,
      TppEnemyBodyId.chd0_v11,
    },
    --partsPath="/Assets/tpp/parts/chara/chd/chd0_main0_def_v00.parts",
    partsPathHostage="/Assets/tpp/parts/chara/chd/chd0_main0_def_v00_ih_hos.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/chd0_main0_mdl.fpk",
    --"/Assets/tpp/pack/mission2/common/mis_com_child_soldier.fpk",
    },
    hasFace=true,
    soldierSubType="CHILD_A",
  },
  CHILD_1={--TODO
    bodyIds={
      TppEnemyBodyId.chd1_v00,
      TppEnemyBodyId.chd1_v01,
      TppEnemyBodyId.chd1_v02,
      TppEnemyBodyId.chd1_v03,
      TppEnemyBodyId.chd1_v04,
      TppEnemyBodyId.chd1_v05,
    },
    partsPath="/Assets/tpp/parts/chara/chd/chd1_main0_def_v00.parts",--DEBUGNOW
    missionPackPath={
    },
    hasFace=true,
    soldierSubType="CHILD_A",
  },
  CHILD_2={--TODO
    bodyIds={
      TppEnemyBodyId.chd2_v00,
      TppEnemyBodyId.chd2_v01,
      TppEnemyBodyId.chd2_v02,
      TppEnemyBodyId.chd2_v03,
      TppEnemyBodyId.chd2_v04,
    },
    partsPath="/Assets/tpp/parts/chara/chd/chd2_main0_def_v00.parts",--DEBUGNOW
    missionPackPath={
    },
    hasFace=true,
    soldierSubType="CHILD_A",
  },

  --voices mission infected prisoners i think
  --plh0_main0_def_v00.parts
  --plh2_main0_def_v00.parts
  --plh3_main0_def_v00.parts
  GENOME_SOLDIER={
    -- bodyIds={},
    partsPath="/Assets/tpp/parts/chara/gns/gns0_main0_def_v00_ih_sol.parts",
    missionPackPath={
      "BASE_PACK",
      "/Assets/tpp/pack/mission2/ih/gns0_main0_mdl.fpk",
    },
    hasFace=true,
    config={
      HELMET=false,
    --GAS_MASK=true,
    --NVG=true,
    },
  },
}
--TABLESETUP
function this.GetBodyIds(bodyInfo)
  local bodyIds=bodyInfo.bodyIds
  if bodyIds then
  elseif bodyInfo.soldierSubType then
    bodyIds={}
    local bodyIdTable=TppEnemy.bodyIdTable[bodyInfo.soldierSubType]
    if bodyIdTable then
      for powerType,bodyTable in pairs(bodyIdTable)do
        for i,_bodyId in ipairs(bodyTable)do
          bodyIds[#bodyIds+1]=_bodyId
        end
      end
    end
  end
  return bodyIds
end

for bodyType,bodyInfo in pairs(this.bodyInfo)do
  if type(bodyInfo)~="table"then
    InfCore.Log("WARNING: bodyInfo~=table : "..tostring(bodyType).."="..tostring(bodyInfo))--DEBUG
  else
    bodyInfo.bodyType=bodyType
    bodyInfo.bodyIds=this.GetBodyIds(bodyInfo)--tex crunches down TppEnemy.bodyIdTable if applicable
  end
end

return this
