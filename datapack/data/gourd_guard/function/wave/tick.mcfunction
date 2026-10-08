# Wave System Main Tick Loop
# State machine: 0 = Idle, 1 = Wave Active, 2 = Intermission, 3 = Victory, 4 = Defeat

# Initialize objectives if missing
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add wave_mobs dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
scoreboard objectives add wave.state dummy
scoreboard objectives add wave.timer dummy
scoreboard objectives add wave.spawn_timer dummy
scoreboard objectives add wave.spawn_done dummy
scoreboard objectives add timer dummy
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
scoreboard objectives add obj_hp dummy
scoreboard objectives add obj_max_hp dummy

# Ensure default map if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# 1. State 1: Active Wave Spawning & Progression
execute if score .wave state matches 1 run scoreboard players add .wave spawn_timer 1

# Map 1 Waves:
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 1 run function gourd_guard:wave/waves/wave_1
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 2 run function gourd_guard:wave/waves/wave_2
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 3 run function gourd_guard:wave/waves/wave_3
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 4 run function gourd_guard:wave/waves/wave_4
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 5 run function gourd_guard:wave/waves/wave_5
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 6 run function gourd_guard:wave/waves/wave_6
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 7 run function gourd_guard:wave/waves/wave_7
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 8 run function gourd_guard:wave/waves/wave_8
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 9 run function gourd_guard:wave/waves/wave_9
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 10 run function gourd_guard:wave/waves/wave_10
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 11 run function gourd_guard:wave/waves/wave_11
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 12 run function gourd_guard:wave/waves/wave_12
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 13 run function gourd_guard:wave/waves/wave_13
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 14 run function gourd_guard:wave/waves/wave_14
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 15 run function gourd_guard:wave/waves/wave_15
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 16 run function gourd_guard:wave/waves/wave_16
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 17 run function gourd_guard:wave/waves/wave_17
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 18 run function gourd_guard:wave/waves/wave_18
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 19 run function gourd_guard:wave/waves/wave_19
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 20 run function gourd_guard:wave/waves/wave_20
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 21 run function gourd_guard:wave/waves/wave_21
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 22 run function gourd_guard:wave/waves/wave_22
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 23 run function gourd_guard:wave/waves/wave_23
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 24 run function gourd_guard:wave/waves/wave_24
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 25 run function gourd_guard:wave/waves/wave_25
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 26 run function gourd_guard:wave/waves/wave_26
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 27 run function gourd_guard:wave/waves/wave_27
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 28 run function gourd_guard:wave/waves/wave_28
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 29 run function gourd_guard:wave/waves/wave_29
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 30 run function gourd_guard:wave/waves/wave_30
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 31 run function gourd_guard:wave/waves/wave_31
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 32 run function gourd_guard:wave/waves/wave_32
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 33 run function gourd_guard:wave/waves/wave_33
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 34 run function gourd_guard:wave/waves/wave_34
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 35 run function gourd_guard:wave/waves/wave_35
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 36 run function gourd_guard:wave/waves/wave_36
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 37 run function gourd_guard:wave/waves/wave_37
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 38 run function gourd_guard:wave/waves/wave_38
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 39 run function gourd_guard:wave/waves/wave_39
execute if score .wave state matches 1 if score .global map matches 1 if score .global wave matches 40 run function gourd_guard:wave/waves/wave_40

# Map 2 Waves dispatcher (reserved for Map 2 wave sequences)
execute if score .wave state matches 1 if score .global map matches 2 run function gourd_guard:wave/map2/tick

# Check if current wave is completely cleared (all spawned & all dead/passed)
execute if score .wave state matches 1 if score .wave spawn_done matches 1 if score .global wave_mobs matches 0 run function gourd_guard:wave/complete

# 2. State 2: Intermission Countdown Timer handling
execute if score .wave state matches 2 if score .global timer_active matches 1 if score .global timer_min matches 0 if score .global timer_sec matches 0 if score .global timer_ticks matches 0 run function gourd_guard:wave/intermission_end

