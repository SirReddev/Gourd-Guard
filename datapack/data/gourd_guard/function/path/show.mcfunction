# Pathfinding - Visualize all nodes across all maps and paths
# Usage: /function gourd_guard:path/show

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.cmp dummy

# Render blue soul vault particles at each node
execute as @e[tag=path_node] at @s run particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node] at @s run particle minecraft:soul ~ ~0.6 ~ 0.1 0.3 0.1 0.02 15

scoreboard players set FoundNodes path.cmp 0
execute as @e[tag=path_node] run scoreboard players add FoundNodes path.cmp 1

tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Showing waypoints - found ","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" total nodes across all maps and paths.","color":"green"}]
