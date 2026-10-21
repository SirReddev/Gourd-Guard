# Pathfinding - Per-Mob Movement Step forward
# Runs as each active path mob, oriented towards path_target.

# Decrement slow timer & clear tag on expiration
execute if entity @s[tag=gg_slowed] run scoreboard players remove @s gg.slow_timer 1
execute if entity @s[tag=gg_slowed] if score @s gg.slow_timer matches ..0 run tag @s remove gg_slowed
execute if entity @s[tag=gg_slowed] at @s run particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

# Pillager Convoy high-speed charge (unaffected by mob slowness): 0.45b/tick (~9.0 blocks/sec, prevents waypoint overshooting)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.45

# Normal speed movement (not slowed)
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.55
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] unless entity @s[tag=gg_fast,tag=gg_runner,tag=gg_slow] run tp @s ^ ^ ^0.15

# Slowed speed movement (50% reduction from Cauldron Slowness)
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.27
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.14
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.05
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] unless entity @s[tag=gg_fast,tag=gg_runner,tag=gg_slow] run tp @s ^ ^ ^0.07

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
execute as @s[tag=gg_convoy] at @s unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air run tp @s ~ ~0.25 ~

# Step-Down: Descend onto lower ground / bridge (smooth descent back to surface)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~-1.2 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] align y run tp @s ~ ~-0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] align y run tp @s ~ ~-0.50 ~

# --- FLYING MOBS (Phantoms, Blazes, Guardians, etc.) ---
# Maintain close ~1.0-1.1 block hover above terrain at all times:
execute as @s[tag=path_flyer] at @s unless block ~ ~-1.0 ~ air run tp @s ~ ~0.15 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.15 ~ air run tp @s ~ ~-0.15 ~
