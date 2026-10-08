# Pathfinding - Clear ALL nodes and mobs across all maps and paths
# Usage: /function gourd_guard:path/route/clear_all

scoreboard objectives add path.cmp dummy

scoreboard players set TotalDeleted path.cmp 0
execute as @e[tag=path_node] run scoreboard players add TotalDeleted path.cmp 1
execute as @e[tag=path_node] run kill @s

execute as @e[tag=path_mob] run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] run tag @s remove path_mob

tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared all ","color":"red"},{"score":{"name":"TotalDeleted","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" path nodes across all maps and paths!","color":"red"}]
