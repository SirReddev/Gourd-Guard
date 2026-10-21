# Pathfinding - Per-Mob Movement Step forward
# Runs as each active path mob, oriented towards path_target.

# Pillager Convoy steady armored charge: 0.22b/tick (~4.4 blocks/sec)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.22

# Normal speed movement (not slowed)
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.55
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
execute if entity @s[tag=!gg_slowed,tag=!gg_convoy] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.15

# Slowed speed movement (50% reduction from Cauldron Slowness)
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.27
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.14
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.05
execute if entity @s[tag=gg_slowed,tag=!gg_convoy] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.07

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
# Smooth flight altitude maintenance without vertical jitter or flapping:
execute as @s[tag=path_flyer] at @s unless block ~ ~-0.8 ~ air run tp @s ~ ~0.05 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.6 ~ air run tp @s ~ ~-0.05 ~
