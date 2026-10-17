# Game Over - Pumpkin Objective Destroyed
scoreboard players set .wave state 4
scoreboard players set .global timer_active 0

# Record defeat in statistics
function gourd_guard:lobby/stats/init
execute if score #game_active gg_stats matches 1 run scoreboard players add #stats_fails gg_stats 1
scoreboard players set #game_active gg_stats 0
function gourd_guard:lobby/stats/update

# Stop timer audio & reset intermission timer
stopsound @a record gourd_guard:hud.timer10s
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0

# Stop all remaining mobs, remove all placed towers & clear player inventories, and reset Pumpkin variant
kill @e[tag=path_mob]
kill @e[tag=gg_mob]
function gourd_guard:tower/reset_all
function gourd_guard:pumpkin/set_default

# 1. Play custom Game Over sound effect & Title together
execute as @a at @s run playsound gourd_guard:game.over record @s ~ ~ ~ 1.0 1.0 1

# Defeat title displays above the screen fade
title @a times 10 70 20
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Pumpkin Objective was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"GAME OVER! The base was overwhelmed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

# 2. Trigger screen transition: fade to black, teleport/reset behind curtain at 15t, fade out at 50t
posteffect add @a gourd_guard:cutscene_fade
schedule function gourd_guard:wave/transition/game_over_reset 15t
schedule function gourd_guard:wave/transition/clear 50t
