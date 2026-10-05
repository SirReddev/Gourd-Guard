# Pathfinding - Mob Movement
# Runs as the mob (at its current position)
# path_target must be tagged on the correct node before calling this

# Face the mob horizontally toward the target node (yaw only, pitch forced to 0
# so the mob looks flat/forward instead of up/down when nodes have height differences)
execute at @s facing entity @e[tag=path_target,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Walk forward at 3 blocks/sec (0.15 blocks per tick)
# ^ ^ ^ is local space: left, up, forward — with pitch=0 this is purely horizontal
tp @s ^ ^ ^0.15

# --- Vertical step-up correction ---
# If the mob has clipped into a solid block at foot level after moving, nudge up 1 block
# This handles 1-block steps and stairs along the path
execute at @s unless block ~ ~ ~ air run tp @s ~ ~1 ~

# --- Node advance ---
# Re-anchor position to mob's NEW location after movement, then check proximity
# When mob is within 1.2 blocks of the node, increment to the next node
execute at @s if entity @e[tag=path_target,distance=..1.2] run scoreboard players add @s path.node 1
