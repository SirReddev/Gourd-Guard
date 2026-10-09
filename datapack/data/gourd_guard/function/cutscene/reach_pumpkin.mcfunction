# Cutscene System - Reach Pumpkin Objective
# Called when Peeves finishes traveling along all cutscene waypoints

scoreboard players set .global cs.state 3

# Play end_move animation on Peeves
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/end_move/play_exclusive

# Face Peeves towards Camera
execute as @e[tag=peeves_ghost_root] at @s facing entity @e[tag=gg_cutscene_cam,limit=1] eyes run tp @s ~ ~ ~ ~ 0

# Schedule Dialogue 2 after 11 ticks (duration of end_move)
schedule function gourd_guard:cutscene/dialogue_2 11t
