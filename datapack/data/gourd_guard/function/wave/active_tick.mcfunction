# gourd_guard:wave/active_tick
# State 1: Active Wave Spawning & Progression

scoreboard players add .wave spawn_timer 1

# Dispatch active wave sequence
execute if score .global map matches 1..5 run function gourd_guard:wave/map1/tick

# Clean up any child magma cubes that split without pathfinding state
execute as @e[type=magma_cube,tag=gg_mob] unless score @s path.state matches 1.. run kill @s

# Update mob health display periodically (e.g. for poison ticks)
scoreboard players add .global mob_hp_tick 1
execute if score .global mob_hp_tick matches 10.. run scoreboard players set .global mob_hp_tick 0
execute if score .global mob_hp_tick matches 0 as @e[tag=gg_mob] run function gourd_guard:wave/mob_update_hp

# Count remaining active wave mobs in the world
scoreboard players set .global wave_mobs 0
execute as @e[tag=gg_mob] run scoreboard players add .global wave_mobs 1

# Check if current wave is completely cleared (all spawned & all dead/passed)
execute if score .wave spawn_done matches 1 if score .global wave_mobs matches 0 run function gourd_guard:wave/complete
