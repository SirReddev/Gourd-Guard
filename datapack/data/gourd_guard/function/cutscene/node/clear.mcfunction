# Cutscene System - Clear Nodes for Current Map
# Usage: /function gourd_guard:cutscene/node/clear

function gourd_guard:cutscene/init
scoreboard players operation TargetMap cs.cmp = CurrentMap cs.edit

execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp run kill @s
execute as @e[tag=cs_cam_node] if score @s cs.map = TargetMap cs.cmp run kill @s
execute as @e[tag=cs_player_spawn] if score @s cs.map = TargetMap cs.cmp run kill @s
execute as @e[tag=cs_player_start] if score @s cs.map = TargetMap cs.cmp run kill @s

scoreboard players set NextNode cs.edit 0

tellraw @s [{"text":"[Cutscene] ","color":"red"},{"text":"Cleared all cutscene waypoints for Map ","color":"yellow"},{"score":{"name":"TargetMap","objective":"cs.cmp"},"color":"gold","bold":true}]
