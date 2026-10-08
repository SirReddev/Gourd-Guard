# Pathfinding - Visualize a specific map and path's nodes
# Usage: /function gourd_guard:path/route/show {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ShowMap path.cmp $(map)
$scoreboard players set ShowRoute path.cmp $(path)
scoreboard players set FoundNodes path.cmp 0

# Count matching nodes
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundNodes path.cmp 1

# Render blue soul vault particles at each node for this route
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:soul ~ ~0.6 ~ 0.1 0.3 0.1 0.02 15

# Feedback messages
$execute if score FoundNodes path.cmp matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"No nodes found for Map $(map) Path $(path). Run ","color":"red"},{"text":"/function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"yellow"},{"text":" to start adding nodes!","color":"red"}]
$execute if score FoundNodes path.cmp matches 1.. run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Showing Map $(map) Path $(path) - found ","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" nodes","color":"green"}]
