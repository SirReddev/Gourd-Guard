# Cutscene System - Clear Posteffect
posteffect remove @a gourd_guard:cutscene_fade

# Start game timer & show Avatar UI as players emerge from black fade
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1

# Enable Adventure Mode Flight & equip locked Gourd Glider from the start of the map
function gourd_guard:fly/enable

# Announce Gourd Glider controls once at map start
tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Gourd Glider equipped! Tap ","color":"green"},{"text":"[Space]","color":"yellow","bold":true},{"text":" to glide, or hold ","color":"green"},{"text":"[Shift]","color":"yellow","bold":true},{"text":" to launch and ascend!","color":"green"}]
