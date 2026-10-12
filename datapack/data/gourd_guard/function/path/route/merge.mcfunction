# Pathfinding - Switch route editor to Common End (branch 3) where split options rejoin
# Usage: /function gourd_guard:path/route/merge

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

execute unless score CurrentMap path.edit matches 1.. run scoreboard players set CurrentMap path.edit 1
execute unless score CurrentRoute path.edit matches 1.. run scoreboard players set CurrentRoute path.edit 1
scoreboard players set CurrentBranch path.edit 3

# Common End nodes start at index 1 so Node 0 remains uniquely the route spawn point
scoreboard players set NextNode path.edit 1
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit run scoreboard players add NextNode path.edit 1

tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Switched Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true},{"text":" to ","color":"green"},{"text":"[Common End]","color":"gold","bold":true},{"text":" - Next node: ","color":"gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Actions: ","color":"gray"},{"text":"[+ Add Node]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}},{"text":"  ","color":"gray"},{"text":"[Split: Option 1]","color":"green","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/option_1"}},{"text":"  ","color":"gray"},{"text":"[Split: Option 2]","color":"light_purple","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/option_2"}}]
