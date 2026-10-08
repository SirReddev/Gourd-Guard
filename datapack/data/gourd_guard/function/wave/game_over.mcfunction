# Game Over - Pumpkin Objective Destroyed
scoreboard players set .wave state 4
scoreboard players set .global timer_active 0

# Stop all remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# Audio & Titles
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1.0 0.8 1
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Pumpkin Objective was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"GAME OVER! The base was overwhelmed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":". Click ","color":"red"},{"text":"[RESET]","color":"yellow","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function gourd_guard:wave/reset"}},{"text":" to retry!","color":"red"}]
