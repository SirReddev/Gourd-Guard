# Pathfinding - Per-Mob Orientation, Movement, and Node Advance
# Runs as each active path mob, at the mob's position.

# Cache this mob's route and node index
scoreboard players operation MobRoute path.cmp = @s path.route
scoreboard players operation MobNode path.cmp = @s path.node

# Find and tag the target node for this mob
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] if score @s path.route = MobRoute path.cmp if score @s path.node = MobNode path.cmp run tag @s add path_target

# No matching node = mob has passed the last node -> trigger goal reach
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# 1. Re-orient Ground Mobs strictly horizontally (yaw only, pitch locked to 0)
execute as @s[tag=!path_flyer] at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# 2. Re-orient Flying Mobs horizontally towards node (hover engine handles Y)
execute as @s[tag=path_flyer] at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# 3. Execute smooth walk / flight step forward
function gourd_guard:path/mob/walk

# 4. Advance to next node when within range (sharp turns at the node, no early smoothing):
# Ground mobs advance at 0.5 blocks of target node
execute as @s[tag=!path_flyer] at @s if entity @e[tag=path_target,distance=..0.5] run tag @s add path_advance

# Flying mobs advance when within 0.55 blocks horizontally of target node (matching ground mob timing)
execute as @s[tag=path_flyer] at @s positioned ~ ~-1.0 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance
execute as @s[tag=path_flyer] at @s positioned ~ ~-0.5 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance
execute as @s[tag=path_flyer] at @s positioned ~ ~-1.5 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance

# Increment node index if arrived at node
execute as @s[tag=path_advance] run scoreboard players add @s path.node 1
tag @s remove path_advance

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
