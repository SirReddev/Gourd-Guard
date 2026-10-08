# Pathfinding - Delete all nodes on a specific map and path
# Usage: /function gourd_guard:path/route/clear {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ClearMap path.cmp $(map)
$scoreboard players set ClearRoute path.cmp $(path)
scoreboard players set ClearedNodes path.cmp 0

# Count and delete matching nodes
execute as @e[tag=path_node] if score @s path.map = ClearMap path.cmp if score @s path.route = ClearRoute path.cmp run scoreboard players add ClearedNodes path.cmp 1
execute as @e[tag=path_node] if score @s path.map = ClearMap path.cmp if score @s path.route = ClearRoute path.cmp run kill @s

# Stop mobs on this map & route
execute as @e[tag=path_mob] if score @s path.map = ClearMap path.cmp if score @s path.route = ClearRoute path.cmp run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] if score @s path.map = ClearMap path.cmp if score @s path.route = ClearRoute path.cmp run tag @s remove path_mob

$tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared ","color":"red"},{"score":{"name":"ClearedNodes","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" nodes for Map $(map) Path $(path)","color":"red"}]
