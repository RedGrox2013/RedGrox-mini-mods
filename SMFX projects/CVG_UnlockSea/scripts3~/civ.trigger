state CVG_SendVehicleToCommodity
	letterbox -on
	startsound sfx_cin_civ_spice -escstop
	mixevent civ_cin_start 1
	startCamera -offset 60  -pitch -.05 -target "PlayerVehicle" -noWait -duration 1.5 -sphere
	pauseGame
	wait -secs 2
	preserveCinematicCamView
	nextstate CVG_SendVehicleToCommodity_2
end
state CVG_SendVehicleToCommodity_2
	letterbox -on
	pauseGame
	sendMessage -id 0x056cfe69  # kCinematicMessageSendVehicleToCommodityPart2
   alphaObstacles on -camera -actors "SpiceCommodityNode" -radius 80.0 -types all
	startCamera -offset 100 -pitch -.05 -target "SpiceCommodityNode" -ballistic -noWait -duration 3
	wait -secs 5
	nextState CVG_SendVehicleToCommodity_3
end

state CVG_SendVehicleToCommodity_3
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_SendVehicleToCommodity_4
end

state CVG_SendVehicleToCommodity_4
	nextState CVG_SendVehicleToCommodity_5
	text "CVG_SendVehicleToCommodity_2" cinematics_cvg!0x00000213
	wait -secs 1
end

state CVG_SendVehicleToCommodity_5
  wait -forButton
  nextState CVG_SendVehicleToCommodity_6
end

state CVG_SendVehicleToCommodity_6
	unpauseGame
	letterbox -off
	text -hide
	wait -secs 1
	startCamera -backToStart -snap
end   

#-------------------------
 
state CVG_Test
	startCamera -offset 120 -pitch -.1 -target "CityHallForFirstHarvesterReturn" -noWait -follow -orient -heading 0.5 -sphere -snap
	#startEffect "debug" cpTest  -target "CityHallForFirstHarvesterReturn" -offset (0, 0, 0) 
	text "CVG_HArvesterReturns" cinematics_cvg!0x00000100
	pauseGame
	wait -forButton
end


state CVG_FirstSpiceNodeCaptured
    pauseGame
    nextstate CVG_FirstSpiceNodeCaptured_2
	startEffect "fadeOutA" fade_to_black_quick -noWait
	wait -secs 1   
end
state CVG_FirstSpiceNodeCaptured_2
    enableEscExit
    #  startsound  PUT A SOUND HERE
    letterbox -on
    alphaObstacles on -camera -actors "SpiceNode" -radius 80.0 -types all
	startEffect "fadeInA" fade_from_black_quick -noWait  
	startCamera -offset 20 -pitch -.1 -target "SpiceNode" -snap -noWait -orient -heading 0
	nextState CVG_FirstSpiceNodeCaptured_3
end

state CVG_FirstSpiceNodeCaptured_3
	startCamera -offset 80 -pitch -.1 -target "SpiceNode" -duration 5 -noWait -orient -heading 0
    wait -secs 5
	nextState CVG_FirstSpiceNodeCaptured_4
end

state CVG_FirstSpiceNodeCaptured_4
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_FirstSpiceNodeCaptured_5
end
state CVG_FirstSpiceNodeCaptured_5
	nextState CVG_FirstSpiceNodeCaptured_6
	text "CVG_FirstSpiceNodeCaptured" cinematics_cvg!0x00000403
	wait -secs 1
end
state CVG_FirstSpiceNodeCaptured_6 
    wait -forButton
end

#-------------------------

state CVG_PRE_NewCityAppears
   pausegame
   setExitState CVG_NewCityAppears_esc
	nextstate CVG_NewCityAppears
	startEffect "fadeOutA" fade_to_black_quick -noWait
	wait -secs 1   
end

state CVG_NewCityAppears 
   setExitState null
   sendMessage -id 0x05668f43  # kCinematicMessageNewCityAppears  
	startsound sfx_cin_civ_npc_appear -escStop
	letterbox -on
	startEffect "fadeInA" fade_from_black_quick -noWait  
	startCamera -offset 80 -pitch -.1 -target "NewCityLocation" -snap -noWait -orient -heading 0
   wait -forContinue
	nextState CVG_NewCityAppearsB
end

