--tex My suggested fulton settings
profiles.fultonHeaven={
  description="Fulton Heaven",
  profile={
    --Fulton levels menu
    --itemLevelFulton=1,--{ 1-4 } -- Fulton Level
    --itemLevelWormhole="DISABLE",--{ DISABLE, ENABLE } -- Wormhole Level
    --Fulton success menu
    fultonNoMbSupport=1,--{ 0-1 } -- Disable MB fulton support
    fultonNoMbMedical=1,--{ 0-1 } -- Disable MB fulton medical
    fultonDyingPenalty=40,--{ 0-100 } -- Target dying penalty
    fultonSleepPenalty=20,--{ 0-100 } -- Target sleeping penalty
    fultonHoldupPenalty=0,--{ 0-100 } -- Target holdup penalty
    fultonDontApplyMbMedicalToSleep=1,--{ 0-1 } -- Dont apply MB medical bonus to sleeping/fainted target
    fultonHostageHandling="ZERO",--{ DEFAULT, ZERO } -- Hostage handling
  }
}