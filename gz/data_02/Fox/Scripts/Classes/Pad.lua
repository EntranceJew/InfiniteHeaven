Pad = {


ConfigDefaultAssigns = function() 

	
	Pad.RegisterButtonAssign	( "DEBUG_SELECT",		fox.PAD_SELECT )
	Pad.RegisterButtonAssign	( "DEBUG_L3",			fox.PAD_L3 )
	Pad.RegisterButtonAssign	( "DEBUG_R3",			fox.PAD_R3 )

	
	Pad.RegisterButtonAssign	( "OK",					fox.PAD_A )
	Pad.RegisterButtonAssign	( "CANCEL",				fox.PAD_B )
	
	Pad.RegisterAxisAssign		( "LSTICK_X",			fox.PAD_AXIS_LX, false )
	Pad.RegisterAxisAssign		( "LSTICK_Y",			fox.PAD_AXIS_LY, false )
	Pad.RegisterAxisAssign		( "RSTICK_X",			fox.PAD_AXIS_RX, false )
	Pad.RegisterAxisAssign		( "RSTICK_Y",			fox.PAD_AXIS_RY, false )
	
	Pad.RegisterButtonAssign	( "PL_ACTION",			fox.PAD_Y )
	Pad.RegisterButtonAssign	( "PL_SQUAT",			fox.PAD_A )
	Pad.RegisterButtonAssign	( "PL_HOLD",			fox.PAD_L1 )
	Pad.RegisterButtonAssign	( "PL_SHOT",			fox.PAD_R1 )
	Pad.RegisterButtonAssign	( "PL_SUB_SHOT",		fox.PAD_R2 )
	Pad.RegisterButtonAssign	( "PL_RELOAD",			fox.PAD_B )
	Pad.RegisterButtonAssign	( "PL_KNOCK",			fox.PAD_R1 )
	Pad.RegisterButtonAssign	( "PL_CQC",				fox.PAD_R1 )
	Pad.RegisterButtonAssign	( "PL_STOCK",			fox.PAD_R3 )
	Pad.RegisterButtonAssign	( "PL_SUB_CAMERA",		fox.PAD_L3 )
	Pad.RegisterButtonAssign	( "PL_SHOT_CHANGE",		fox.PAD_X )

	Pad.RegisterButtonAssign	( "PL_FIRE_TRIGGER",	fox.PAD_X )
	Pad.RegisterButtonAssign	( "PL_THROW_GRENADE",	fox.PAD_L1 )

	
	Pad.RegisterButtonAssign	( "PL_PICKUP_WEAPON",	fox.PAD_U )
	Pad.RegisterButtonAssign	( "PL_DROP_WEAPON",		fox.PAD_D )
	Pad.RegisterButtonAssign	( "PL_PREV_WEAPON",		fox.PAD_L )
	Pad.RegisterButtonAssign	( "PL_NEXT_WEAPON",		fox.PAD_R )
	Pad.RegisterButtonAssign	( "PL_TOGGLE_WEAPON",	fox.PAD_L3 )
	Pad.RegisterButtonAssign	( "PL_TOGGLE_FLASHLIGHT", fox.PAD_R3 )
	Pad.RegisterButtonAssign	( "PL_RELOAD_WEAPON",	fox.PAD_Y )
	
	
end,



}
