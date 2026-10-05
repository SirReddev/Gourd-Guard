# Pathfinding - Per-Mob Processing
# Runs as each active path mob, at the mob's position
# Finds the mob's current target node, moves toward it, advances when close

# Cache this mob's route and node index for node comparison
scoreboard players operation #route path.cmp = @s path.route
scoreboard players operation #node  path.cmp = @s path.node

# Find and tag the target node (armor stand matching this mob's route + node index)
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] \
    if score @s path.route = #route path.cmp \
    if score @s path.node  = #node  path.cmp \
    run tag @s add path_target

# No matching node found = mob has passed the last node → reached the end
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# Move the mob toward its target node
function gourd_guard:path/mob/move

# Clean up the temporary tag
tag @e[tag=path_target] remove path_target
