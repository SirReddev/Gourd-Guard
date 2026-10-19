# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction based on speed tier
# Top-tier sprinters (Baby Zombies, Camo Sprinters): 0.55b/tick (~11.0 blocks/sec)
execute if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.55
# Agile sprinters (Spiders, Swarms, Creepers): 0.28b/tick (~5.6 blocks/sec)
execute if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
# Pillager Convoy high-speed charge: 1.20b/tick (~24.0 blocks/sec)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^1.20
# Heavy Juggernauts & Colossal Bosses: 0.10b/tick (~2.0 blocks/sec)
execute if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
# Standard pace: 0.15b/tick (~3.0 blocks/sec)
execute unless entity @s[tag=gg_fast,tag=gg_runner,tag=gg_slow,tag=gg_convoy] run tp @s ^ ^ ^0.15

# --- SLAB, STAIR & SOLID TERRAIN SNAPPING & ANTI-SINK ---
# Snaps entities cleanly to the top surface of slabs/stairs/blocks, preventing sinking or floating.

# A. Bottom Slabs & Bottom Stairs: Snap directly to top surface at Y.50
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~0.50 ~

# B. Rescue from below bottom slab (if sunken into air space under bridge slab)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~0.8 ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air align y run tp @s ~ ~1.50 ~

# C. Solid Blocks & Top Slabs: If sunken inside block Y with air at Y+1, snap to top of block at Y+1.00
execute as @s[tag=!path_flyer] at @s unless block ~ ~ ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] unless block ~ ~ ~ #minecraft:stairs[half=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~1.00 ~

# --- GROUND MOBS (Zombies, Spiders, Skeletons, Convoys, etc.) ---
# Step-Up: Elevate smoothly onto higher block, stair, or slab
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=gg_convoy] at @s unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air run tp @s ~ ~0.40 ~

# Step-Down: Descend onto lower ground / bridge ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.5 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.40 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] align y run tp @s ~ ~-0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] align y run tp @s ~ ~-0.50 ~

# --- FLYING MOBS (Phantoms, Blazes, Guardians, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~
