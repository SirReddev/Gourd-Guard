# Pathfinding - Delete all nodes on a route
# Usage: /function gourd_guard:path/route/clear {route:1}

$scoreboard players set #clear_route path.cmp $(route)

# Kill all nodes for this route
execute as @e[tag=path_node] if score @s path.route = #clear_route path.cmp run kill @s

# Stop any mobs that were following this route
execute as @e[tag=path_mob] if score @s path.route = #clear_route path.cmp run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] if score @s path.route = #clear_route path.cmp run tag @s remove path_mob

$tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Route $(route) cleared","color":"red","bold":true}]
