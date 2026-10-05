# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# Ensure invulnerability objective exists
scoreboard objectives add path.invuln dummy

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# --- SPIDER WALL-CLIMBING ENGINE (Going UP full blocks) ---
# Start Climbing: When spider hits a full block step-up (ignoring slabs and stairs)
execute as @s[tag=path_spider,tag=!path_spider_climbing] at @s unless block ~ ~0.05 ~ air unless block ~ ~0.05 ~ #minecraft:slabs unless block ~ ~0.05 ~ #minecraft:stairs if block ~ ~1.5 ~ air run tag @s add path_spider_climbing

# Execute Climbing: Ascend smoothly up the wall face (+0.25b) and nudge forward onto the ledge (+0.06b)
execute as @s[tag=path_spider_climbing] at @s run tp @s ^ ^0.25 ^0.06

# Stop Climbing: Once spider is standing firmly on solid ground at the new elevation
execute as @s[tag=path_spider_climbing] at @s if block ~ ~0.05 ~ air unless block ~ ~-0.05 ~ air run tag @s remove path_spider_climbing

# 2. Advance forward in facing direction (normal ground walking when not climbing a full block)
execute as @s[tag=!path_spider_climbing] run tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up for Normal Mobs (Zombies, Skeletons):
execute as @s[tag=!path_flyer,tag=!path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Up for Spiders on Slabs & Stairs ONLY:
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~0.05 ~ #minecraft:slabs run tp @s ~ ~0.5 ~
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air if block ~ ~0.05 ~ #minecraft:stairs run tp @s ~ ~0.5 ~
# Fallback step-up if spider is inside a block (when not climbing)
execute as @s[tag=path_spider,tag=!path_spider_climbing] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.5 ~

# Step-Down: Descend onto lower step ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- SPIDER TRANSITION INVULNERABILITY ---
# Trigger timed invulnerability (15 ticks = 0.75s) whenever spider enters an elevation change or climbs
execute as @s[tag=path_spider] at @s unless block ~ ~0.05 ~ air run scoreboard players set @s path.invuln 15
execute as @s[tag=path_spider] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air run scoreboard players set @s path.invuln 15
execute as @s[tag=path_spider_climbing] run scoreboard players set @s path.invuln 15

# While transition timer is active: keep spider completely invulnerable and clear any hurt state
execute as @s[tag=path_spider,scores={path.invuln=1..}] run data modify entity @s Invulnerable set value 1b
execute as @s[tag=path_spider,scores={path.invuln=1..}] run data modify entity @s HurtTime set value 0s
execute as @s[tag=path_spider,scores={path.invuln=1..}] run effect give @s minecraft:resistance 1 4 true
execute as @s[tag=path_spider,scores={path.invuln=1..}] run scoreboard players remove @s path.invuln 1

# When timer expires (cleared obstacle and back on flat ground): return to normal vulnerable state
execute as @s[tag=path_spider,scores={path.invuln=0},tag=!path_spider_climbing] run data modify entity @s Invulnerable set value 0b

# --- FLYING MOBS (Phantoms, Blazes, Bats, Vexes, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
# 1. Terrain rises / flyer too low (< 1.0b above ground): smooth glide UP
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~

# 2. Terrain drops / flyer too high (> 1.15b above ground): smooth glide DOWN
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~

# 3. Descend onto lower bottom slabs & bottom stairs
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-0.65 ~ air if block ~ ~-1.15 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.15 ~
