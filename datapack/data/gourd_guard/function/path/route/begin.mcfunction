# Pathfinding - Begin editing a route on a specific map
# Usage: /function gourd_guard:path/route/begin {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

$scoreboard players set CurrentMap path.edit $(map)
$scoreboard players set CurrentRoute path.edit $(path)

# Count existing nodes for this map and route to set the correct next index
scoreboard players set NextNode path.edit 0
execute as @e[tag=path_node] if score @s path.map = CurrentMap path.edit if score @s path.route = CurrentRoute path.edit run scoreboard players add NextNode path.edit 1

$tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Editing Map $(map) Path $(path)","color":"green","bold":true},{"text":" - Next node index: ","color":"gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Walk to each waypoint and run: ","color":"gray"},{"text":"function gourd_guard:path/route/add_node","color":"yellow","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}}]
