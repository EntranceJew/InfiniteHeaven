local subtitlesDaemon=SubtitlesDaemon.GetInstance()
if SubtitlesCommand then
  SubtitlesCommand:SetSubFilePath"/Assets/tpp/ui/Subtitles/sub_old/"
  SubtitlesCommand:SetSubpFilePath"/Assets/tpp/ui/Subtitles/subp/"
  SubtitlesCommand:SetDefaultGeneratorName"Default"
  SubtitlesCommand:SetSubFpkFilePath"/Assets/tpp/pack/ui/subtitles"
end
UiCommonDataManager.Create()
HudCommonDataManager.Create()
local uiCommonDataManager=UiCommonDataManager.GetInstance()
TppUiCommand.CreateUiDependJob()
TppUiCommand.CreateUiUpdateMarkerJob()
TppUiCommand.CreateUiUseGrJob()
TppUiCommand.UiPadStart()
if TppSystemUtility.GetCurrentGameMode()=="MGO"then
  dofile"Tpp/Scripts/Ui/MgoUiBlocksConfig.lua"
  TppUiCommand.CreateResidentBlockController(152720,"/Assets/mgo/pack/ui/ui_resident_data.fpk")
elseif TppGameSequence.GetGameTitleName()=="TPP"then
  if TppGameSequence.GetTargetArea()=="ChinaKorea"then--RETAILPATCH: 1006 added _ck
    TppUiCommand.CreateResidentBlockController(348*1024,"/Assets/tpp/pack/ui/ui_resident_data_ck.fpk")
  else
    TppUiCommand.CreateResidentBlockController(338*1024,"/Assets/tpp/pack/ui/ui_resident_data.fpk")
  end
else
  TppUiCommand.CreateResidentBlockController(460*1024,"/Assets/tpp/pack/ui/gz/gz_ui_resident_data.fpk")
end
TppUiCommand.UiPlatFormSetting()
TppUiCommand.UiAreaSetting()
if TppGameSequence.GetTargetArea()=="ChinaKorea"then--RETAILPATCH: 1006 added _ck
  LanguageBlock.Create(670*1024)--RETAILPATCH 1.10 sizebump
  LanguageBlock.Create(96*1024)
else
  LanguageBlock.Create(690*1024)--RETAILPATCH 1.10 sizebump
  LanguageBlock.Create(96*1024)
end
if Fox.GetPlatformName()=="Windows"then
  if Editor then
    TppUiCommand.SetVarsLanguage(8)
  else
    TppUiCommand.SetPlatformLanguage()
  end
else
  TppUiCommand.SetPlatformLanguage()
end
local languageCode=AssetConfiguration.GetDefaultCategory"Language"
local fontSystemName=""
local defFfnt=""
local fontSystemSlot=""
local ffnt=""
local n=""
local a=""
local i=1
local t=3
local e="/Assets/tpp"
if TppSystemUtility.GetCurrentGameMode()=="MGO"then
  e="/Assets/mgo"
end
local fontPackPath=e.."/pack/ui/lang/lang_default_data_eng.fpk"
if languageCode=="jpn"then
  fontSystemName="FontSystem_KanjiFont"
  defFfnt="/Assets/tpp/font/font_def_jp.ffnt"
  fontSystemSlot="FontSystem_Slot3"
  ffnt="/Assets/tpp/font/KanjiFont.ffnt"
  i=2
  t=3
  fontPackPath=e.."/pack/ui/lang/lang_default_data_jpn.fpk"
elseif languageCode=="eng"then
  fontSystemName="FontSystem_LatinFont"
  defFfnt="/Assets/tpp/font/font_def_ltn.ffnt"
  fontSystemSlot="FontSystem_Slot3"
  ffnt="/Assets/tpp/font/LatinFont.ffnt"
  i=1
  t=3
elseif languageCode=="rus"then
  fontSystemName="FontSystem_LatinFont"
  defFfnt="/Assets/tpp/font/font_def_rus.ffnt"
  fontSystemSlot="FontSystem_Slot3"
  ffnt="/Assets/tpp/font/russian.ffnt"
  n="FontSystem_KanjiFont"
  a="/Assets/tpp/font/font_def_ltn.ffnt"
  i=1
  t=3
  fontPackPath=e.."/pack/ui/lang/lang_default_data_rus.fpk"
elseif languageCode=="ara"then
  fontSystemName="FontSystem_LatinFont"
  defFfnt="/Assets/tpp/font/arabia.ffnt"
  fontSystemSlot="FontSystem_Slot3"
  ffnt="/Assets/tpp/font/arabia.ffnt"
  i=1
  t=3
  fontPackPath=e.."/pack/ui/lang/lang_default_data_ara.fpk"
else
  fontSystemName="FontSystem_LatinFont"
  defFfnt="/Assets/tpp/font/font_def_ltn.ffnt"
  fontSystemSlot="FontSystem_Slot3"
  ffnt="/Assets/tpp/font/LatinFont.ffnt"
  i=1
  t=3
end
GrTools.FontSystemLoad(fontSystemName,defFfnt)
GrTools.FontSystemLoad(fontSystemSlot,ffnt)
UiDaemon.SetFontTypeTransTable(0,i)
UiDaemon.SetFontTypeTransTable(1,t)
if languageCode=="rus"then
  GrTools.FontSystemLoad(n,a)
