# Wave System Main Tick Loop
# State machine: 0 = Idle, 1 = Wave Active, 2 = Intermission, 3 = Victory, 4 = Defeat

# Ensure default map if unset
scoreboard objectives add gg_skip trigger
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# 1. State 1: Active Wave Spawning & Progression
execute if score .wave state matches 1 run function gourd_guard:wave/active_tick

# 2. State 2: Intermission Countdown Timer handling
execute if score .wave state matches 2 run function gourd_guard:wave/intermission_tick

# 3. Check for player [SKIP] trigger
execute as @a[scores={gg_skip=1..}] run function gourd_guard:wave/skip_trigger
