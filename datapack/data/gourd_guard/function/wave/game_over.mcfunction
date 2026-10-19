# Game Over - Pumpkin Objective Destroyed
scoreboard players set .wave state 4
scoreboard players set .global cs.state 0
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

# Disable flight immediately
function gourd_guard:fly/disable

# 1. Play custom Game Over sound effect & Title together
execute as @a at @s run playsound gourd_guard:game.over record @s ~ ~ ~ 1.0 1.0 1

# Defeat title displays above the screen fade (lasts 11.5s)
title @a times 10 200 20
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Gourd was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true}]

tellraw @a [{"text":"[Wave System] ","color":"dark_red","bold":true},{"text":"GAME OVER. The Gourd was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

# 2. Trigger screen transition: 2s fade in to black, 8s black hold, 2s fade out
schedule function gourd_guard:wave/transition/fade_black 1t

# 3. Reset the game state and teleport to lobby during solid black hold (tick 40)
schedule function gourd_guard:wave/transition/game_over_reset 40t
