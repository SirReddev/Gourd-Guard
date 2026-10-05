# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- NORMAL GROUND MOBS (Zombies, Skeletons, etc.) ---
# Step-Up: If foot is inside a solid block, elevate smoothly onto top of block
execute as @s[tag=!path_flyer,tag=!path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Down: Descend onto lower step ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~ ~ #minecraft:air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~ ~ #minecraft:air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- SPIDERS (Wide Hitbox Specialized Terrain Climbing) ---
# Step-Up: Nudge up immediately by 0.5b so spider never suffocates inside stairs/slabs/blocks
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.5 ~

# Step-Down: Smooth descent onto lower step without clipping edges
execute as @s[tag=path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent for Spiders
execute as @s[tag=path_spider] at @s if block ~ ~ ~ #minecraft:air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=path_spider] at @s if block ~ ~ ~ #minecraft:air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# Anti-Suffocation Protection: Prevent Spider suffocation when intersecting blocks
execute as @s[tag=path_spider] at @s unless block ~ ~0.6 ~ air run effect give @s minecraft:resistance 1 4 true
execute as @s[tag=path_spider,nbt={HurtTime:10s}] at @s unless block ~ ~0.8 ~ air run effect give @s minecraft:instant_health 1 0 true

# --- FLYING MOBS (Phantoms, Blazes, Bats, Vexes, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
# 1. Terrain rises / flyer too low (< 1.0b above ground): smooth glide UP
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ #minecraft:air run tp @s ~ ~0.15 ~

# 2. Terrain drops / flyer too high (> 1.15b above ground): smooth glide DOWN
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ #minecraft:air run tp @s ~ ~-0.15 ~

# 3. Descend onto lower bottom slabs & bottom stairs
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ #minecraft:air if block ~ ~-1.15 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ #minecraft:air if block ~ ~-1.15 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.15 ~
