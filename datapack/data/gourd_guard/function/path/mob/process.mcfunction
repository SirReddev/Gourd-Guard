# Pathfinding - Direction Update + Node Advance (runs every 3 ticks)
# Runs as each active path mob, at the mob's position.

scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy

# Cache this mob's route and node for entity selector comparison
scoreboard players operation MobRoute path.cmp = @s path.route
scoreboard players operation MobNode path.cmp = @s path.node

# Find and tag the target node (matching route + node index)
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] if score @s path.route = MobRoute path.cmp if score @s path.node = MobNode path.cmp run tag @s add path_target

# No matching node = mob has passed the last node -> trigger goal reach
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# Re-orient mob towards its target node (including natural 3D elevation pitch)
execute at @s facing entity @e[tag=path_target,limit=1] feet run tp @s ~ ~ ~ ~ ~

# Advance to next node when within 0.7 blocks (sharp, exact waypoint turning)
execute at @s if entity @e[tag=path_target,distance=..0.7] run scoreboard players add @s path.node 1

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
