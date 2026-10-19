# Cutscene System - Clear Posteffect
posteffect remove @a gourd_guard:cutscene_fade

# Start game timer & show Avatar UI as players emerge from black fade
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1

# Enable Adventure Mode Flight as players emerge from the fade and greet Peeves
function gourd_guard:fly/enable
