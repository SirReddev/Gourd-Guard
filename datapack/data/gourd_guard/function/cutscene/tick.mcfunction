# Cutscene System - Main Tick Loop
# Runs each tick from gourd_guard:tick

# Only run if cutscene is active (states 1..3)
execute unless score .global cs.state matches 1..3 run return 0

# 1. Teleport viewer player to camera each tick (keeps camera locked without spectator mode)
execute if entity @e[tag=gg_cutscene_cam] as @a[tag=cs_viewer] at @e[tag=gg_cutscene_cam,limit=1] run tp @s ~ ~ ~ ~ ~

# 2. Dialogue auto-advance timer during states 1 and 3 (every 70 ticks = 3.5s)
execute if score .global cs.state matches 1 run scoreboard players add .global cs.timer 1
execute if score .global cs.state matches 3 run scoreboard players add .global cs.timer 1

execute if score .global cs.timer matches 70.. as @a[tag=cs_viewer,limit=1] run function chatbox:sequence/on_sneak
execute if score .global cs.timer matches 70.. run scoreboard players set .global cs.timer 0

# 3. Only run movement logic during state 2
execute unless score .global cs.state matches 2 run return 0

scoreboard players operation TargetMap cs.cmp = .global map

# Target current waypoint node for Peeves
tag @e[tag=cs_npc_node] remove cs_target
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_target

# Steer and move Peeves towards waypoint (gliding at +0.6 blocks)
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s facing entity @e[tag=cs_target,limit=1] feet run tp @s ~ ~ ~ ~ 0
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s run tp @s ^ ^ ^0.18

# Camera Tracking: check for custom camera waypoint
tag @e[tag=cs_cam_node] remove cs_cam_target
execute as @e[tag=cs_cam_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_cam_target

# If custom camera node exists: glide camera towards it facing Peeves
execute if entity @e[tag=cs_cam_target] as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=cs_cam_target,limit=1] feet run tp @s ^ ^ ^0.18
execute if entity @e[tag=cs_cam_target] as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=peeves_ghost_root,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# If no custom camera node: automatically tether camera smoothly behind and above Peeves
execute unless entity @e[tag=cs_cam_target] as @e[tag=peeves_ghost_root,limit=1] at @s rotated ~ 0 positioned ^ ^2.2 ^-4.5 facing entity @e[tag=peeves_ghost_root,limit=1] eyes run tp @e[tag=gg_cutscene_cam] ~ ~ ~ ~ ~

# Advance waypoint when Peeves is within 0.8 blocks
execute as @e[tag=peeves_ghost_root] at @s if entity @e[tag=cs_target,distance=..0.8] run scoreboard players add TargetNode cs.cmp 1

# If no more waypoints exist, Peeves has arrived at the Sacred Pumpkin!
execute unless entity @e[tag=cs_target] run function gourd_guard:cutscene/reach_pumpkin
