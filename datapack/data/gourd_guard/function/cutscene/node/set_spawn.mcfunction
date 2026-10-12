# Cutscene System - Set Player Post-Cutscene Spawn Point
# Usage: /function gourd_guard:cutscene/node/set_spawn

function gourd_guard:cutscene/init

# Remove old spawn marker for current map
scoreboard players operation TargetMap cs.cmp = CurrentMap cs.edit
execute as @e[tag=cs_player_spawn] if score @s cs.map = TargetMap cs.cmp run kill @s

# Summon new spawn marker capturing position and rotation, and keep chunk force-loaded
execute at @s run forceload add ~ ~
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs_player_spawn","cs_spawn_new","gg_forceloaded"]}
execute at @s run tp @e[tag=cs_spawn_new] ~ ~ ~ ~ ~

scoreboard players operation @e[tag=cs_spawn_new] cs.map = CurrentMap cs.edit
tag @e[tag=cs_spawn_new] remove cs_spawn_new

execute at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 50

tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Set Player Post-Cutscene Spawn for Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"cs.edit"},"color":"gold","bold":true}]
