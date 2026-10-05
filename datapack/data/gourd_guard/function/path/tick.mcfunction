# Pathfinding System - Main Tick
# Runs every tick for all active path-following mobs

execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process
