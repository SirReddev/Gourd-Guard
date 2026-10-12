# Pathfinding - Switch route editor to Sub-Split Option 2A (branch 21, splitting from Option 2)
# Usage: /function gourd_guard:path/route/option_2a

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

execute unless score CurrentMap path.edit matches 1.. run scoreboard players set CurrentMap path.edit 1
execute unless score CurrentRoute path.edit matches 1.. run scoreboard players set CurrentRoute path.edit 1
scoreboard players set CurrentBranch path.edit 21

scoreboard players set NextNode path.edit 1
execute as @e[tag=path_node,scores={path.branch=21}] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit run scoreboard players add NextNode path.edit 1

tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Switched Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true},{"text":" to ","color":"green"},{"text":"[Option 2A (Sub-Split)]","color":"dark_purple","bold":true},{"text":" - Next node: ","color":"gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Actions: ","color":"gray"},{"text":"[+ Add Node]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}},{"text":"  ","color":"gray"},{"text":"[Sub-Split: 2B]","color":"red","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/option_2b"}},{"text":"  ","color":"gray"},{"text":"[Sub-Merge 2]","color":"gold","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/merge_2"}},{"text":"  ","color":"gray"},{"text":"[Main Merge: Common End]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/merge"}}]
