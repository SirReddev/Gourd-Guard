# Pathfinding - Visualize a route's nodes
# Usage: /function gourd_guard:path/route/show {route:1}

$scoreboard players set #show_route path.cmp $(route)
scoreboard players set #found_nodes path.cmp 0

# Count matching nodes
execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp run scoreboard players add #found_nodes path.cmp 1

# If no nodes exist for this route
$execute if score #found_nodes path.cmp matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"No nodes found for route $(route)!","color":"red","bold":true},{"text":" Run ","color":"gray"},{"text":"/function gourd_guard:path/route/begin {route:$(route)}","color":"yellow"},{"text":" and then ","color":"gray"},{"text":"add_node","color":"yellow"},{"text":" to create nodes first.","color":"gray"}]

# If nodes exist, render high-visibility particle pillars at each node
execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp at @s run particle minecraft:flame ~ ~0.2 ~ 0.1 1.0 0.1 0.02 50
execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp at @s run particle minecraft:end_rod ~ ~1.0 ~ 0.1 0.8 0.1 0.05 40
execute as @e[tag=path_node] if score @s path.route = #show_route path.cmp at @s run particle minecraft:soul_fire_flame ~ ~2.0 ~ 0.1 0.5 0.1 0.02 30

$execute if score #found_nodes path.cmp matches 1.. run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Visualizing route $(route) — found ","color":"green"},{"score":{"name":"#found_nodes","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" nodes","color":"green"}]
execute if score #found_nodes path.cmp matches 1.. run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.5
