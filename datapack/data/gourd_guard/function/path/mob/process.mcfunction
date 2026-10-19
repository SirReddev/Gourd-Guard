# Pathfinding - Per-Mob Orientation, Movement, and Node Advance
# Runs as each active path mob, at the mob's position.

# Safety default if path.map or path.branch is unset
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.option dummy
execute unless score @s path.map matches 1.. run scoreboard players set @s path.map 1
execute unless score @s path.branch matches 0..23 run scoreboard players set @s path.branch 0
execute unless score @s path.option matches 1..2 run scoreboard players set @s path.option 1

# Cache this mob's map, route, branch and node index
scoreboard players operation MobMap path.cmp = @s path.map
scoreboard players operation MobRoute path.cmp = @s path.route
scoreboard players operation MobBranch path.cmp = @s path.branch
scoreboard players operation MobNode path.cmp = @s path.node

# Find and tag the target node for this mob
tag @e[tag=path_node] remove path_target
execute as @e[tag=path_node] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = MobBranch path.cmp if score @s path.node = MobNode path.cmp run tag @s add path_target

# If no matching node in current section, transition to Split Option (1 or 2) or Common End (3)
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/resolve_next_branch

# No matching node after branch transitions = mob has passed the final node -> trigger goal reach
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/on_reach_end
execute unless entity @e[tag=path_target] run return 0

# 1. Re-orient Mobs horizontally towards target node (yaw only, pitch locked to 0)
execute at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# 3. Execute smooth walk / flight step forward
function gourd_guard:path/mob/walk

# 4. Advance to next node when within range (sharp turns at the node, no early smoothing):
# Fast sprinters advance at 1.2 / 1.5 blocks, standard ground mobs at 1.2 blocks, convoys at 3.2 blocks
execute as @s[tag=!path_flyer,tag=!gg_convoy,tag=!gg_fast,tag=!gg_runner] at @s if entity @e[tag=path_target,distance=..1.2] run tag @s add path_advance
execute as @s[tag=gg_fast,tag=!path_flyer,tag=!gg_convoy,tag=!gg_runner] at @s if entity @e[tag=path_target,distance=..1.2] run tag @s add path_advance
execute as @s[tag=gg_runner,tag=!path_flyer,tag=!gg_convoy] at @s if entity @e[tag=path_target,distance=..1.5] run tag @s add path_advance
execute as @s[tag=gg_convoy] at @s if entity @e[tag=path_target,distance=..1.5] run tag @s add path_advance

# Flying mobs advance when within 0.55 blocks horizontally of target node (matching ground mob timing)
execute as @s[tag=path_flyer] at @s positioned ~ ~-1.0 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance
execute as @s[tag=path_flyer] at @s positioned ~ ~-0.5 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance
execute as @s[tag=path_flyer] at @s positioned ~ ~-1.5 ~ if entity @e[tag=path_target,distance=..0.55] run tag @s add path_advance

# Increment node index if arrived at node
execute as @s[tag=path_advance] run scoreboard players add @s path.node 1
tag @s remove path_advance

# Clean up temporary tag
tag @e[tag=path_target] remove path_target
