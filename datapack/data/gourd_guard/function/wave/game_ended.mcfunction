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
kill @e[tag=gg_candy]
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".candy run kill @s
function gourd_guard:hud/reset_candy
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

# 2. Trigger screen transition: 15t fade in, 25t black hold, 15t fade out
posteffect add @a gourd_guard:fade_black
scoreboard players set .wave reset_timer 20
scoreboard players set .wave fade_timer 55
schedule function gourd_guard:wave/transition/game_over_reset 20t
schedule function gourd_guard:wave/transition/clear 55t
