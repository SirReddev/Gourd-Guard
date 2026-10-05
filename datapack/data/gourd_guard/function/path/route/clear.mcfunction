# Pathfinding - Delete all nodes on a route
# Usage: /function gourd_guard:path/route/clear {route:1}

scoreboard objectives add path.route dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ClearRoute path.cmp $(route)
scoreboard players set ClearedNodes path.cmp 0

# Count and delete matching nodes
execute as @e[tag=path_node] if score @s path.route = ClearRoute path.cmp run scoreboard players add ClearedNodes path.cmp 1
execute as @e[tag=path_node] if score @s path.route = ClearRoute path.cmp run kill @s

# Stop mobs on this route
execute as @e[tag=path_mob] if score @s path.route = ClearRoute path.cmp run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] if score @s path.route = ClearRoute path.cmp run tag @s remove path_mob

$tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared ","color":"red"},{"score":{"name":"ClearedNodes","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" nodes for route $(route)","color":"red"}]
