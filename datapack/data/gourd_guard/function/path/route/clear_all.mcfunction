# Pathfinding - Clear ALL nodes and mobs across all routes
# Usage: /function gourd_guard:path/route/clear_all

scoreboard players set #del_count path.cmp 0
execute as @e[tag=path_node] run scoreboard players add #del_count path.cmp 1
execute as @e[tag=path_node] run kill @s

execute as @e[tag=path_mob] run scoreboard players set @s path.state 0
execute as @e[tag=path_mob] run tag @s remove path_mob

tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared all ","color":"red"},{"score":{"name":"#del_count","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" path nodes across all routes!","color":"red"}]
