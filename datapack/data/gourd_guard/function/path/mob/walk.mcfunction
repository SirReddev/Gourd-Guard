# Pathfinding - Clean Ground-Planted Walking & Step Engine
# Runs as each active path mob, every tick.

# 1. Reset fall distance so mobs never take fall damage on step-downs
data modify entity @s FallDistance set value 0.0f

# 2. Walk forward horizontally along facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up: If foot is inside a solid block/stair/slab, elevate smoothly onto the top of the block
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Down: If feet are above air (walking down stairs or ledges), descend smoothly to floor
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air if block ~ ~-1.5 ~ air run tp @s ~ ~-0.2 ~

# --- FLYING MOBS (Phantoms, Bats, Vexes) ---
# Hover altitude: Maintain smooth 2.5 blocks hover height above track
execute as @s[tag=path_flyer] at @s unless block ~ ~-2.2 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-3.0 ~ air run tp @s ~ ~-0.1 ~