state CVG_NewCityAppearsB
	startCamera -offset 200 -pitch -.1 -target "actualNewCityLocation" -duration 10 -noWait -orient -heading .5
	pauseGame
	wait -secs 10
	nextState CVG_NewCityAppears2
end

state CVG_NewCityAppears2
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_NewCityAppears3
end

state CVG_NewCityAppears3
	nextState CVG_NewCityAppears4
	text "CVG_NewCityAppears" cinematics_cvg!0x00000400
	wait -secs 1
end

state CVG_NewCityAppears4
  wait -forButton
end

state CVG_NewCityAppears_esc
   sendMessage -id 0x05668f43  # kCinematicMessageNewCityAppears  
end

####PlayerCityAttacked####

state CVG_PlayerCityAttacked
   pauseGame
   startEffect "fadeOutA" fade_to_black_quick -noWait
	nextState CVG_PlayerCityAttackedA0
   wait -secs 1
end

state CVG_PlayerCityAttackedA0
   startEffect "fadeInA" fade_from_black_quick -noWait  
	startsound ui_tutorial_start
	letterbox -on
	startCamera -offset 150 -target "AttackedCityHall" -snap -noWait -orient -heading 0.5 -pitch -.1 
	nextState CVG_PlayerCityAttackedA1
   wait -secs .5
end

state CVG_PlayerCityAttackedA1
	startsound ui_tutorial_start
	letterbox -on
	startCamera -offset 350  -target "AttackedCityHall" -duration 2 -noWait -orient -heading 0.5 -pitch -.1 
	wait -secs 1.5
	nextState CVG_PlayerCityAttackedB
end

state CVG_PlayerCityAttackedB
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_PlayerCityAttackedC
end

state CVG_PlayerCityAttackedC
	text "CVG_PlayerCityAttacked" cinematics_cvg!0x00000710
	wait -secs 1
	nextState CVG_PlayerCityAttackedD
end

state CVG_PlayerCityAttackedD
	wait -forButton
end


#----------------------------------

#############################################################
#### UpgradeMoments ####
#############################################################

state CVG_UnlockAir
   pauseGame
   startEffect "fadeOutA" fade_to_black_quick -noWait
   nextState CVG_UnlockSea1
   wait -secs 1
   mixevent civ_sfx_duck 1
   setExitState CVG_unlock_end
end

state CVG_UnlockSea1
	startsound sfx_civ_upgrade_water -escStop
	letterbox -on
        startEffect "fadeInA" fade_from_black_quick -noWait
	startsound ui_tutorial_start
	mixevent civ_cin_start 1
	startCamera -offset 15 -targetOffset (8, 0, 0) -pitch -.1 -target "CityPlaza" -snap -noWait -orient -heading 0.5 -sphere
	nextState CVG_UnlockSea1_startvig
end

state CVG_UnlockSea1_startvig
    # Note: we must start this vignette in a different state than the camera switch above, because it the camera can cause a city visualization change
   startVignette "" "Vignettes_Civ!upgrade_water.prop" (0, 0, 0) -relative object "CityPlaza" -face object "CityPlaza" (0, -2, 0) -noWait
	nextState CVG_UnlockSeaA
end

state CVG_UnlockSeaA
   startCamera -offset 18 -targetOffset (6, 0, 0) -pitch -.1 -target "CityPlaza" -duration 5 -noWait -orient -heading 0.5 -sphere
	nextState CVG_UnlockSeaB
   wait -secs 5
end

state CVG_UnlockSeaB
   startCamera -offset 24 -targetOffset (4, 0, 0) -pitch -.1 -target "CityPlaza" -duration 10 -noWait -orient -heading 0.5 -sphere
	nextState CVG_UnlockSeaC
   wait -secs 6.5
end

state CVG_UnlockSeaC
   startCamera -offset 30 -targetOffset (4, 0, 0) -pitch -.1 -target "CityPlaza" -duration 2.75 -noWait -orient -heading 0.5 -sphere
	nextState CVG_UnlockSea2
   wait -secs 2.75
end

state CVG_UnlockSea2
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_UnlockSea3
end

state CVG_UnlockSea3
	nextState CVG_UnlockSea4
	text "CVG_UnlockSea" cinematics_cvg!0x00000601
	wait -secs 1
end

state CVG_UnlockSea4
  nextState CVG_unlock_end
  wait -forButton
end

#----------------------------------

