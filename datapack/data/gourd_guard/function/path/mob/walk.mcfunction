# Pathfinding - Direct Step & Terrain Navigation
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never take fall damage
data modify entity @s FallDistance set value 0.0f

# 2. Walk forward horizontally along facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# 3. Ground Mobs: Step-Up onto solid block / stair / slab
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# 4. Ground Mobs: Step-Down (gravity) if in air above lower floor
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air run tp @s ~ ~-0.25 ~
