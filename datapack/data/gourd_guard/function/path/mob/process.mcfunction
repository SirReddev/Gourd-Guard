# Pathfinding - Direction Update + Node Advance (runs every 3 ticks)
# Runs as each active path mob, at the mob's position.

# Cache this mob's route and node for entity selector comparison
scoreboard players operation MobRoute path.cmp = @s path.route
scoreboard players operation MobNode path.cmp = @s path.node

# Find and tag the target node (matching route + node index)
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] if score @s path.route = MobRoute path.cmp if score @s path.node = MobNode path.cmp run tag @s add path_target

# No matching node = mob has passed the last node -> trigger goal reach
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# Re-orient Ground Mobs strictly horizontally (yaw only, pitch locked to 0)
execute as @s[tag=!path_flyer] at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Re-orient Flying Mobs (Phantoms, Blazes) strictly horizontally towards target node
execute as @s[tag=path_flyer] at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Flying Mob Elevation Tracking: Keep flying mobs at steady 1.8 blocks altitude above the target node
execute as @s[tag=path_flyer] at @s positioned as @e[tag=path_target,limit=1] positioned ~ ~1.6 ~ if entity @s[dy=..-0.3] run tp @s ~ ~0.25 ~
execute as @s[tag=path_flyer] at @s positioned as @e[tag=path_target,limit=1] positioned ~ ~2.2 ~ if entity @s[dy=0.3..] run tp @s ~ ~-0.2 ~

# Advance to next node when in range:
# Ground mobs advance at 1.5 blocks
execute as @s[tag=!path_flyer] at @s if entity @e[tag=path_target,distance=..1.5] run scoreboard players add @s path.node 1

# Flying mobs advance within 3.2 blocks sphere (accounting for vertical flight altitude)
execute as @s[tag=path_flyer] at @s if entity @e[tag=path_target,distance=..3.2] run scoreboard players add @s path.node 1

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