end
TppUiCommand.ChangeLanguage()
FadeFunction.InitFadeSetting()
UiDaemon.SetExecLuaFile"Tpp/Scripts/Ui/TppUiPrefetchTexture.lua"
local uiDaemonInstance=UiDaemon.GetInstance()
uiDaemonInstance.ResetDefaultButtonMap()
uiDaemonInstance.SetButtonMap("BUTTON_A",fox.PAD_A,fox.KEY_RETURN)
uiDaemonInstance.SetButtonMap("BUTTON_B",fox.PAD_B,fox.KEY_ESCAPE)
uiDaemonInstance.SetButtonMap("BUTTON_X",fox.PAD_X,fox.KEY_G)
uiDaemonInstance.SetButtonMap("BUTTON_Y",fox.PAD_Y,fox.KEY_T)
uiDaemonInstance.SetButtonMap("BUTTON_UP",fox.PAD_U,fox.KEY_W)
uiDaemonInstance.SetButtonMap("BUTTON_DOWN",fox.PAD_D,fox.KEY_S)
uiDaemonInstance.SetButtonMap("BUTTON_LEFT",fox.PAD_L,fox.KEY_A)
uiDaemonInstance.SetButtonMap("BUTTON_RIGHT",fox.PAD_R,fox.KEY_D)
uiDaemonInstance.SetButtonMap("STATUS_UP",fox.PAD_U+4,fox.KEY_UP)
uiDaemonInstance.SetButtonMap("STATUS_DOWN",fox.PAD_D+4,fox.KEY_DOWN)
uiDaemonInstance.SetButtonMap("STATUS_LEFT",fox.PAD_L+4,fox.KEY_LEFT)
uiDaemonInstance.SetButtonMap("STATUS_RIGHT",fox.PAD_R+4,fox.KEY_RIGHT)
uiDaemonInstance.SetButtonMap("BUTTON_LT",fox.PAD_L2,fox.KEY_1)
uiDaemonInstance.SetButtonMap("BUTTON_RT",fox.PAD_R2,fox.KEY_3)
uiDaemonInstance.SetButtonMap("BUTTON_LB",fox.PAD_L1,fox.KEY_1)
uiDaemonInstance.SetButtonMap("BUTTON_RB",fox.PAD_R1,fox.KEY_3)
uiDaemonInstance.SetButtonDecideMap("UI_DECIDE",fox.KEY_SPACE)
uiDaemonInstance.SetButtonCancelMap("UI_CANCEL",fox.KEY_ESCAPE)
uiDaemonInstance.SetButtonDecideMap("DECISION",fox.KEY_SPACE)
uiDaemonInstance.SetButtonCancelMap("CANCEL",fox.KEY_ESCAPE)
uiDaemonInstance.SetButtonDecideMap("UI_MOUSE_DECIDE",fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonCancelMap("UI_MOUSE_CANCEL",fox.MOUSE_CODE_RIGHT)
uiDaemonInstance.SetButtonMap("UI_DETAIL",fox.PAD_Y,fox.KEY_T)
uiDaemonInstance.SetButtonMap("UI_CHECK",fox.PAD_X,fox.KEY_G)
uiDaemonInstance.SetButtonMap("UI_SELECT",fox.PAD_SELECT,fox.KEY_ESCAPE)
uiDaemonInstance.SetButtonMap("UI_START",fox.PAD_START,fox.KEY_TAB)
uiDaemonInstance.SetButtonMap("UI_UP",fox.PAD_U,fox.KEY_W)
uiDaemonInstance.SetButtonMap("UI_DOWN",fox.PAD_D,fox.KEY_S)
uiDaemonInstance.SetButtonMap("UI_LEFT",fox.PAD_L,fox.KEY_A)
uiDaemonInstance.SetButtonMap("UI_RIGHT",fox.PAD_R,fox.KEY_D)
uiDaemonInstance.SetButtonMap("UI_LT",fox.PAD_L2,fox.KEY_Q)
uiDaemonInstance.SetButtonMap("UI_RT",fox.PAD_R2,fox.KEY_E)
uiDaemonInstance.SetButtonMap("UI_LB",fox.PAD_L1,fox.KEY_1)
uiDaemonInstance.SetButtonMap("UI_RB",fox.PAD_R1,fox.KEY_3)
uiDaemonInstance.SetButtonMap("UI_LEFTSTICK_PUSH",fox.PAD_L3,fox.KEY_SHIFT)
uiDaemonInstance.SetButtonMap("UI_RIGHTSTICK_PUSH",fox.PAD_R3,fox.KEY_V)
uiDaemonInstance.SetButtonMap("UI_LB_PAGE_UP",fox.PAD_L1,fox.KEY_PAGEUP)
uiDaemonInstance.SetButtonMap("UI_RB_PAGE_DOWN",fox.PAD_R1,fox.KEY_PAGEDOWN)
uiDaemonInstance.SetButtonMap("UI_KBD_SHIFT",fox.GK_PAD_NO_BUTTON,fox.KEY_SHIFT)
uiDaemonInstance.SetButtonMap("UI_KBD_ALT",fox.GK_PAD_NO_BUTTON,fox.KEY_ALT)
uiDaemonInstance.SetButtonMap("UI_KBD_CTRL",fox.GK_PAD_NO_BUTTON,fox.KEY_CTRL)
uiDaemonInstance.SetButtonMap("UI_KBD_BS",fox.GK_PAD_NO_BUTTON,fox.KEY_BS)
uiDaemonInstance.SetButtonMap("UI_KBD_RETURN",fox.GK_PAD_NO_BUTTON,fox.KEY_RETURN)
uiDaemonInstance.SetButtonMap("UI_KBD_1",fox.GK_PAD_NO_BUTTON,fox.KEY_1)
uiDaemonInstance.SetButtonMap("UI_KBD_2",fox.GK_PAD_NO_BUTTON,fox.KEY_2)
uiDaemonInstance.SetButtonMap("UI_KBD_3",fox.GK_PAD_NO_BUTTON,fox.KEY_3)
uiDaemonInstance.SetButtonMap("UI_KBD_4",fox.GK_PAD_NO_BUTTON,fox.KEY_4)
uiDaemonInstance.SetButtonMap("UI_KBD_5",fox.GK_PAD_NO_BUTTON,fox.KEY_5)
uiDaemonInstance.SetButtonMap("UI_KBD_6",fox.GK_PAD_NO_BUTTON,fox.KEY_6)
uiDaemonInstance.SetButtonMap("UI_KBD_7",fox.GK_PAD_NO_BUTTON,fox.KEY_7)
uiDaemonInstance.SetButtonMap("UI_KBD_8",fox.GK_PAD_NO_BUTTON,fox.KEY_8)
uiDaemonInstance.SetButtonMap("UI_KBD_9",fox.GK_PAD_NO_BUTTON,fox.KEY_9)
uiDaemonInstance.SetButtonMap("UI_KBD_0",fox.GK_PAD_NO_BUTTON,fox.KEY_0)--RETAILPATCH: 1070 added
uiDaemonInstance.SetButtonMap("UI_KBD_X",fox.GK_PAD_NO_BUTTON,fox.KEY_G)
uiDaemonInstance.SetButtonMap("UI_KBD_Y",fox.GK_PAD_NO_BUTTON,fox.KEY_T)
uiDaemonInstance.SetButtonMap("UI_KBD_UP",fox.GK_PAD_NO_BUTTON,fox.KEY_UP)
uiDaemonInstance.SetButtonMap("UI_KBD_DOWN",fox.GK_PAD_NO_BUTTON,fox.KEY_DOWN)
uiDaemonInstance.SetButtonMap("UI_KBD_LEFT",fox.GK_PAD_NO_BUTTON,fox.KEY_LEFT)
uiDaemonInstance.SetButtonMap("UI_KBD_RIGHT",fox.GK_PAD_NO_BUTTON,fox.KEY_RIGHT)
uiDaemonInstance.SetButtonMap("UI_KBD_PAGE_UP",fox.GK_PAD_NO_BUTTON,fox.KEY_PAGEUP)
uiDaemonInstance.SetButtonMap("UI_KBD_PAGE_DOWN",fox.GK_PAD_NO_BUTTON,fox.KEY_PAGEDOWN)
uiDaemonInstance.SetButtonMap("UI_EQUIP_PRIMARY",fox.GK_PAD_NO_BUTTON,fox.KEY_1)
uiDaemonInstance.SetButtonMap("UI_EQUIP_SECONDARY",fox.GK_PAD_NO_BUTTON,fox.KEY_2)
uiDaemonInstance.SetButtonMap("UI_EQUIP_SUPPORT",fox.GK_PAD_NO_BUTTON,fox.KEY_3)
uiDaemonInstance.SetButtonMap("UI_EQUIP_ITEM",fox.GK_PAD_NO_BUTTON,fox.KEY_4)
uiDaemonInstance.SetButtonMap("UI_EQUIP_UP",fox.GK_PAD_NO_BUTTON,fox.KEY_UP)
uiDaemonInstance.SetButtonMap("UI_EQUIP_DOWN",fox.GK_PAD_NO_BUTTON,fox.KEY_DOWN)
uiDaemonInstance.SetButtonMap("UI_EQUIP_LEFT",fox.GK_PAD_NO_BUTTON,fox.KEY_LEFT)
uiDaemonInstance.SetButtonMap("UI_EQUIP_RIGHT",fox.GK_PAD_NO_BUTTON,fox.KEY_RIGHT)
uiDaemonInstance.SetButtonMap("UI_EQUIP_OP_1",fox.PAD_X,fox.KEY_G)
uiDaemonInstance.SetButtonMap("UI_EQUIP_OP_2",fox.PAD_Y,fox.KEY_T)
uiDaemonInstance.SetButtonMap("UI_PAGE_UP",fox.PAD_L,fox.KEY_PAGEUP)
uiDaemonInstance.SetButtonMap("UI_PAGE_DOWN",fox.PAD_R,fox.KEY_PAGEDOWN)
uiDaemonInstance.SetButtonMap("UI_MOVE_UP",fox.PAD_R2,fox.KEY_W)
uiDaemonInstance.SetButtonMap("UI_MOVE_DOWN",fox.PAD_L2,fox.KEY_S)
uiDaemonInstance.SetButtonMap("UI_MOVE_LEFT",fox.GK_PAD_NO_BUTTON,fox.KEY_A)
uiDaemonInstance.SetButtonMap("UI_MOVE_RIGHT",fox.GK_PAD_NO_BUTTON,fox.KEY_D)
uiDaemonInstance.SetButtonMap("UI_STANCE",fox.GK_PAD_NO_BUTTON,fox.KEY_C)
uiDaemonInstance.SetButtonMap("UI_ACTION",fox.GK_PAD_NO_BUTTON,fox.KEY_E)
uiDaemonInstance.SetButtonMap("UI_SUBJECT",fox.GK_PAD_NO_BUTTON,fox.KEY_F)
uiDaemonInstance.SetButtonMap("UI_EVADE",fox.GK_PAD_NO_BUTTON,fox.KEY_SPACE)
uiDaemonInstance.SetButtonMap("UI_RELOAD",fox.GK_PAD_NO_BUTTON,fox.KEY_R)
uiDaemonInstance.SetButtonMap("UI_RADIO",fox.GK_PAD_NO_BUTTON,fox.KEY_Q)
uiDaemonInstance.SetButtonMap("UI_HOLD",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_RIGHT)
uiDaemonInstance.SetButtonMap("UI_SHOT",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_STOCK",fox.PAD_R3,fox.KEY_V)
uiDaemonInstance.SetButtonMap("UI_CQC",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_SIDE_ROLL",fox.GK_PAD_NO_BUTTON,fox.KEY_SHIFT)
uiDaemonInstance.SetButtonMap("UI_LIGHT_SWITCH",fox.PAD_R,fox.KEY_X)
uiDaemonInstance.SetButtonMap("UI_VEHICLE_FIRE",fox.PAD_L1,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_VEHICLE_CALL",fox.GK_PAD_NO_BUTTON,fox.KEY_Q)
uiDaemonInstance.SetButtonMap("UI_VEHICLE_DASH",fox.GK_PAD_NO_BUTTON,fox.KEY_W)
uiDaemonInstance.SetButtonMap("UI_VEHICLE_CAMERA",fox.PAD_R1,fox.KEY_F)
uiDaemonInstance.SetButtonMap("UI_PLACE_MARKER",fox.PAD_L2,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_MAP_MARKER",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_SCORES",fox.GK_PAD_NO_BUTTON,fox.KEY_ESCAPE)
uiDaemonInstance.SetButtonMap("UI_DASH",fox.GK_PAD_NO_BUTTON,fox.KEY_SHIFT)
uiDaemonInstance.SetButtonMap("UI_WALK",fox.GK_PAD_NO_BUTTON,fox.KEY_CTRL)
uiDaemonInstance.SetButtonMap("UI_MB_HELP",fox.PAD_SELECT,fox.KEY_H)
uiDaemonInstance.SetButtonMap("UI_BUDDY_DASH",fox.PAD_X,fox.KEY_SHIFT)
uiDaemonInstance.SetButtonMap("HUD_DECIDE",fox.PAD_R3,fox.KEY_SPACE)
uiDaemonInstance.SetButtonMap("UI_PAD_ALL",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_PAD_DIR)
uiDaemonInstance.SetButtonMap("UI_PAD_KEY_UD",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_KEY_UD)
uiDaemonInstance.SetButtonMap("UI_PAD_KEY_LR",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_KEY_LR)
uiDaemonInstance.SetButtonMap("UI_PAD_STICK_L",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_STICK_L)
uiDaemonInstance.SetButtonMap("UI_PAD_STICK_R",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_STICK_R)
uiDaemonInstance.SetButtonMap("UI_MOUSE_WHEEL",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_MOUSE_WHEEL)
uiDaemonInstance.SetButtonMap("UI_MOUSE_MIDDLE",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_MIDDLE)
uiDaemonInstance.SetButtonMap("UI_EQUIP_STICK",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_MOUSE_WHEEL)
uiDaemonInstance.SetButtonMap("UI_EQUIP_DIR",fox.GK_PAD_NO_BUTTON,fox.EX_CODE_PAD_DIR)
uiDaemonInstance.SetButtonMap("UI_BINO_RADIO",fox.GK_PAD_NO_BUTTON,fox.KEY_Q)
uiDaemonInstance.SetButtonMap("UI_BINO_ZOOM",fox.GK_PAD_NO_BUTTON,fox.KEY_V)
uiDaemonInstance.SetButtonMap("UI_BINO_MARKER",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("UI_BINO_CHANGE",fox.GK_PAD_NO_BUTTON,fox.KEY_T)
uiDaemonInstance.SetButtonMap("UI_BINO_DECIDE",fox.GK_PAD_NO_BUTTON,fox.KEY_RETURN)
uiDaemonInstance.SetButtonMap("CQC_KNIFE_KILL",fox.GK_PAD_NO_BUTTON,fox.KEY_E)
uiDaemonInstance.SetButtonMap("CQC_HOLD",fox.GK_PAD_NO_BUTTON,fox.MOUSE_CODE_LEFT)
uiDaemonInstance.SetButtonMap("CQC_INTERROGATE",fox.GK_PAD_NO_BUTTON,fox.KEY_Q)
uiDaemonInstance.CreateButtonMap()
uiDaemonInstance.SetKeyCodeEqual("UI_UP",fox.KEY_UP)
uiDaemonInstance.SetKeyCodeEqual("UI_DOWN",fox.KEY_DOWN)
uiDaemonInstance.SetKeyCodeEqual("UI_LEFT",fox.KEY_LEFT)
uiDaemonInstance.SetKeyCodeEqual("UI_RIGHT",fox.KEY_RIGHT)
uiDaemonInstance.SetKeyCodeEqual("UI_DECIDE",fox.KEY_RETURN)
uiDaemonInstance.SetKeyCodeEqual("HUD_DECIDE",fox.KEY_RETURN)
uiDaemonInstance.SetKeyCodeEqual("UI_STOCK",fox.MOUSE_CODE_MIDDLE)
uiDaemonInstance.CreateKeyData(128)
UiDaemon.ClearDrawPriorityTable()
UiDaemon.SetDrawPriorityTable{
  interval=100,
  table={
    {name="__BACK_EFFECT",priority=0},
    {name="VERY_BACK",priority=11},
    {name="__HUD",priority=20},
    {name="WORLD_MARKER_CHARA",priority=23},
    {name="BOSS_GAUGE_HEAD",priority=25},
    {name="WORLD_MARKER",priority=27},
    {name="TIME_CIGARETTE_BG",priority=30},
    {name="TIME_CIGARETTE",priority=32},
    {name="NOTICE_DIR",priority=35},
    {name="DAMAGE_DIR",priority=37},
    {name="PRESET_RADIO",priority=40},
    {name="PICK_UP",priority=49},
    {name="ACTION_ICON",priority=50},
    {name="RETICLE_LOW",priority=53},
    {name="RETICLE",priority=55},
    {name="RETICLE_HIGH",priority=57},
    {name="BOSS_GAUGE_2D",priority=60},
    {name="__MB_DEVICE",priority=64},
    {name="MB_BG",priority=65},
    {name="MB_MENU_LOW",priority=66},
    {name="MB_MENU_MIDDLE",priority=68},
    {name="MB_MENU_HIGH",priority=70},
    {name="MB_MAP_BG",priority=71},
    {name="MB_MAP",priority=72},
    {name="MB_MAP_ICON",priority=74},
    {name="MB_MAP_HIGH",priority=82},
    {name="MB_CHILD_PAGE",priority=84},
    {name="MB_CHILD_LOW",priority=85},
    {name="MB_CHILD_MIDDLE",priority=86},
    {name="MB_CHILD_HIGH",priority=88},
    {name="MB_COMMON_HIGH",priority=94},
    {name="DEV_COND_POPUP",priority=98},
    {name="SORTIE_BG_LOW",priority=79},
    {name="SORTIE_BG",priority=80},
    {name="SORTIE_MENU",priority=84},
    {name="SORTIE_DETAIL",priority=90},
    {name="SORTIE_POPUP",priority=98},
    {name="WEP_ICON",priority=95},
    {name="__SIGHT",priority=128},
    {name="SIGHT_BG",priority=128},
    {name="SIGHT_RETICLE",priority=130},
    {name="SIGHT_RETICLE_ADD",priority=131},
    {name="SIGHT_STRONG",priority=132},
    {name="SIGHT_STRONG_HUD",priority=133},
    {name="LMENU",priority=133},
    {name="LOCKON_RETICLE",priority=134},
    {name="LMENU_SELECT",priority=135},
    {name="CALL_MENU",priority=135},
    {name="RADIO_GUIDE",priority=136},
    {name="WEAPON_PANEL",priority=146},
    {name="ITEM_PANEL",priority=152},
    {name="UNDER_SUBTITLE_BG",priority=150},
    {name="__SUBTITLE",priority=150},
    {name="SUBTITLE",priority=151},
    {name="__TEXT",priority=160},
    {name="PIC_INFO",priority=161},
    {name="MISSION_ICON",priority=161},
    {name="RESOURCE_PANEL",priority=161},
    {name="GMP_INFO",priority=162},
    {name="ANNOUNCE_LOG",priority=163},
    {name="TELOP_TEXT",priority=165},
    {name="__TELOP_PAUSE",priority=170},
    {name="TELOP_BG",priority=171},
    {name="PAUSE_BG",priority=171},
    {name="PAUSE_MENU",priority=173},
    {name="PAUSE_MENU_ADD",priority=175},
    {name="TITLE_BG_LOW",priority=79},
    {name="TITLE_BG",priority=80},
    {name="TITLE_NORMAL_BG",priority=166},
    {name="TITLE_LOGO",priority=167},
    {name="TITLE_MENU",priority=168},
    {name="__POPUP",priority=180},
    {name="POPUP_BG",priority=181},
    {name="POPUP_MENU",priority=183},
    {name="__GAME_FADE",priority=190},
    {name="GAME_FADE",priority=191},
    {name="GAME_FADE_UP",priority=192},
    {name="__STRONG_TEXT",priority=195},
    {name="STRONG_ANNOUNCE_LOG",priority=196},
    {name="__STRONG_TELOP_PAUSE",priority=200},
    {name="STRONG_TELOP_BG",priority=201},
    {name="STRONG_TELOP_PAGE",priority=202},
    {name="STRONG_TELOP_TEXT",priority=203},
    {name="STRONG_PAUSE_BG",priority=205},
    {name="STRONG_PAUSE_MENU",priority=207},
    {name="STRONG_PAUSE_ICON",priority=209},
    {name="LYRIC_TELOP",priority=209},
    {name="__STRONG_SUBTITLE",priority=210},
    {name="__FRONT_EFFECT",priority=245},
    {name="__ERROR_MESSAGE",priority=251},
    {name="ERROR_MESSAGE",priority=251},
    {name="SYSTEM_MESSAGE",priority=251},
    {name="SYSTEM_ICON",priority=252},
    {name="PREFAB_COMMON",priority=86},
    {name="PREFAB_POPUP",priority=92}
  }
}
TppUiCommand.InitPrefabSystem()
TppUiCommand.RegistMissionEpisodeNo(10020,1)
TppUiCommand.RegistMissionEpisodeNo(10030,2)
TppUiCommand.RegistMissionEpisodeNo(10036,3)
TppUiCommand.RegistMissionEpisodeNo(10043,4)
TppUiCommand.RegistMissionEpisodeNo(10033,5)
TppUiCommand.RegistMissionEpisodeNo(10040,6)
TppUiCommand.RegistMissionEpisodeNo(10041,7)
TppUiCommand.RegistMissionEpisodeNo(10044,8)
TppUiCommand.RegistMissionEpisodeNo(10054,9)
TppUiCommand.RegistMissionEpisodeNo(10052,10)
TppUiCommand.RegistMissionEpisodeNo(10050,11)
TppUiCommand.RegistMissionEpisodeNo(10070,12)
TppUiCommand.RegistMissionEpisodeNo(10080,13)
TppUiCommand.RegistMissionEpisodeNo(10086,14)
TppUiCommand.RegistMissionEpisodeNo(10082,15)
TppUiCommand.RegistMissionEpisodeNo(10090,16)
TppUiCommand.RegistMissionEpisodeNo(10091,17)
TppUiCommand.RegistMissionEpisodeNo(10100,18)
TppUiCommand.RegistMissionEpisodeNo(10195,19)
TppUiCommand.RegistMissionEpisodeNo(10110,20)
TppUiCommand.RegistMissionEpisodeNo(10121,21)
TppUiCommand.RegistMissionEpisodeNo(10115,22)
TppUiCommand.RegistMissionEpisodeNo(10120,23)
TppUiCommand.RegistMissionEpisodeNo(10085,24)
TppUiCommand.RegistMissionEpisodeNo(10200,25)
TppUiCommand.RegistMissionEpisodeNo(10211,26)
TppUiCommand.RegistMissionEpisodeNo(10081,27)
TppUiCommand.RegistMissionEpisodeNo(10130,28)
TppUiCommand.RegistMissionEpisodeNo(10140,29)
TppUiCommand.RegistMissionEpisodeNo(10150,30)
TppUiCommand.RegistMissionEpisodeNo(10151,31)
TppUiCommand.RegistMissionEpisodeNo(10045,32)
TppUiCommand.RegistMissionEpisodeNo(11043,33)
TppUiCommand.RegistMissionEpisodeNo(11054,34)
TppUiCommand.RegistMissionEpisodeNo(10093,35)
TppUiCommand.RegistMissionEpisodeNo(11082,36)
TppUiCommand.RegistMissionEpisodeNo(11090,37)
TppUiCommand.RegistMissionEpisodeNo(10156,38)
TppUiCommand.RegistMissionEpisodeNo(11033,39)
TppUiCommand.RegistMissionEpisodeNo(11050,40)
TppUiCommand.RegistMissionEpisodeNo(10171,41)
TppUiCommand.RegistMissionEpisodeNo(11140,42)
TppUiCommand.RegistMissionEpisodeNo(10240,43)
TppUiCommand.RegistMissionEpisodeNo(11080,44)
TppUiCommand.RegistMissionEpisodeNo(10260,45)
TppUiCommand.RegistMissionEpisodeNo(10280,46)
TppUiCommand.RegistMissionEpisodeNo(11121,47)
TppUiCommand.RegistMissionEpisodeNo(11130,48)
TppUiCommand.RegistMissionEpisodeNo(11044,49)
TppUiCommand.RegistMissionEpisodeNo(11151,50)
if TppSystemUtility.GetCurrentGameMode()=="MGO"then
  TppUiCommand.RegistTipsTitle("tips_002","mgo_tips_name_002_00")
  TppUiCommand.RegistTipsDoc("tips_002","mgo_tips_info_002_00")
  TppUiCommand.RegistTipsTitle("tips_003","mgo_tips_name_003_00")
  TppUiCommand.RegistTipsDoc("tips_003","mgo_tips_info_003_00")
  TppUiCommand.RegistTipsTitle("tips_005","mgo_tips_name_005_00")
  TppUiCommand.RegistTipsDoc("tips_005","mgo_tips_info_005_00")
  TppUiCommand.RegistTipsTitle("tips_006","mgo_tips_name_006_00")
  TppUiCommand.RegistTipsDoc("tips_006","mgo_tips_info_006_00")
  TppUiCommand.RegistTipsTitle("tips_007","mgo_tips_name_007_00")
  TppUiCommand.RegistTipsDoc("tips_007","mgo_tips_info_007_00")
  TppUiCommand.RegistTipsTitle("tips_008","mgo_tips_name_008_00")
  TppUiCommand.RegistTipsDoc("tips_008","mgo_tips_info_008_00")
  TppUiCommand.RegistTipsTitle("tips_009","mgo_tips_name_009_00")
  TppUiCommand.RegistTipsDoc("tips_009","mgo_tips_info_009_00")
  TppUiCommand.RegistTipsTitle("tips_010","mgo_tips_name_010_00")
  TppUiCommand.RegistTipsDoc("tips_010","mgo_tips_info_010_00")
  TppUiCommand.RegistTipsTitle("tips_011","mgo_tips_name_011_00")
  TppUiCommand.RegistTipsDoc("tips_011","mgo_tips_info_011_00")
  TppUiCommand.RegistTipsTitle("tips_013","mgo_tips_name_013_00")
  TppUiCommand.RegistTipsDoc("tips_013","mgo_tips_info_013_00")
  TppUiCommand.RegistTipsTitle("tips_014","mgo_tips_name_014_00")
  TppUiCommand.RegistTipsDoc("tips_014","mgo_tips_info_014_00")
  TppUiCommand.RegistTipsTitle("tips_015","mgo_tips_name_015_00")
  TppUiCommand.RegistTipsDoc("tips_015","mgo_tips_info_015_00")
  TppUiCommand.RegistTipsTitle("tips_016","mgo_tips_name_016_00")
  TppUiCommand.RegistTipsDoc("tips_016","mgo_tips_info_016_00")
  TppUiCommand.RegistTipsTitle("tips_018","mgo_tips_name_018_00")
  TppUiCommand.RegistTipsDoc("tips_018","mgo_tips_info_018_00")
  TppUiCommand.RegistTipsTitle("tips_019","mgo_tips_name_019_00")
  TppUiCommand.RegistTipsDoc("tips_019","mgo_tips_info_019_00")
  TppUiCommand.RegistTipsTitle("tips_021","mgo_tips_name_021_00")
  TppUiCommand.RegistTipsDoc("tips_021","mgo_tips_info_021_00")
  TppUiCommand.RegistTipsTitle("tips_022","mgo_tips_name_022_00")
  TppUiCommand.RegistTipsDoc("tips_022","mgo_tips_info_022_00")
  TppUiCommand.RegistTipsTitle("tips_023","mgo_tips_name_023_00")
  TppUiCommand.RegistTipsDoc("tips_023","mgo_tips_info_023_00")
  TppUiCommand.RegistTipsTitle("tips_024","mgo_tips_name_024_00")
  TppUiCommand.RegistTipsDoc("tips_024","mgo_tips_info_024_00")
  TppUiCommand.RegistTipsTitle("tips_025","mgo_tips_name_025_00")
  TppUiCommand.RegistTipsDoc("tips_025","mgo_tips_info_025_00")
  TppUiCommand.RegistTipsTitle("tips_026","mgo_tips_name_026_00")
  TppUiCommand.RegistTipsDoc("tips_026","mgo_tips_info_026_00")
  TppUiCommand.RegistTipsTitle("tips_027","mgo_tips_name_027_00")
  TppUiCommand.RegistTipsDoc("tips_027","mgo_tips_info_027_00")
  TppUiCommand.RegistTipsTitle("tips_029","mgo_tips_name_029_00")
  TppUiCommand.RegistTipsDoc("tips_029","mgo_tips_info_029_00")
  TppUiCommand.RegistTipsTitle("tips_031","mgo_tips_name_031_00")
  TppUiCommand.RegistTipsDoc("tips_031","mgo_tips_info_031_00")
  TppUiCommand.RegistTipsTitle("tips_032","mgo_tips_name_032_00")
  TppUiCommand.RegistTipsDoc("tips_032","mgo_tips_info_032_00")
  TppUiCommand.RegistTipsTitle("tips_033","mgo_tips_name_033_00")
  TppUiCommand.RegistTipsDoc("tips_033","mgo_tips_info_033_00")
  TppUiCommand.RegistTipsTitle("tips_035","mgo_tips_name_035_00")
  TppUiCommand.RegistTipsDoc("tips_035","mgo_tips_info_035_00")
  TppUiCommand.RegistTipsTitle("tips_037","mgo_tips_name_037_00")
  TppUiCommand.RegistTipsDoc("tips_037","mgo_tips_info_037_00")
  TppUiCommand.RegistTipsTitle("tips_038","mgo_tips_name_038_00")
  TppUiCommand.RegistTipsDoc("tips_038","mgo_tips_info_038_00")
  TppUiCommand.RegistTipsTitle("tips_039","mgo_tips_name_039_00")
  TppUiCommand.RegistTipsDoc("tips_039","mgo_tips_info_039_00")
  TppUiCommand.RegistTipsTitle("tips_040","mgo_tips_name_040_00")
  TppUiCommand.RegistTipsDoc("tips_040","mgo_tips_info_040_00")
  TppUiCommand.RegistTipsTitle("tips_041","mgo_tips_name_041_00")
  TppUiCommand.RegistTipsDoc("tips_041","mgo_tips_info_041_00")
  TppUiCommand.RegistTipsTitle("tips_042","mgo_tips_name_042_00")
  TppUiCommand.RegistTipsDoc("tips_042","mgo_tips_info_042_00")
  TppUiCommand.RegistTipsTitle("tips_043","mgo_tips_name_043_00")
  TppUiCommand.RegistTipsDoc("tips_043","mgo_tips_info_043_00")
  TppUiCommand.RegistTipsTitle("tips_045","mgo_tips_name_045_00")
  TppUiCommand.RegistTipsDoc("tips_045","mgo_tips_info_045_00")
  TppUiCommand.RegistTipsTitle("tips_046","mgo_tips_name_046_00")
  TppUiCommand.RegistTipsDoc("tips_046","mgo_tips_info_046_00")
  TppUiCommand.RegistTipsTitle("tips_047","mgo_tips_name_047_00")
  TppUiCommand.RegistTipsDoc("tips_047","mgo_tips_info_047_00")
  TppUiCommand.RegistTipsTitle("tips_048","mgo_tips_name_048_00")
  TppUiCommand.RegistTipsDoc("tips_048","mgo_tips_info_048_00")
  TppUiCommand.RegistTipsTitle("tips_049","mgo_tips_name_049_00")
  TppUiCommand.RegistTipsDoc("tips_049","mgo_tips_info_049_00")
  TppUiCommand.RegistTipsTitle("tips_050","mgo_tips_name_050_00")
  TppUiCommand.RegistTipsDoc("tips_050","mgo_tips_info_050_00")
  TppUiCommand.RegistTipsTitle("tips_051","mgo_tips_name_051_00")
  TppUiCommand.RegistTipsDoc("tips_051","mgo_tips_info_051_00")
  TppUiCommand.RegistTipsTitle("tips_053","mgo_tips_name_053_00")
  TppUiCommand.RegistTipsDoc("tips_053","mgo_tips_info_053_00")
  TppUiCommand.RegistTipsTitle("tips_054","mgo_tips_name_054_00")
  TppUiCommand.RegistTipsDoc("tips_054","mgo_tips_info_054_00")
  TppUiCommand.RegistTipsTitle("tips_055","mgo_tips_name_055_00")
  TppUiCommand.RegistTipsDoc("tips_055","mgo_tips_info_055_00")
  TppUiCommand.RegistTipsTitle("tips_056","mgo_tips_name_056_00")
  TppUiCommand.RegistTipsDoc("tips_056","mgo_tips_info_056_00")
  TppUiCommand.RegistTipsTitle("tips_057","mgo_tips_name_057_00")
  TppUiCommand.RegistTipsDoc("tips_057","mgo_tips_info_057_00")
  TppUiCommand.RegistTipsTitle("tips_058","mgo_tips_name_058_00")
  TppUiCommand.RegistTipsDoc("tips_058","mgo_tips_info_058_00")
  TppUiCommand.RegistTipsTitle("tips_059","mgo_tips_name_059_00")
  TppUiCommand.RegistTipsDoc("tips_059","mgo_tips_info_059_00")
  TppUiCommand.RegistTipsTitle("tips_061","mgo_tips_name_061_00")
  TppUiCommand.RegistTipsDoc("tips_061","mgo_tips_info_061_00")
  TppUiCommand.RegistTipsTitle("tips_064","mgo_tips_name_064_00")
  TppUiCommand.RegistTipsDoc("tips_064","mgo_tips_info_064_00")
  TppUiCommand.RegistTipsTitle("tips_065","mgo_tips_name_065_00")
  TppUiCommand.RegistTipsDoc("tips_065","mgo_tips_info_065_00")
  TppUiCommand.RegistTipsTitle("tips_066","mgo_tips_name_066_00")
  TppUiCommand.RegistTipsDoc("tips_066","mgo_tips_info_066_00")
  TppUiCommand.RegistTipsTitle("tips_067","mgo_tips_name_067_00")
  TppUiCommand.RegistTipsDoc("tips_067","mgo_tips_info_067_00")
  TppUiCommand.RegistTipsTitle("tips_069","mgo_tips_name_069_00")
  TppUiCommand.RegistTipsDoc("tips_069","mgo_tips_info_069_00")
  TppUiCommand.RegistTipsTitle("tips_070","mgo_tips_name_070_00")
  TppUiCommand.RegistTipsDoc("tips_070","mgo_tips_info_070_00")
  TppUiCommand.RegistTipsTitle("tips_071","mgo_tips_name_071_00")
  TppUiCommand.RegistTipsDoc("tips_071","mgo_tips_info_071_00")
  TppUiCommand.RegistTipsTitle("tips_072","mgo_tips_name_072_00")
  TppUiCommand.RegistTipsDoc("tips_072","mgo_tips_info_072_00")
  TppUiCommand.RegistTipsTitle("tips_073","mgo_tips_name_073_00")
  TppUiCommand.RegistTipsDoc("tips_073","mgo_tips_info_073_00")
  TppUiCommand.RegistTipsTitle("tips_074","mgo_tips_name_074_00")
  TppUiCommand.RegistTipsDoc("tips_074","mgo_tips_info_074_00")
  TppUiCommand.RegistTipsTitle("tips_075","mgo_tips_name_075_00")
  TppUiCommand.RegistTipsDoc("tips_075","mgo_tips_info_075_00")
  TppUiCommand.RegistTipsTitle("tips_077","mgo_tips_name_077_00")
  TppUiCommand.RegistTipsDoc("tips_077","mgo_tips_info_077_00")
  TppUiCommand.RegistTipsTitle("tips_078","mgo_tips_name_078_00")
  TppUiCommand.RegistTipsDoc("tips_078","mgo_tips_info_078_00")
  TppUiCommand.RegistTipsTitle("tips_079","mgo_tips_name_079_00")
  TppUiCommand.RegistTipsDoc("tips_079","mgo_tips_info_079_00")
  TppUiCommand.RegistTipsTitle("tips_080","mgo_tips_name_080_00")
  TppUiCommand.RegistTipsDoc("tips_080","mgo_tips_info_080_00")
  TppUiCommand.RegistTipsTitle("tips_081","mgo_tips_name_081_00")
  TppUiCommand.RegistTipsDoc("tips_081","mgo_tips_info_081_00")
  TppUiCommand.RegistTipsTitle("tips_083","mgo_tips_name_083_00")
  TppUiCommand.RegistTipsDoc("tips_083","mgo_tips_info_083_00")
  TppUiCommand.RegistTipsTitle("tips_085","mgo_tips_name_085_00")
  TppUiCommand.RegistTipsDoc("tips_085","mgo_tips_info_085_00")
  TppUiCommand.RegistTipsTitle("tips_086","mgo_tips_name_086_00")
  TppUiCommand.RegistTipsDoc("tips_086","mgo_tips_info_086_00")
  TppUiCommand.RegistTipsTitle("tips_087","mgo_tips_name_087_00")
  TppUiCommand.RegistTipsDoc("tips_087","mgo_tips_info_087_00")
  TppUiCommand.RegistTipsTitle("tips_088","mgo_tips_name_088_00")
  TppUiCommand.RegistTipsDoc("tips_088","mgo_tips_info_088_00")
  TppUiCommand.RegistTipsTitle("tips_089","mgo_tips_name_089_00")
  TppUiCommand.RegistTipsDoc("tips_089","mgo_tips_info_089_00")
  TppUiCommand.RegistTipsTitle("tips_090","mgo_tips_name_090_00")
  TppUiCommand.RegistTipsDoc("tips_090","mgo_tips_info_090_00")
  TppUiCommand.RegistTipsTitle("tips_091","mgo_tips_name_091_00")
  TppUiCommand.RegistTipsDoc("tips_091","mgo_tips_info_091_00")
  TppUiCommand.RegistTipsTitle("tips_092","mgo_tips_name_092_00")
  TppUiCommand.RegistTipsDoc("tips_092","mgo_tips_info_092_00")
  TppUiCommand.RegistTipsTitle("tips_093","mgo_tips_name_093_00")
  TppUiCommand.RegistTipsDoc("tips_093","mgo_tips_info_093_00")
  TppUiCommand.RegistTipsTitle("tips_094","mgo_tips_name_094_00")
  TppUiCommand.RegistTipsDoc("tips_094","mgo_tips_info_094_00")
end
TppUiCommand.InitEmblemSaveData()
TppUiCommand.CallAccessMessage()
