# Pathfinding - Smooth Per-Tick Walk with Terrain Following & Step Climbing
# Runs as each active path mob, every tick.

# 1. Advance forward in current facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 2. Predictive Step-Up: Look ahead 0.25 blocks for obstacles/steps/slabs
execute at @s positioned ^ ^ ^0.25 unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.35 ~

# 3. Ground Collision: If inside a block at foot level, push up smoothly
execute at @s unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.2 ~

# 4. Gravity / Step-Down: If floating above ground, descend smoothly to follow slopes and stairs down
execute at @s if block ~ ~-0.05 ~ air if block ~ ~-0.5 ~ air run tp @s ~ ~-0.25 ~
execute at @s if block ~ ~-0.05 ~ air unless block ~ ~-0.5 ~ air run tp @s ~ ~-0.08 ~
