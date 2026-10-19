# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, at the mob's position.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction based on speed tier
# Top-tier sprinters (Baby Zombies, Camo Sprinters): 0.55b/tick (~11.0 blocks/sec)
execute if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.55
# Agile sprinters (Spiders, Swarms, Creepers): 0.28b/tick (~5.6 blocks/sec)
execute if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
# Pillager Convoy high-speed charge: 1.80b/tick (~36.0 blocks/sec)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^1.80
# Heavy Juggernauts & Colossal Bosses: 0.10b/tick (~2.0 blocks/sec)
execute if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
# Standard pace: 0.15b/tick (~3.0 blocks/sec)
execute unless entity @s[tag=gg_fast,tag=gg_runner,tag=gg_slow,tag=gg_convoy] run tp @s ^ ^ ^0.15

# --- TARGET NODE ELEVATION TRACKING FOR CONVOYS (Ravagers charging at 1.8b/tick) ---
# Convoys elevate/descend smoothly towards node altitude so they charge cleanly across bridges and ramps
execute if entity @s[tag=gg_convoy] store result score #mob_y gg.y run data get entity @s Pos[1] 100
execute if entity @s[tag=gg_convoy] store result score #tgt_y gg.y run data get entity @e[tag=path_target,limit=1] Pos[1] 100
execute if entity @s[tag=gg_convoy] run scoreboard players operation #y_diff gg.y = #tgt_y gg.y
execute if entity @s[tag=gg_convoy] run scoreboard players operation #y_diff gg.y -= #mob_y gg.y
execute as @s[tag=gg_convoy] at @s if score #y_diff gg.y matches 15.. run tp @s ~ ~0.50 ~
execute as @s[tag=gg_convoy] at @s if score #y_diff gg.y matches ..-15 unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.50 ~

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Step-Up: Elevate smoothly onto top of block, stair, or slab
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=gg_convoy] at @s unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air run tp @s ~ ~0.40 ~

# Step-Down: Descend onto lower ground ONLY if solid ground exists within 1.2b below (NEVER falls into the void)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.5 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.40 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] run tp @s ~ ~-0.25 ~

# --- FLYING MOBS (Phantoms, Blazes, Guardians, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~