#state CVG_UnlockAir
#   pauseGame
#   mixevent civ_sfx_duck 1
#   setExitState CVG_unlock_end
#   startEffect "fadeOutA" fade_to_black_quick -noWait
#	nextState CVG_UnlockAir1
#   wait -secs 1
#end

state CVG_UnlockAir1
	   startsound sfx_civ_upgrade_air -escStop
	letterbox -on
   startEffect "fadeInA" fade_from_black_quick -noWait
	startsound ui_tutorial_start
	mixevent civ_cin_start 1
	startCamera -offset 12 -targetOffset (-2.25, 1.75, 2) -pitch -.1 -target "CityPlaza" -snap -noWait -orient -heading 0.36
	nextState CVG_UnlockAir_startvig
end

state CVG_UnlockAir_startvig
   #startEffect "cpTest" cpTest  -target "CityPlaza" -offset (-9, -3, .5)
    # Note: we must start this vignette in a different state than the camera switch above, because it the camera can cause a city visualization change
   startVignette "" "Vignettes_Civ!upgrade_air.prop" (0, 0, 0) -relative object "CityPlaza" -face object "CityPlaza" (0, 2, 0) -noWait
	nextState CVG_UnlockAir_startvigB
   wait -secs 3
end

state CVG_UnlockAir_startvigB
   startCamera -offset 15 -targetOffset (-9, -3, .5) -pitch -.1 -target "CityPlaza" -snap -noWait -orient -heading 0.36
   nextState CVG_UnlockAirA
   wait -secs .5
end
   
state CVG_UnlockAirA
   startCamera -offset 15 -targetOffset (5, 9, .5) -pitch -.1 -target "CityPlaza" -duration 1.6 -ease -noWait -orient -heading 0.36 
	nextState CVG_UnlockAirB
   wait -secs 1.6
end

state CVG_UnlockAirB
   startCamera -offset 60 -targetOffset (0, 0, 10) -pitch -.1 -target "CityPlaza" -duration 1 -noWait -orient -heading 0.36 
	nextState CVG_UnlockAirC
   wait -secs 1
end

state CVG_UnlockAirC
   startCamera -offset 70 -targetOffset (0, 0, 10) -pitch -.1 -target "CityPlaza" -duration 8 -noWait -orient -heading 0.36 -ease
	nextState CVG_UnlockAir2
   wait -secs 8
end

state CVG_UnlockAir2
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_UnlockAir3
end

state CVG_UnlockAir3
	nextState CVG_UnlockAir4
	text "CVG_UnlockAir" cinematics_cvg!0x00000603
	wait -secs 1
end

state CVG_UnlockAir4
  nextState CVG_unlock_end
  wait -forButton
end



state CVG_unlock_end
   setExitState null
  mixevent civ_sfx_duck 0
end

#############################################################

# This is an alternate entry point for CVG_Capture, found below

state CVG_Capture_Nuked
	startEffect "fadeOutA" fade_to_black_3 -noWait
	setexitstate CVG_Capture_End
        mixevent civ_sfx_duck 1
   	sendMessage -id 0x0604bf01  # kCinematicMessageCityChangeShowCaptureEffect
   	wait -secs 3
    pauseGame
	nextState CVG_CaptureA_Nuked
end

state CVG_CaptureA_Nuked
	letterbox -on
	startsound ui_tutorial_start
	startEffect "fadeInA" fade_from_black_quick -noWait
	startCamera -offset 185 -targetOffset (0, 0, 0) -pitch -.1 -target "CityHall" -snap -noWait -orient -heading .525
	nextState CVG_CaptureA1_Nuked
end

state CVG_CaptureA1_Nuked
	startCamera -offset 230 -targetOffset (0, 0, 0) -pitch -.1 -target "CityHall" -duration 13 -noWait -orient -heading .525 -ease
   wait -secs 6
	nextState CVG_Capture
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

state CVG_Capture
	startEffect "fadeOutA" fade_to_black_3 -noWait
	setexitstate CVG_Capture_End
        mixevent civ_sfx_duck 1
   	sendMessage -id 0x0604bf01  # kCinematicMessageCityChangeShowCaptureEffect
	startsound sfx_civ_conquer_newregime
   	wait -secs 3
	pauseGame
	nextState CVG_CaptureA
end

