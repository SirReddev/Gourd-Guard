# Cutscene System - Start Movement Phase
# Called automatically when Dialogue 1 finishes

scoreboard players set .global cs.state 2
scoreboard players set TargetNode cs.cmp 1

# Play start_move animation
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/start_move/play_exclusive

# Schedule looping move animation after 11 ticks (duration of start_move)
schedule function gourd_guard:cutscene/play_move_loop 11t
