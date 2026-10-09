# gourd_guard:wave/active_tick
# State 1: Active Wave Spawning & Progression

scoreboard players add .wave spawn_timer 1

# Dispatch active wave sequence based on current map
execute if score .global map matches 1 run function gourd_guard:wave/map1/tick
execute if score .global map matches 2 run function gourd_guard:wave/map2/tick

# Check if current wave is completely cleared (all spawned & all dead/passed)
execute if score .wave spawn_done matches 1 if score .global wave_mobs matches 0 run function gourd_guard:wave/complete