state CVG_CaptureA
	letterbox -on
	startsound ui_tutorial_start
	startEffect "fadeInA" fade_from_black_quick -noWait
   sendMessage -id 0x05dfb3c8  # kCinematicMessageCityChangeTriggerVignette
	startCamera -offset 35 -targetOffset (0, 0, 2.5) -pitch -.06 -target "CityPlaza" -snap -noWait -orient -heading .525
	nextState CVG_CaptureA1   
end

state CVG_CaptureA1
	startCamera -offset 40 -targetOffset (0, 0, 2.5) -pitch -.06 -target "CityPlaza" -duration 15 -noWait -orient -heading .475 -ease
	wait -secs 11
	nextState CVG_CaptureA3
end

state CVG_CaptureA3
	startCamera -offset 155 -targetOffset (0, 0, 0)  -pitch -.1 -target "CityHall" -duration 1 -noWait -orient -heading 0.525 -ease
   wait -secs 1
   nextState CVG_CaptureA4  
end

state CVG_CaptureA4
   sendMessage -id 0x05f4d02a  # kCinematicMessageCityChangeStartBuildingsEffects
   sendMessage -id 0x05dfb77f  # kCinematicMessageCityChangeSwapBuildings
	startCamera -offset 165 -targetOffset (0, 0, 0)  -pitch -.1 -target "CityHall" -duration 1 -noWait -orient -heading 0.525 -ease  
   nextState CVG_CaptureA5_1  
   wait -secs 1
end

state CVG_CaptureA5_1  
	startCamera -offset 250 -targetOffset (0, 0, 0)  -pitch -.1 -target "CityHall" -duration 1 -noWait -orient -heading 0.525 -ease
   wait -secs 1
   nextState CVG_CaptureA5  
end

state CVG_CaptureA5
   sendMessage -id 0x05dfb782  # kCinematicMessageCityChangeChangeWallColor   
   wait -secs 1.5
   nextState CVG_CaptureA6
end

state CVG_CaptureA6
   sendMessage -id 0x05dbc31e  # kCinematicMessageCityChangeCivilization
   wait -secs 1
	nextState CVG_CaptureB   
end

state CVG_CaptureB
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_CaptureC
end

state CVG_CaptureC
   pauseGame -screenEffect -pauseGraphics
	textFromCode "CaptureString"
	wait -secs 1
	nextState CVG_CaptureD
end

state CVG_CaptureD
	wait -forButton
	nextState CVG_Capture_End
end

state CVG_Capture_End
   setExitState null
     mixevent civ_sfx_duck 0
end
 
#############################################################
####CVG_Lose####

state CVG_Lose
   pauseGame
   mixevent civ_lose_duck 1
   setexitstate CVG_Lose_End
   startEffect "fadeOutA" fade_to_black_3 -noWait
   nextState CVG_LoseA
   wait -secs 3   
end

state CVG_LoseA
	startsound ui_tutorial_start
        startEffect "fadeInA" fade_from_black_quick -noWait
	startsound music_civ_lose -escstop
	letterbox -on
   startCamera -offset 35 -targetOffset (0, 0, 2.5) -pitch -.06 -target "Plaza" -snap -noWait -orient -heading .525
	nextState CVG_LoseA1
end

state CVG_LoseA1
   startCamera -offset 40 -targetOffset (0, 0, 2.5) -pitch -.06 -target "Plaza" -duration 15 -noWait -orient -heading .475 -ease
   startVignette "" "Vignettes_Civ!cvg_vi_death.prop" (0, 0, 0) -relative object "Plaza" -face object "Plaza" (0, -2, 0) -noWait
	wait -secs 4
	nextState CVG_LoseA2
end

state CVG_LoseA2
	startCamera -offset 700 -pitch -.2 -heading .525 -orient -target "CityHall" -duration 6 -noWait
	wait -secs 6
	nextState CVG_LoseB
end

state CVG_LoseB
	pauseGame -screenEffect -effect DeathFreezeFrame -pauseGraphics
	wait -secs .135
	nextState CVG_LoseC
end

state CVG_LoseC
	text "CVG_Lose" cinematics_cvg!0x00000108
	wait -secs 1
	nextState CVG_LoseD
end

state CVG_LoseD
        mixevent civ_lose_duck 0
	wait -forButton
end

state CVG_Lose_End
     setExitState null
     mixevent civ_lose_duck 0
end

#############################################################
# Tier 3 Superweapons
#############################################################

