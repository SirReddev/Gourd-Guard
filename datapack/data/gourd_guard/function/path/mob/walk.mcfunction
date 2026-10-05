# Pathfinding - Ultra-Optimized Per-Tick Walk with Smart Collision & Flying Altitude
# Runs as each active path mob, every tick.

# 1. Advance forward in current facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 2. Ground Mobs: Step-Up & Gravity Descent
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.2 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air if block ~ ~-0.6 ~ air run tp @s ~ ~-0.2 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air unless block ~ ~-0.6 ~ air run tp @s ~ ~-0.05 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air run data modify entity @s FallDistance set value 0.0f

# 3. Flying Mobs (Phantoms, Bats, etc.): Maintain smooth 2.5 - 3.0 block hover altitude
execute as @s[tag=path_flyer] at @s unless block ~ ~-2.5 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-3.2 ~ air run tp @s ~ ~-0.1 ~
execute as @s[tag=path_flyer] at @s run data modify entity @s FallDistance set value 0.0f
