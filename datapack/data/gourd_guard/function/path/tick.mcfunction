# Pathfinding System - Main Tick

# 1. Auto-detect any newly spawned mobs with route tags
function gourd_guard:path/mob/auto_init

# 2. Process all active path mobs
execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process
