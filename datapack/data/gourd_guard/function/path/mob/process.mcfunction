# Pathfinding - Direction Update + Node Advance (runs every 3 ticks)
# Runs as each active path mob, at the mob's position.

# Cache this mob's route and node for entity selector comparison
scoreboard players operation #route path.cmp = @s path.route
scoreboard players operation #node  path.cmp = @s path.node

# Find and tag the target node (matching route + node index)
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] if score @s path.route = #route path.cmp if score @s path.node = #node path.cmp run tag @s add path_target

# No matching node = mob has passed the last node
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# Re-orient mob horizontally toward its target (pitch 0 = flat walking)
execute at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Advance to next node when within 1.8 blocks (larger threshold for 3-tick interval)
execute at @s if entity @e[tag=path_target,distance=..1.8] run scoreboard players add @s path.node 1

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
