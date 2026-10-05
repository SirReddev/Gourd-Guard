# Pathfinding - Begin editing a route
# Usage: /function gourd_guard:path/route/begin {route:1}

scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

$scoreboard players set CurrentRoute path.edit $(route)

# Count existing nodes for this route to set the correct next index
scoreboard players set NextNode path.edit 0
execute as @e[tag=path_node] if score @s path.route = CurrentRoute path.edit run scoreboard players add NextNode path.edit 1

$tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Editing route $(route)","color":"green","bold":true},{"text":" - Next node index: ","color":"gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Walk to each waypoint and run: ","color":"gray"},{"text":"function gourd_guard:path/route/add_node","color":"yellow","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}}]
