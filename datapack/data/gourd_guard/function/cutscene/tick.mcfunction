# Cutscene System - Main Tick Loop
# Runs each tick from gourd_guard:tick

# Only run movement logic during state 2
execute unless score .global cs.state matches 2 run return 0

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Target current waypoint node for Peeves
tag @e[tag=cs_npc_node] remove cs_target
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_target

# 2. Steer and move Peeves towards waypoint
execute if entity @e[tag=cs_target] as @e[tag=peeves_mount] at @s facing entity @e[tag=cs_target,limit=1] feet run tp @s ~ ~ ~ ~ 0
execute if entity @e[tag=cs_target] as @e[tag=peeves_mount] at @s run tp @s ^ ^ ^0.18

# 3. Camera Tracking
# Check for custom camera waypoint
tag @e[tag=cs_cam_node] remove cs_cam_target
execute as @e[tag=cs_cam_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_cam_target

# If custom camera node exists: glide camera along it facing Peeves
execute if entity @e[tag=cs_cam_target] as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=cs_cam_target,limit=1] eyes run tp @s ^ ^ ^0.18
execute if entity @e[tag=cs_cam_target] as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=peeves_mount,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# If no custom camera node: automatically tether camera smoothly behind and above Peeves
execute unless entity @e[tag=cs_cam_target] as @e[tag=peeves_mount,limit=1] at @s rotated ~ 0 positioned ^ ^2.2 ^-4.5 run tp @e[tag=gg_cutscene_cam] ~ ~ ~ ~ 10

# 4. Advance waypoint when within 0.6 blocks
execute as @e[tag=peeves_mount] at @s if entity @e[tag=cs_target,distance=..0.6] run scoreboard players add TargetNode cs.cmp 1

# 5. If no more waypoints exist, Peeves has arrived at the Sacred Pumpkin!
execute unless entity @e[tag=cs_target] run function gourd_guard:cutscene/reach_pumpkin
