# Pathfinding - Assign a mob to a route
# Usage: execute as <mob> run function gourd_guard:path/route/assign {route:1}
# Example: /execute as @e[type=zombie,distance=..5,limit=1] run function gourd_guard:path/route/assign {route:1}
# The mob will immediately start walking from node 0

$scoreboard players set @s path.route $(route)
scoreboard players set @s path.node  0
scoreboard players set @s path.state 1
tag @s add path_mob

$tellraw @s [{"text":"[Path] Assigned to route ","color":"green"},{"text":"$(route)","color":"yellow","bold":true},{"text":" — walking!","color":"green"}]
