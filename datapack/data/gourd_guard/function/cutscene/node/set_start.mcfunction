# Cutscene System - Set Player Cutscene Start Location
# Usage: /function gourd_guard:cutscene/node/set_start
# Captures player's position and rotation for the active map

function gourd_guard:cutscene/init

# Remove old start marker for current map
scoreboard players operation TargetMap cs.cmp = CurrentMap cs.edit
execute as @e[tag=cs_player_start] if score @s cs.map = TargetMap cs.cmp run kill @s

# Summon new start marker capturing position and rotation
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs_player_start","cs_start_new"]}
execute at @s run tp @e[tag=cs_start_new] ~ ~ ~ ~ ~

scoreboard players operation @e[tag=cs_start_new] cs.map = CurrentMap cs.edit
tag @e[tag=cs_start_new] remove cs_start_new

execute at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 50
execute at @s run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.3 0.2 0.02 20

tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Set Player Cutscene Start Location for Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"cs.edit"},"color":"gold","bold":true}]
