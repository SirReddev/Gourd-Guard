# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- SPIDERS (Wide Hitbox Specialized Terrain Climbing & Descent) ---
# Early Step-Up: Elevate onto top of step BEFORE front edge (0.7b) collides with the wall
execute as @s[tag=path_spider] at @s unless block ^ ^0.2 ^0.75 air if block ^ ^1.2 ^0.75 air run tp @s ~ ~0.5 ~
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.5 ~

# Late Step-Down: Descend onto lower step ONLY AFTER rear edge (^-0.7) has completely cleared the ledge!
execute as @s[tag=path_spider] at @s if block ~ ~-0.05 ~ air if block ^ ^-0.05 ^-0.7 air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent for Spiders: Descend onto bottom slabs and bottom stairs
execute as @s[tag=path_spider] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=path_spider] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- NORMAL GROUND MOBS (Zombies, Skeletons, etc.) ---
# Step-Up: Elevate smoothly when foot enters solid block
execute as @s[tag=!path_flyer,tag=!path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Down: Descend onto lower step when center is over air
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer,tag=!path_spider] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- SPIDER SAFETY NET ---
# Dynamic invulnerability and damage cancellation in case of any sub-pixel boundary clipping
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
