# Pathfinding - Ultra-Optimized Per-Tick Walk with Smart Collision
# Runs as each active path mob, every tick.

# 1. Advance forward in current facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 2. Step-Up: If moving into a step or solid block at feet, elevate smoothly onto it
execute at @s unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.2 ~

# 3. Gravity / Step-Down: If in air above ground, descend smoothly to follow stairs/slopes down
execute at @s if block ~ ~-0.05 ~ air if block ~ ~-0.6 ~ air run tp @s ~ ~-0.2 ~
execute at @s if block ~ ~-0.05 ~ air unless block ~ ~-0.6 ~ air run tp @s ~ ~-0.05 ~

# 4. Fall Damage Prevention: Only touch NBT when actually stepping down in air (saves 90%+ NBT write overhead)
execute at @s if block ~ ~-0.05 ~ air run data modify entity @s FallDistance set value 0.0f
