# Pathfinding System - Initialization
# Called once on datapack load or on demand

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.state dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.edit dummy
scoreboard objectives add path.tick dummy

# Migration fail-safe: Ensure existing nodes default to map 1 if unset
execute as @e[tag=path_node] unless score @s path.map matches 1.. run scoreboard players set @s path.map 1
