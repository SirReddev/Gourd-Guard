# Game Ended - Ended manually by player at Peeves
scoreboard players set .wave state 0
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
function gourd_guard:cutscene/reset
function gourd_guard:fly/disable

# 1. Play custom Game Over sound effect & Title
execute as @a at @s run playsound gourd_guard:game.over record @s ~ ~ ~ 1.0 1.0 1
title @a times 10 70 20
title @a title {"text":"GAME ENDED","color":"gold","bold":true}
title @a subtitle [{"text":"The game was ended on Wave ","color":"yellow"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"yellow"}]

tellraw @a [{"text":"[!] ","color":"gold"},{"text":"GAME ENDED! The match was ended on Wave ","color":"yellow"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"yellow"}]

# Clear posteffects
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black

# 2. Reset Game State and teleport to lobby immediately
function gourd_guard:wave/reset_data
function gourd_guard:wave/transition/teleport_lobby