state CVG_RelT3
	unpauseGame
	letterbox -on
	startsound sfx_cin_civ_reli -escstop
        setExitState CVG_RelT3_end
        mixevent civ_sfx_duck 1
	startCamera -offset 150 -pitch -.1 -heading .5 -target "CityHall" -snap -noWait -sphere
	wait -secs 3
	nextState CVG_RelT3a
end	

state CVG_RelT3a
	sendMessage -id 0x06524f8f # kMessageTriggerSuperweapon
	startCamera -offset 150 -pitch -.1 -heading .5 -target "CityHall" -snap -noWait -sphere
	nextState CVG_RelT3b
end	

state CVG_RelT3b
	startCamera -offset 650 -pitch -.25 -target "CityHall" -orient -heading -.5 -duration 10 -noWait
	wait -secs 10
	nextState CVG_RelT3c
end

state CVG_RelT3c
	startCamera -offset -650 -target "OppositeSide" -duration 6 -satellite -noWait -ease
	wait -secs 7.5
    nextState CVG_RelT3d
end

state CVG_RelT3d
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_RelT3e
end

state CVG_RelT3e
	wait -secs 1
   text "CVG_Rel" cinematics_cvg!0x00000701
	nextState CVG_RelT3f
end

state CVG_RelT3f
	wait -forButton
	mixevent civ_sfx_duck 0
end

state CVG_RelT3_end
	mixevent civ_sfx_duck 0
end

#---------------------------------------

state CVG_MilT3
	unpauseGame
	letterbox -on
        startsound sfx_cin_civ_icbm -escstop
        setExitState CVG_MilT3_end
        mixevent civ_sfx_duck 1
	startCamera -offset 150 -pitch -.1 -target "CityHall" -snap -heading .5 -noWait -sphere
	wait -secs 3
	nextState CVG_MilT3a1
end	

state CVG_MilT3a1
	startCamera -offset 150 -pitch -.1 -heading .5 -target "CityHall" -snap -noWait -sphere
        sendMessage -id 0x06524f8f # kMessageTriggerSuperweapon  
	nextState CVG_MilT3a
end	

state CVG_MilT3a
	startCamera -offset 650 -pitch -.25 -target "CityHall" -duration 5 -noWait -ease
	wait -secs 4.9
	nextState CVG_MilT3b
end

state CVG_MilT3b
	startCamera -offset -650 -target "OppositeSide" -duration 12 -satellite -noWait -ease
	wait -secs 11.9
    nextState CVG_MilT3c
end

state CVG_MilT3c
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_MilT3d
end

state CVG_MilT3d
	wait -secs 1
   text "CVG_Mil" cinematics_cvg!0x00000700
	nextState CVG_MilT3e
end

state CVG_MilT3e
        mixevent civ_sfx_duck 0
	wait -forButton
end

state CVG_MilT3_end
	mixevent civ_sfx_duck 0
end


#--------------------------------------- 


state CVG_EcoT3
	unpauseGame
	letterbox -on
	startsound sfx_cin_civ_econ -escstop
        setExitState CVG_EcoT3_end
	mixevent civ_sfx_duck 1
	startCamera -offset 150 -pitch -.13 -target "CityHall" -snap -heading 0 -noWait -sphere
	wait -secs 3
	nextState CVG_EcoT3a1
end	

state CVG_EcoT3a1
	sendMessage -id 0x06524f8f # kMessageTriggerSuperweapon
	startCamera -offset 150 -pitch -.13 -target "CityHall" -snap -heading 0 -noWait -sphere
	nextState CVG_EcoT3a
end	

state CVG_EcoT3a
	startCamera -offset 650 -targetOffset (0, 0, -200) -pitch -.25 -target "CityHall" -duration 6 -heading -.5 -noWait -ease
	wait -secs 5.9
	nextState CVG_EcoT3b
end

state CVG_EcoT3b
	startCamera -offset -400 -target "OppositeSide" -duration 15 -satellite -noWait -ease
	wait -secs 15.5
   nextState CVG_EcoT3c
end

state CVG_EcoT3c
	pauseGame -screenEffect -pauseGraphics
	wait -secs .135
	nextState CVG_EcoT3d
end

state CVG_EcoT3d
	wait -secs 1
   text "CVG_Eco" cinematics_cvg!0x00000702
	nextState CVG_EcoT3e
end

state CVG_EcoT3e
	mixevent civ_sfx_duck 0
	wait -forButton
end

state CVG_EcoT3_end
	mixevent civ_sfx_duck 0
end
