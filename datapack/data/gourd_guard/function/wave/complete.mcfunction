# Wave Completed

# Check if Wave 40 was cleared -> VICTORY!
execute if score .global wave matches 40.. run return run function gourd_guard:wave/victory

# Set state to 2 (Intermission)
scoreboard players set .wave state 2
scoreboard players set .wave spawn_done 0

# Set Intermission Timer: 15 Seconds countdown on Timer HUD
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 15
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1

# Play celebration fanfare & brief title (2.25s total)
playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1.0 1.0 1
title @a times 5 30 10
title @a title {"text":"WAVE CLEARED!","color":"green","bold":true}
title @a subtitle [{"text":"Next wave in ","color":"gray"},{"text":"15s","color":"yellow","bold":true}]

tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"Wave ","color":"green"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":" cleared! Next wave in 15s. Click ","color":"green"},{"text":"[SKIP]","color":"yellow","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function gourd_guard:wave/skip"}},{"text":" to start immediately!","color":"green"}]
