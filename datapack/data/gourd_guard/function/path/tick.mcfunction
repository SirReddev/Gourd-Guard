# Pathfinding System - Main Tick
# Movement (cheap) every tick, direction update (expensive) every 3 ticks

# Every tick: walk forward in current facing direction
execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/walk

# Every 3 ticks: update facing + check node advance
scoreboard players add #path_tick path.tick 1
execute if score #path_tick path.tick matches 3.. run scoreboard players set #path_tick path.tick 0
execute if score #path_tick path.tick matches 0 run execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process
