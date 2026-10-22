# Pathfinding - Per-Mob Movement Step forward
# Runs as each active path mob, oriented towards path_target.

# Pillager Convoy steady armored charge: 0.22b/tick (always constant speed)
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.22

# 1. Slowness Timer Countdown & Expiration (runs per mob every step forward)
execute if entity @s[tag=gg_slowed] run scoreboard players remove @s gg.slow_timer 1
execute if entity @s[tag=gg_slowed] if score @s gg.slow_timer matches ..0 run tag @s remove gg_slowed
execute if entity @s[tag=gg_slow_50] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_50
execute if entity @s[tag=gg_slow_25] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_25
execute if entity @s[tag=gg_slow_75] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_75
execute unless entity @s[tag=gg_slowed] run effect clear @s minecraft:slowness
execute unless entity @s[tag=gg_slowed] run scoreboard players reset @s gg.slow_timer

# 2. Slowness Re-slow Immunity Cooldown (prevents infinite re-slow while passing cauldron)
execute if entity @s[tag=gg_slow_immune] run scoreboard players remove @s gg.slow_immune_timer 1
execute if entity @s[tag=gg_slow_immune] if score @s gg.slow_immune_timer matches ..0 run tag @s remove gg_slow_immune
execute if entity @s[tag=gg_slow_immune] if score @s gg.slow_immune_timer matches ..0 run scoreboard players reset @s gg.slow_immune_timer

# 3. Convoy Ram Hit Cooldown (damages each mob once per encounter)
execute if score @s gg.ram_cd matches 1.. run scoreboard players remove @s gg.ram_cd 1
execute if score @s gg.ram_cd matches ..0 if entity @s[tag=gg_rammed] run tag @s remove gg_rammed

# 4. Slowed movement (active while mob has gg_slowed tag)
execute unless entity @s[tag=gg_convoy] if entity @s[tag=gg_slowed] run function gourd_guard:path/mob/move_slowed

# 5. Normal uninhibited mob movement (default for all mobs without gg_slowed)
# Sprinters tuned to 0.38b/tick (slower and more balanced than 0.55)
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.38
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.15

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
# Step-Up: Elevate smoothly onto higher block, stair, or slab (only when ground is underneath; NEVER when floating!)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s unless block ~ ~-0.1 ~ air unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=gg_convoy] at @s unless block ~ ~-0.1 ~ air unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air run tp @s ~ ~0.25 ~

# Step-Down: Descend onto lower ground / bridge (smooth descent back to surface, no distance ceiling so floating mobs fall back down)
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~

# Slab & Stair Descent: Descend onto bottom slabs and bottom stairs (prevents floating 0.5b above half-down slabs)
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] align y run tp @s ~ ~-0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] align y run tp @s ~ ~-0.50 ~

# --- FLYING MOBS (Phantoms, Blazes, Guardians, etc.) ---
# Smooth flight altitude maintenance without vertical jitter or flapping:
execute as @s[tag=path_flyer] at @s unless block ~ ~-0.8 ~ air run tp @s ~ ~0.05 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.6 ~ air run tp @s ~ ~-0.05 ~
