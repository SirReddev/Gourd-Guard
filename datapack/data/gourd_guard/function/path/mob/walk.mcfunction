# Pathfinding - Smooth Per-Tick Walk with Terrain Following & Step Climbing
# Runs as each active path mob, every tick.

# 1. Reset fall distance every tick to completely prevent fall damage on step-downs
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in current facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 3. Predictive Step-Up: Check ahead (center + wide offsets for Spiders/large hitboxes)
execute at @s positioned ^ ^ ^0.3 unless block ~ ~0.05 ~ air if block ~ ~1.0 ~ air run tp @s ~ ~0.35 ~
execute at @s positioned ^0.4 ^ ^0.2 unless block ~ ~0.05 ~ air if block ~ ~1.0 ~ air run tp @s ~ ~0.35 ~
execute at @s positioned ^-0.4 ^ ^0.2 unless block ~ ~0.05 ~ air if block ~ ~1.0 ~ air run tp @s ~ ~0.35 ~

# 4. Ground Collision: If intersecting a block at foot/body level, push up smoothly to prevent suffocation
execute at @s unless block ~ ~0.1 ~ air if block ~ ~1.0 ~ air run tp @s ~ ~0.25 ~

# 5. Gravity / Step-Down: If floating above ground, descend smoothly to follow slopes and stairs down
execute at @s if block ~ ~-0.05 ~ air if block ~ ~-0.5 ~ air run tp @s ~ ~-0.25 ~
execute at @s if block ~ ~-0.05 ~ air unless block ~ ~-0.5 ~ air run tp @s ~ ~-0.08 ~
