# gourd_guard:platform/tick
# Platform particle marker engine - Runs every tick

# 1. Advance particle cycle timer
scoreboard players add #platform_cycle gg.timer 1
execute if score #platform_cycle gg.timer matches 20.. run scoreboard players set #platform_cycle gg.timer 0

# 2. Render particles on all active platform markers
execute as @e[type=marker,tag=gg_platform_marker] at @s run function gourd_guard:platform/particle_tick
