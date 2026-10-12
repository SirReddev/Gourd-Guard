# Pathfinding - Clear ONLY the nodes in the currently selected section
# Usage: /function gourd_guard:path/route/clear_section

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy
scoreboard objectives add path.cmp dummy

execute unless score CurrentMap path.edit matches 1.. run scoreboard players set CurrentMap path.edit 1
execute unless score CurrentRoute path.edit matches 1.. run scoreboard players set CurrentRoute path.edit 1
execute unless score CurrentBranch path.edit matches 0..23 run scoreboard players set CurrentBranch path.edit 0

scoreboard players set ClearedNodes path.cmp 0
execute as @e[tag=path_node] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit if score @s path.branch = CurrentBranch path.edit run scoreboard players add ClearedNodes path.cmp 1
execute as @e[tag=path_node] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit if score @s path.branch = CurrentBranch path.edit run kill @s

execute if score CurrentBranch path.edit matches 0 run scoreboard players set NextNode path.edit 0
execute if score CurrentBranch path.edit matches 1..23 run scoreboard players set NextNode path.edit 1

tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Cleared ","color":"red"},{"score":{"name":"ClearedNodes","objective":"path.cmp"},"color":"yellow","bold":true},{"text":" nodes from active section. Ready at Node ","color":"red"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
