# Pathfinding - Smooth Per-Tick Walk with Terrain Following & Step Climbing
# Runs as each active path mob, every tick.

# 1. Reset fall distance every tick so mobs never take fall damage on step-downs
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in current facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 3. Single-pass Step-Up: If moving into a step or solid block at feet, elevate smoothly onto it
execute at @s unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.2 ~

# 4. Single-pass Gravity: If in air above ground, descend smoothly to follow stairs/slopes down
execute at @s if block ~ ~-0.05 ~ air if block ~ ~-0.6 ~ air run tp @s ~ ~-0.2 ~
execute at @s if block ~ ~-0.05 ~ air unless block ~ ~-0.6 ~ air run tp @s ~ ~-0.05 ~
