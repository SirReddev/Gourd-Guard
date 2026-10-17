# gourd_guard:platform/tick
# Platform particle marker engine - Runs every tick

# Render particles on all active platform markers
execute as @e[type=marker,tag=gg_platform_marker] at @s run function gourd_guard:platform/particle_tick
