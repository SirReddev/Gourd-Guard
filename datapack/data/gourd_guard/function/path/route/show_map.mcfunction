# Pathfinding - Visualize all nodes on an entire map (color-coded by section)
# Usage: /function gourd_guard:path/route/show_map {map:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ShowMap path.cmp $(map)
scoreboard players set FoundNodes path.cmp 0

# Count matching nodes
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp run scoreboard players add FoundNodes path.cmp 1

# Clear any previous floating labels and spawn new 3D labels above each node on this map (lasts 15s)
function gourd_guard:path/route/hide_labels
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp at @s run function gourd_guard:path/route/spawn_label
schedule function gourd_guard:path/route/hide_labels 300t replace

# Render section-colored particles at each node on this map
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:soul ~ ~0.6 ~ 0.1 0.3 0.1 0.02 15
execute as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:happy_villager ~ ~0.4 ~ 0.15 0.3 0.15 0.05 35
execute as @e[tag=path_node,scores={path.branch=11..13}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:happy_villager ~ ~0.4 ~ 0.15 0.3 0.15 0.05 35
execute as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:witch ~ ~0.4 ~ 0.15 0.3 0.15 0.05 40
execute as @e[tag=path_node,scores={path.branch=21..23}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:witch ~ ~0.4 ~ 0.15 0.3 0.15 0.05 40
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp at @s run particle minecraft:lava ~ ~0.6 ~ 0.1 0.2 0.1 0.02 10

# Feedback messages
$execute if score FoundNodes path.cmp matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"No nodes found for Map $(map).","color":"red"}]
$execute if score FoundNodes path.cmp matches 1.. run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Showing Map $(map) - found ","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" total nodes across its paths","color":"green"}]
