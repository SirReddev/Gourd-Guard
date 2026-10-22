# Pathfinding - Per-Mob Movement Step forward
# Runs as each active path mob, oriented towards path_target.

# Pillager Convoy steady armored charge: 0.22b/tick
execute if entity @s[tag=gg_convoy] run tp @s ^ ^ ^0.22

# --- NORMAL MOVEMENT (when gg.slow_ticks is 0 or unset) ---
execute unless entity @s[tag=gg_convoy] unless score @s gg.slow_ticks matches 1.. if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.30
execute unless entity @s[tag=gg_convoy] unless score @s gg.slow_ticks matches 1.. if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.28
execute unless entity @s[tag=gg_convoy] unless score @s gg.slow_ticks matches 1.. if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.10
execute unless entity @s[tag=gg_convoy] unless score @s gg.slow_ticks matches 1.. unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.15

# --- SLOWED MOVEMENT: 50% DEFAULT (when gg.slow_ticks >= 1) ---
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. unless score @s gg.slow_pct matches 25 unless score @s gg.slow_pct matches 75 if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.15
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. unless score @s gg.slow_pct matches 25 unless score @s gg.slow_pct matches 75 if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.14
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. unless score @s gg.slow_pct matches 25 unless score @s gg.slow_pct matches 75 if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.05
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. unless score @s gg.slow_pct matches 25 unless score @s gg.slow_pct matches 75 unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.07

# --- SLOWED MOVEMENT: 25% SLOW TIER ---
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 25 if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.22
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 25 if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.21
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 25 if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.08
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 25 unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.11

# --- SLOWED MOVEMENT: 75% SLOW TIER ---
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 75 if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.08
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 75 if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.07
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 75 if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.03
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. if score @s gg.slow_pct matches 75 unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.04

# Visual soul particle trail while slowed
execute unless entity @s[tag=gg_convoy] if score @s gg.slow_ticks matches 1.. run particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

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
