# Wave Complete Sequence
# Executed once when all mobs in a wave are defeated (state transitions 1 -> 2)
# Handles sound fanfares, clear bonuses, titles, and initiates 30-second intermission

# Set state to 2 (Intermission)
scoreboard players set .wave state 2

# Reset intermission timer to 600 ticks (30 seconds)
scoreboard players set .wave intermission_timer 600

# Wave clear Candy rewards
scoreboard players add .global coins 15
tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":"Wave Clear Bonus: ","color":"green"},{"text":"+15 Candy!","color":"yellow","bold":true}]

# Play celebration fanfare & brief title (2.25s total)
playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1.0 1.0 1
title @a times 5 30 10
title @a title {"text":"WAVE CLEARED!","color":"green","bold":true}
title @a subtitle [{"text":"Next wave in ","color":"gray"},{"text":"30s","color":"yellow","bold":true}]

scoreboard players enable @a gg_skip
tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":"Wave ","color":"green"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":" cleared. Next wave in 30s, get ready!","color":"green"},{"text":" ["},{"text":"SKIP","color":"yellow","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger gg_skip"},"click_event":{"action":"run_command","command":"/trigger gg_skip","value":"/trigger gg_skip"}},{"text":"]"}]
