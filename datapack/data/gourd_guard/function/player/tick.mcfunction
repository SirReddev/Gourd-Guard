# Check and initialize newly joined players (checks has_joined)
execute as @a[tag=!has_joined] at @s run function gourd_guard:player/join
execute as @a[tag=!has_joined] at @s run execute in minecraft:overworld run tp @s 2270.45 -2.00 5.15 -178.95 -3.00
execute as @a[tag=!has_joined] run gamemode adventure @s[tag=!gourd_test]
execute as @a[tag=!has_joined] run tag @s add has_joined
execute as @a[tag=!gg_joined] run tag @s add gg_joined

# White player glow during active game (waves active or cutscene active)
execute if score .global cs.state matches 1.. as @a[gamemode=!spectator] run team join team_white @s
execute if score .global cs.state matches 1.. run effect give @a[gamemode=!spectator] minecraft:glowing 2 0 true
execute if score .wave state matches 1..2 as @a[gamemode=!spectator] run team join team_white @s
execute if score .wave state matches 1..2 run effect give @a[gamemode=!spectator] minecraft:glowing 2 0 true

# Clear glow when in lobby (cutscene state 0 and wave state 0)
execute if score .global cs.state matches 0 unless score .wave state matches 1..2 as @a[team=team_white] run team leave @s
execute if score .global cs.state matches 0 unless score .wave state matches 1..2 as @a run effect clear @s minecraft:glowing

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
