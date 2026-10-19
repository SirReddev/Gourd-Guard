# Game Ended - Ended manually by player at Peeves
scoreboard players set .wave state 0
scoreboard players set .global cs.state 0
scoreboard players set #game_active gg_stats 0
scoreboard players set .global timer_active 0

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

# 1. Play custom Game Over sound effect & Title
execute as @a at @s run playsound gourd_guard:game.over record @s ~ ~ ~ 1.0 1.0 1
title @a times 10 200 20
title @a title {"text":"GAME ENDED","color":"gold","bold":true}
title @a subtitle [{"text":"The game was ended on Wave ","color":"yellow"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"yellow"}]

tellraw @a [{"text":"[!] ","color":"gold"},{"text":"GAME ENDED! The match was ended on Wave ","color":"yellow"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"yellow"}]

# 2. Trigger screen transition: 15t fade in, 25t black hold, 15t fade out
function gourd_guard:wave/transition/fade_black

# 3. Reset the game state and teleport to lobby during solid black hold (tick 20)
schedule function gourd_guard:wave/transition/game_over_reset 20t

