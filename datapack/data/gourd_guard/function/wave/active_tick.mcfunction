# gourd_guard:wave/active_tick
# State 1: Active Wave Spawning & Progression

scoreboard players add .wave spawn_timer 1

# Dispatch active wave sequence
execute if score .global map matches 1..5 run function gourd_guard:wave/map1/tick

# Count remaining active wave mobs in the world
scoreboard players set .global wave_mobs 0
execute as @e[tag=gg_mob] run scoreboard players add .global wave_mobs 1

# Check if current wave is completely cleared (all spawned & all dead/passed)
execute if score .wave spawn_done matches 1 if score .global wave_mobs matches 0 run function gourd_guard:wave/complete
