local this = {}

------------------------------------------------------------------------
-- GZWeapon
--		ミッションごとの武器、弾数定義スクリプト
------------------------------------------------------------------------

-------------------------------------------------
-- パス救出
-------------------------------------------------
this.e20010_SetWeapons = {
	"WP_ar00_v03",
	"WP_hg01_v00",
	{ "WP_Grenade", 4 },
	{ "WP_WarningFlare", 4 },
	"WP_Magazine",
}

this.e20010_SetWeaponsHard = {
--	"WP_ar00_v03",
	{ "WP_hg01_v00", 21 },
	{ "WP_WarningFlare", 4 },
	"WP_Magazine",
}

-------------------------------------------------
-- 要人排除
-------------------------------------------------
this.e20020_SetWeapons = {
	"WP_ar00_v03",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg01_v00",		-- 麻酔ハンドガン。サプレッサー付き。
	"WP_Magazine",
	{ "WP_SmokeGrenade", 4 },	-- スモークグレネード
	{ "WP_Grenade", 4 },		-- グレネード
	{ "WP_WarningFlare", 4 },	--
}

this.e20020_SetWeaponsHard = {
--	"WP_ar00_v03",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	{ "WP_hg01_v00", 21 },
	"WP_Magazine",
	{ "WP_SmokeGrenade", 4 },	-- スモークグレネード
	{ "WP_WarningFlare", 4 },	--
}

-- デバッグ用	
this.e20020_SetWeaponsDebugSetSniperRifle = {
	"WP_sr01_v00",		-- スナイパーライフル
	"WP_hg01_v00",		-- 麻酔ハンドガン。サプレッサー付き。
	"WP_Magazine",
	{ "WP_SmokeGrenade", 4 },	-- スモークグレネード
	{ "WP_Grenade", 4 },		-- グレネード
	{ "WP_WarningFlare", 4 },	--
}

-------------------------------------------------
-- 内通者接触
-------------------------------------------------
this.e20030_SetWeapons = {
	"WP_ar00_v03",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg01_v00",		-- 麻酔ハンドガン。サプレッサー付き。
	"WP_Magazine",
	{ "WP_Grenade", 4 },			-- グレネード
	{ "WP_WarningFlare", 4 },		-- フレアグレネード
}

this.e20030_SetWeaponsHard = {
--	"WP_ar00_v03",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	{ "WP_hg01_v00", 21 },
	"WP_Magazine",
	{ "WP_WarningFlare", 4 },		-- フレアグレネード
}

-------------------------------------------------
-- 諜報員接触(ヘリ急襲)
-------------------------------------------------
this.e20040_SetWeapons = {
	"WP_ar00_v05",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg02_v00",		-- リボルバーショットガン
	{ "WP_SmokeGrenade", 4 },	-- smokeグレネード
	{ "WP_Grenade", 4 },
}

-- ランクSクリア報酬時の武器セット
this.e20040_SetWeapons_S = {
	"WP_ar00_v05",		-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg02_v00",		-- リボルバーショットガン
	"WP_sr01_v00",		-- スナイパーライフル
	{ "WP_SmokeGrenade", 4 },	-- smokeグレネード
	{ "WP_Grenade", 4 },
}

-------------------------------------------------
-- 破壊工作
-------------------------------------------------
this.e20050_SetWeapons = {
	"WP_ar00_v03",				-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg01_v00",				-- 麻酔ハンドガン。サプレッサー付き。
	"WP_Magazine",
	{ "WP_C4", 5 },				-- C4
	{ "WP_Grenade", 4 },		-- グレネード
	{ "WP_WarningFlare", 4 },		-- 発炎筒
}

this.e20050_SetWeaponsHard = {
--	"WP_ar00_v03",				-- 5.56mm口径米国製カービン。サプレッサー付き。
	{ "WP_hg01_v00", 21 },
	"WP_Magazine",
	{ "WP_C4", 5 },				-- C4
	{ "WP_WarningFlare", 4 },		-- 発炎筒
}

-------------------------------------------------
-- MGS1オマージュ
-------------------------------------------------
this.e20060_SetWeapons = {}

-------------------------------------------------
-- MSミッション
-------------------------------------------------
this.e20070_SetWeapons = {
	"WP_ar00_v03",				-- 5.56mm口径米国製カービン。サプレッサー付き。
	"WP_hg01_v00",				-- 麻酔ハンドガン。サプレッサー付き。
	"WP_Magazine",
	{ "WP_Grenade", 4 },		-- グレネード
}

---------------------------------------------------------------------------------
-- END
---------------------------------------------------------------------------------
return this