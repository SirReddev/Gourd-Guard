# Cutscene System - Main Tick Loop
# Runs each tick from gourd_guard:tick

# Keep chunks with cutscene markers and path nodes force-loaded so starting from outside the map (lobby) always finds them
execute as @e[tag=cs_player_start,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_player_start,tag=!gg_forceloaded] run tag @s add gg_forceloaded
execute as @e[tag=cs_npc_node,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_npc_node,tag=!gg_forceloaded] run tag @s add gg_forceloaded
execute as @e[tag=cs_player_spawn,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_player_spawn,tag=!gg_forceloaded] run tag @s add gg_forceloaded
execute as @e[tag=path_node,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=path_node,tag=!gg_forceloaded] run tag @s add gg_forceloaded

# Only run movement logic during state 2 (walking phase)
execute unless score .global cs.state matches 2 run return 0

# Steer and fly Peeves in 3D towards waypoint (+0.6 hover offset), keeping model pitch level (0)
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s positioned ~ ~-0.6 ~ facing entity @e[tag=cs_target,limit=1] feet positioned ~ ~0.6 ~ positioned ^ ^ ^0.18 run tp @s ~ ~ ~ ~ 0

# Advance waypoint when Peeves is within 0.35 blocks in 3D of current target (+0.6 hover offset)
execute as @e[tag=peeves_ghost_root] at @s positioned ~ ~-0.6 ~ if entity @e[tag=cs_target,distance=..0.35] run function gourd_guard:cutscene/advance_node
