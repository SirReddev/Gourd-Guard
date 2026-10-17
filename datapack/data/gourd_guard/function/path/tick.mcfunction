# Pathfinding System - Main Tick

# 0. Ensure a 5x5 chunk area (80x80 blocks) around every path node and pumpkin is force-loaded
#    so distant portals, split branches, and intermediate chunks stay entity-ticking regardless of where players stand.
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5

# 1. Auto-detect any newly spawned mobs with route tags
function gourd_guard:path/mob/auto_init

# 2. Process all active path mobs
execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process

# 3. Apply color-themed glow to all wave mobs
function gourd_guard:wave/mob_glow

