# Pathfinding - Direction Update + Node Advance (runs every 3 ticks)
# Runs as each active path mob, at the mob's position.
# Finds the mob's current target node, updates facing toward it, advances when close.
#
# Entity iteration happens HERE (not in walk.mcfunction), so it only runs every 3 ticks.

# Cache this mob's route and node for entity selector comparison
scoreboard players operation #route path.cmp = @s path.route
scoreboard players operation #node  path.cmp = @s path.node

# Find and tag the target node (matching route + node index)
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] \
    if score @s path.route = #route path.cmp \
    if score @s path.node  = #node  path.cmp \
    run tag @s add path_target

# No matching node = mob has passed the last node → reached the end
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# Re-orient mob horizontally toward its target (pitch locked to 0 = flat walking)
# This rotation is stored in the mob's NBT and reused by walk.mcfunction each tick
execute at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Advance to next node when mob is within 1.8 blocks
# (threshold is larger than 1.2 to account for the 3-tick check interval —
#  a mob moving 0.15b/tick travels up to 0.45b between checks)
execute at @s if entity @e[tag=path_target,distance=..1.8] \
    run scoreboard players add @s path.node 1

# Clean up the temporary tag
tag @e[tag=path_target] remove path_target
