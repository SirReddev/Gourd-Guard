# Pathfinding - Begin editing a route on a specific map (starts on Shared Start section)
# Usage: /function gourd_guard:path/route/begin {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

$scoreboard players set CurrentMap path.edit $(map)
$scoreboard players set CurrentRoute path.edit $(path)
scoreboard players set CurrentBranch path.edit 0

# Count existing Shared Start (branch 0) nodes for this map and route to set the next index
scoreboard players set NextNode path.edit 0
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit run scoreboard players add NextNode path.edit 1

$tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Editing Map $(map) Path $(path) ","color":"green","bold":true},{"text":"[Shared Start]","color":"aqua","bold":true},{"text":" - Next node: ","color":"gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Actions: ","color":"gray"},{"text":"[+ Add Node]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}},{"text":"  ","color":"gray"},{"text":"[Split: Option 1]","color":"green","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/option_1"}},{"text":"  ","color":"gray"},{"text":"[Split: Option 2]","color":"light_purple","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/option_2"}},{"text":"  ","color":"gray"},{"text":"[Merge: Common End]","color":"gold","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/merge"}}]
