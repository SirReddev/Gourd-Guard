# Pathfinding - Per-Mob Movement Step forward
# Runs as each active path mob, oriented towards path_target.

# Pillager Convoy steady armored charge: 0.22b/tick
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.22

# Slowed movement OR normal movement (mutually exclusive)
execute unless entity @s[tag=gg_convoy] if entity @s[tag=gg_slowed] run function gourd_guard:path/mob/move_slowed
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.38
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
execute unless entity @s[tag=gg_convoy] unless entity @s[tag=gg_slowed] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.15

# --- SLAB, STAIR & SOLID TERRAIN SNAPPING ---
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~0.8 ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air align y run tp @s ~ ~1.50 ~
execute as @s[tag=!path_flyer] at @s unless block ~ ~ ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] unless block ~ ~ ~ #minecraft:stairs[half=bottom] if block ~ ~1 ~ air align y run tp @s ~ ~1.00 ~

# --- GROUND MOBS step-up and step-down ---
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s unless block ~ ~-0.1 ~ air unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=gg_convoy] at @s unless block ~ ~-0.1 ~ air unless block ~ ~0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1.8 ~ air run tp @s ~ ~0.25 ~
execute as @s[tag=!path_flyer,tag=!gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=gg_convoy] at @s if block ~ ~-0.05 ~ air unless block ~ ~ ~ #minecraft:slabs[type=bottom] run tp @s ~ ~-0.25 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:slabs[type=bottom] align y run tp @s ~ ~-0.50 ~
execute as @s[tag=!path_flyer] at @s if block ~ ~ ~ air if block ~ ~-0.05 ~ #minecraft:stairs[half=bottom] align y run tp @s ~ ~-0.50 ~

# --- FLYING MOBS altitude maintenance ---
execute as @s[tag=path_flyer] at @s unless block ~ ~-0.8 ~ air run tp @s ~ ~0.05 ~
execute as @s[tag=path_flyer] at @s if block ~ ~-1.6 ~ air run tp @s ~ ~-0.05 ~
