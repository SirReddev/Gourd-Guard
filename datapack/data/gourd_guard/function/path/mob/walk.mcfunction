# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# Ensure invulnerability objective exists
scoreboard objectives add path.invuln dummy

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up: If foot is inside a solid block, elevate onto top of block (spiders elevate 0.5b swiftly)
execute as @s[tag=!path_flyer,tag=!path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.5 ~

# Step-Down: Descend onto lower step ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- SPIDER TRANSITION INVULNERABILITY ---
# Trigger timed invulnerability (15 ticks = 0.75s) whenever spider enters an elevation change
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air run scoreboard players set @s path.invuln 15
execute as @s[tag=path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run scoreboard players set @s path.invuln 15

# While transition timer is active: keep spider completely invulnerable and clear any hurt state
execute as @s[tag=path_spider,scores={path.invuln=1..}] run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider,scores={path.invuln=1..}] run data modify entity @s HurtTime set value 0s
execute as @s[tag=path_spider,scores={path.invuln=1..}] run effect give @s minecraft:resistance 1 4 true
execute as @s[tag=path_spider,scores={path.invuln=1..}] run scoreboard players remove @s path.invuln 1

# When timer expires (cleared obstacle and back on flat ground): return to normal vulnerable state
execute as @s[tag=path_spider,scores={path.invuln=0}] run data modify entity @s Invulnerable set value 0b

# --- FLYING MOBS (Phantoms, Blazes, Bats, Vexes, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
# 1. Terrain rises / flyer too low (< 1.0b above ground): smooth glide UP
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~

# 2. Terrain drops / flyer too high (> 1.15b above ground): smooth glide DOWN
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~

# 3. Descend onto lower bottom slabs & bottom stairs
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.15 ~
