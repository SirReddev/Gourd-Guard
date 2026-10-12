# Pathfinding System - Initialization
# Called once on datapack load or on demand

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.option dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.state dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.edit dummy
scoreboard objectives add path.tick dummy

# Migration fail-safe: Ensure existing nodes default to map 1 and branch 0 (shared start) if unset
execute as @e[tag=path_node] unless score @s path.map matches 1.. run scoreboard players set @s path.map 1
execute as @e[tag=path_node] unless score @s path.branch matches 0..3 run scoreboard players set @s path.branch 0
execute as @e[tag=path_mob] unless score @s path.branch matches 0..3 run scoreboard players set @s path.branch 0
execute as @e[tag=path_mob] unless score @s path.option matches 1..2 run scoreboard players set @s path.option 1

