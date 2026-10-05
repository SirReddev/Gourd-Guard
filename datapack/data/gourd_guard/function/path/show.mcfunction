# Pathfinding - Visualize all nodes across routes without requiring macro arguments
# Usage: /function gourd_guard:path/show

scoreboard objectives add path.route dummy
scoreboard objectives add path.cmp dummy

execute as @e[tag=path_node] at @s run particle minecraft:flame ~ ~0.3 ~ 0.1 0.4 0.1 0.02 40
execute as @e[tag=path_node] at @s run particle minecraft:end_rod ~ ~0.7 ~ 0.1 0.4 0.1 0.02 30

scoreboard players set FoundNodes path.cmp 0
execute as @e[tag=path_node] run scoreboard players add FoundNodes path.cmp 1

tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Showing waypoints - found ","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" total nodes across routes.","color":"green"}]
