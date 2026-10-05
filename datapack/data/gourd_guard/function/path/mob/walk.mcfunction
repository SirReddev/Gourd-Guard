# Pathfinding - Smooth Linear 3D Navigation for Ground & Flying Mobs
# Runs as each active path mob, every tick.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance directly forward in 3D facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 3. Ground Collision Safety: If feet clip into a solid block, nudge up smoothly to block surface
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.8 ~ air run tp @s ~ ~0.15 ~
