# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction based on speed tier
# Fast sprinters (e.g. Baby Zombies, Spiders, Swarms): 0.26b/tick (~5.2 blocks/sec)
execute if entity @s[tag=gg_fast] run tp @s ^ ^ ^0.26
# Pillager Convoy high-speed charge: 0.35b/tick (~7.0 blocks/sec)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.35
# Heavy Juggernauts & Colossal Bosses: 0.10b/tick (~2.0 blocks/sec)
execute if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
# Standard pace: 0.15b/tick (~3.0 blocks/sec)
execute unless entity @s[tag=gg_fast,tag=gg_slow,tag=gg_convoy] run tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up: Elevate smoothly onto top of block, stair, or slab
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Down: Descend onto lower step ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- FLYING MOBS (Phantoms, Blazes, Bats, Vexes, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
# 1. Terrain rises / flyer too low (< 1.0b above ground): smooth glide UP
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~

# 2. Terrain drops / flyer too high (> 1.15b above ground): smooth glide DOWN
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~

# 3. Descend onto lower bottom slabs & bottom stairs
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.15 ~
