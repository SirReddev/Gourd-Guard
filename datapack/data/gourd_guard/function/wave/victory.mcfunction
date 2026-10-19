# Victory - All 40 Waves Cleared!
scoreboard players set .wave state 3
scoreboard players set .global timer_active 0

# Record map completion time to leaderboard
function gourd_guard:lobby/leaderboard/record_victory

# Record victory in statistics
function gourd_guard:lobby/stats/init
execute if score #game_active gg_stats matches 1 run scoreboard players add #stats_wins gg_stats 1
scoreboard players set #game_active gg_stats 0
function gourd_guard:lobby/stats/update

# Stop timer audio & reset intermission timer
stopsound @a record gourd_guard:hud.timer10s
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0

# Clean remaining mobs, remove all placed towers & clear player inventories, and reset Pumpkin variant
kill @e[tag=path_mob]
kill @e[tag=gg_mob]
kill @e[tag=gg_candy]
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".candy run kill @s
function gourd_guard:hud/reset_candy
function gourd_guard:tower/reset_all
function gourd_guard:pumpkin/set_default

# 1. Play custom Victory sound effect & Title together
execute as @a at @s run playsound gourd_guard:game.won record @s ~ ~ ~ 1.0 1.0 1

# Victory title displays above the screen fade
title @a times 10 70 20
title @a title {"text":"VICTORY!","color":"gold","bold":true}
title @a subtitle {"text":"YOU DEFENDED THE GOURD FROM ALL 40 WAVES!","color":"yellow","bold":true}

tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":" CONGRATULATIONS! You successfully completed all 40 Waves! The Pumpkin is saved!","color":"yellow"}]

# 2. Trigger screen transition: 15t fade in, 25t black hold, 15t fade out
posteffect add @a gourd_guard:fade_black
scoreboard players set .wave reset_timer 20
scoreboard players set .wave fade_timer 55
schedule function gourd_guard:wave/transition/victory_reset 20t
schedule function gourd_guard:wave/transition/clear 55t
