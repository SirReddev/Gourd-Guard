# Cutscene System - Switch to looping Move animation
execute if score .global cs.state matches 2 as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/move/play_exclusive
