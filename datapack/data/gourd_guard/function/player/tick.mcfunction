# gourd_guard:player/tick
# Check and initialize newly joined players
execute as @a[tag=!gg_joined] run function gourd_guard:player/join

# Keeps players invincible with a subtle speed and jump boost (no particles, always active)
scoreboard players add #player_buff_timer gg.timer 1
execute if score #player_buff_timer gg.timer matches 20.. run scoreboard players set #player_buff_timer gg.timer 0
execute unless score #player_buff_timer gg.timer matches 1 run return 0

# Invincibility (Resistance 255 + Saturation 255 + Fire Resistance + Water Breathing, hideParticles = true)
effect give @a minecraft:resistance infinite 255 true
effect give @a minecraft:saturation infinite 255 true
effect give @a minecraft:fire_resistance infinite 0 true
effect give @a minecraft:water_breathing infinite 0 true

# Little Speed (Speed I) and Jump Boost (Jump Boost I), hideParticles = true
effect give @a minecraft:speed infinite 0 true
effect give @a minecraft:jump_boost infinite 0 true
