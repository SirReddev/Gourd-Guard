# Pathfinding System - Main Tick

# 0. Ensure a 5x5 chunk area (80x80 blocks) around every path node and pumpkin is force-loaded
#    so distant portals, split branches, and intermediate chunks stay entity-ticking regardless of where players stand.
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5

# 1. Auto-detect any newly spawned mobs with route tags
function gourd_guard:path/mob/auto_init

# 1.5. Remove path and wave tags from dead mobs so they never glitch or process pathfinding (fast scoreboard check first)
execute as @e[tag=path_mob,scores={gg_hp=..0}] run tag @s remove path_mob
execute as @e[tag=gg_mob,scores={gg_hp=..0}] run tag @s remove gg_mob
execute as @e[tag=path_mob] if data entity @s {Health:0.0f} run tag @s remove path_mob
execute as @e[tag=gg_mob] if data entity @s {Health:0.0f} run tag @s remove gg_mob

# 1.8. Global Slowness Countdown (strictly lasts 5 seconds = 100 ticks max, clears immediately on expiration)
# A. Decrement timer by 1 each tick for all slowed mobs
execute as @e[tag=gg_slowed] run scoreboard players remove @s gg.slow_timer 1

# B. Tag all mobs whose slow timer has expired (<= 0) or who lack an active positive timer (1..1000)
tag @e[tag=gg_slowed,scores={gg.slow_timer=..0}] add gg_slow_expired
execute as @e[tag=gg_slowed] unless score @s gg.slow_timer matches 1..1000 run tag @s add gg_slow_expired

# C. Completely clear slowness from expired mobs: effect clear, tag removal, scoreboard reset
execute as @e[tag=gg_slow_expired] run effect clear @s minecraft:slowness
execute as @e[tag=gg_slow_expired] run tag @s remove gg_slowed
execute as @e[tag=gg_slow_expired] run scoreboard players reset @s gg.slow_timer
tag @e[tag=gg_slow_expired] remove gg_slow_expired

# D. Particle indicator only while actively slowed
execute as @e[tag=gg_slowed] at @s run particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

# 2. Process all active path mobs
execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process

# 3. Apply color-themed glow to all wave mobs
function gourd_guard:wave/mob_glow
