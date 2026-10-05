# Pathfinding - Begin editing a route
# Usage: /function gourd_guard:path/route/begin {route:1}

$scoreboard players set #edit_route path.edit $(route)

# Count existing nodes for this route to set the correct next index
scoreboard players set #next_node path.edit 0
execute as @e[tag=path_node] if score @s path.route = #edit_route path.edit run scoreboard players add #next_node path.edit 1

$tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Editing route $(route)","color":"green","bold":true},{"text":" — next node: ","color":"gray"},{"score":{"name":"#next_node","objective":"path.edit"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Walk to each waypoint and run: ","color":"gray"},{"text":"function gourd_guard:path/route/add_node","color":"yellow","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}}]
