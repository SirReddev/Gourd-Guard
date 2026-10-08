# Pathfinding - Delete all nodes on an entire map
# Usage: /function gourd_guard:path/route/clear_map {map:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ClearMap path.cmp $(map)
scoreboard players set ClearedNodes path.cmp 0

# Count and delete matching nodes across all paths on this map
execute as @e[tag=path_node] if score @s path.map = ClearMap path.cmp run scoreboard players add ClearedNodes path.cmp 1
execute as @e[tag=path_node] if score @s path.map = ClearMap path.cmp run kill @s

# Stop mobs on this map
execute as @e[tag=path_mob] if score @s path.map = ClearMap path.cmp run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] if score @s path.map = ClearMap path.cmp run tag @s remove path_mob

$tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared ","color":"red"},{"score":{"name":"ClearedNodes","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" nodes across all paths in Map $(map)","color":"red"}]
