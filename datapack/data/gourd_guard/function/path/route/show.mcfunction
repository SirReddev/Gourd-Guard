# Pathfinding - Visualize a route's nodes
# Usage: /function gourd_guard:path/route/show {route:1}
# Spawns particles at each node so you can see the path layout

$scoreboard players set #show_route path.cmp $(route)

execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp \
    at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.1 0.1 0.03 30

execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp \
    at @s run particle minecraft:flame ~ ~0.1 ~ 0 0 0 0 1 force

$tellraw @s [{"text":"[Path] Showing route ","color":"gray"},{"text":"$(route)","color":"yellow","bold":true}]
