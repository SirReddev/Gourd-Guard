# Wave Completed

# Check if Wave 40 was cleared -> VICTORY!
execute if score .global wave matches 40.. run return run function gourd_guard:wave/victory

# Set state to 2 (Intermission)
scoreboard players set .wave state 2
scoreboard players set .wave spawn_done 0

# Set Intermission Timer: 30 Seconds countdown on Wave Intermission HUD
scoreboard players set .wave timer_min 0
scoreboard players set .wave timer_sec 30
scoreboard players set .wave timer_ticks 0

# Play celebration fanfare & brief title (2.25s total)
playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1.0 1.0 1
title @a times 5 30 10
title @a title {"text":"WAVE CLEARED!","color":"green","bold":true}
title @a subtitle [{"text":"Next wave in ","color":"gray"},{"text":"30s","color":"yellow","bold":true}]

scoreboard objectives add gg_skip trigger
scoreboard players enable @a gg_skip
tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":"Wave ","color":"yellow"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":" cleared. Next wave in 30s, get ready! ","color":"yellow"},{"text":"[SKIP]","color":"gold","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger gg_skip set 1"},"clickEvent":{"action":"run_command","value":"/trigger gg_skip set 1"},"hover_event":{"action":"show_text","value":"Click to skip intermission and start wave immediately!"},"hoverEvent":{"action":"show_text","value":"Click to skip intermission and start wave immediately!"}}]
