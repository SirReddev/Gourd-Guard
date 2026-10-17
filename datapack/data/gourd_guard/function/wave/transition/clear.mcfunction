# Remove posteffect transition
posteffect remove @a gourd_guard:fade_black

# Transition finished: return to state 0 (Lobby / Idle)
scoreboard players set .wave state 0

# Disable Adventure Mode Flight after the fade
function gourd_guard:fly/disable

# Announce reset complete when returning to normal screen
tellraw @a [{"text":"[Gourd Guard] ","color":"green"},{"text":"Game reset. Ready for next playthrough!","color":"gray"}]
