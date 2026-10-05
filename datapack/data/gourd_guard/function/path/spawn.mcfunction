# Pathfinding - One-command Spawn and Route Assignment
# Usage: /function gourd_guard:path/spawn {mob:"zombie",route:1}

$execute at @s run summon $(mob) ~ ~ ~ {Tags:["route_$(route)"]}
function gourd_guard:path/mob/auto_init
