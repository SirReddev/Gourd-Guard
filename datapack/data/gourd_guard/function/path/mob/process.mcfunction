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

# 2. Re-orient Flying Mobs (Phantoms, Blazes, etc.) towards node eye-level in true 3D
execute as @s[tag=path_flyer] at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# 3. Execute smooth walk / flight step forward
function gourd_guard:path/mob/walk

# 4. Advance to next node when within range:
# Ground mobs advance at 0.5 blocks of target node
execute as @s[tag=!path_flyer] at @s if entity @e[tag=path_target,distance=..0.5] run scoreboard players add @s path.node 1

# Flying mobs advance when within 2.2 blocks of the ground node (equals 0.8b horizontal radius at 1.8b flight height)
execute as @s[tag=path_flyer] at @s if entity @e[tag=path_target,distance=..2.2] run scoreboard players add @s path.node 1

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
