# Cutscene System - Show All Cutscene Nodes
# Usage: /function gourd_guard:cutscene/node/show

function gourd_guard:cutscene/init
scoreboard players operation TargetMap cs.cmp = CurrentMap cs.edit

# Render particles at nodes
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp at @s run particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.1 0.2 0.1 0.02 20
execute as @e[tag=cs_cam_node] if score @s cs.map = TargetMap cs.cmp at @s run particle minecraft:end_rod ~ ~ ~ 0.1 0.1 0.1 0.02 20
execute as @e[tag=cs_player_spawn] if score @s cs.map = TargetMap cs.cmp at @s run particle minecraft:portal ~ ~1 ~ 0.2 0.4 0.2 0.05 30

scoreboard players set FoundNodes cs.cmp 0
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp run scoreboard players add FoundNodes cs.cmp 1

tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Showing cutscene nodes for Map ","color":"green"},{"score":{"name":"TargetMap","objective":"cs.cmp"},"color":"gold","bold":true},{"text":": found ","color":"green"},{"score":{"name":"FoundNodes","objective":"cs.cmp"},"color":"yellow","bold":true},{"text":" NPC waypoints.","color":"green"}]
