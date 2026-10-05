# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up: If foot is inside a solid block, elevate onto top of block (spiders elevate 0.5b swiftly to clear hitboxes)
execute as @s[tag=!path_flyer,tag=!path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.5 ~

# Step-Down: Descend onto lower step ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- SPIDER SUFFOCATION PROTECTION ---
# Spiders have a 1.4-wide hitbox and 0.65 eye height that clip block edges during transitions.
# Dynamic invulnerability protects them ONLY while actively stepping up, descending, or clearing a ledge.
execute as @s[tag=path_spider] run data modify entity @s Invulnerable set value 0b
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider] at @s unless block ^ ^0.3 ^-0.4 air run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider] at @s unless block ^ ^0.3 ^0.4 air run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider] at @s unless block ~ ~0.5 ~ air run data modify entity @s HurtTime set value 0s
execute as @s[tag=path_spider] at @s unless block ^ ^0.3 ^-0.4 air run data modify entity @s HurtTime set value 0s
execute as @s[tag=path_spider] at @s unless block ^ ^0.3 ^0.4 air run data modify entity @s HurtTime set value 0s
execute as @s[tag=path_spider] at @s unless block ~ ~0.5 ~ air run effect give @s minecraft:resistance 1 4 true

# --- FLYING MOBS (Phantoms, Blazes, Bats, Vexes, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
# 1. Terrain rises / flyer too low (< 1.0b above ground): smooth glide UP
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~

# 2. Terrain drops / flyer too high (> 1.15b above ground): smooth glide DOWN
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~

# 3. Descend onto lower bottom slabs & bottom stairs
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.15 ~
