# Wave System Main Tick Loop
# State machine: 0 = Idle, 1 = Wave Active, 2 = Intermission, 3 = Victory, 4 = Defeat

# Ensure default map if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# 1. State 1: Active Wave Spawning & Progression
execute if score .wave state matches 1 run function gourd_guard:wave/active_tick

# 2. State 2: Intermission Countdown Timer handling
execute if score .wave state matches 2 run function gourd_guard:wave/intermission_tick

# 3. Check for player [SKIP] trigger
execute as @a[scores={gg_skip=1..}] run function gourd_guard:wave/skip_trigger

# 4. Defeat Watchdog: trigger Game Over if Gourd HP reaches 0
execute if score .wave state matches 1..2 if score .objective obj_hp matches ..0 run function gourd_guard:wave/game_over

# 5. Transition tick-drivers (ensures lobby teleport and fade clear even if /schedule drops)
execute if score .wave reset_timer matches 1.. run scoreboard players remove .wave reset_timer 1
execute if score .wave reset_timer matches 0 run function gourd_guard:wave/transition/game_over_reset
execute if score .wave reset_timer matches 0 run scoreboard players set .wave reset_timer -1

execute if score .wave fade_timer matches 1.. run scoreboard players remove .wave fade_timer 1
execute if score .wave fade_timer matches 0 run function gourd_guard:wave/transition/clear
execute if score .wave fade_timer matches 0 run scoreboard players set .wave fade_timer -1
