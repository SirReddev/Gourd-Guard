# Cutscene System - Start Movement Phase
# Called automatically when Dialogue 1 finishes

scoreboard players operation TargetMap cs.cmp = .global map
scoreboard players set TargetNode cs.cmp 1

# Tag next target waypoint
tag @e[tag=cs_npc_node] remove cs_target
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_target

# If no more nodes exist, already at destination
execute unless entity @e[tag=cs_target] run function gourd_guard:cutscene/reach_pumpkin

# If node 1 exists, start movement and play Peeves laugh at his position for all players
execute if entity @e[tag=cs_target] run scoreboard players set .global cs.state 2
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s run playsound gourd_guard:npc.peeves.laugh master @a ~ ~ ~ 4 1 1
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/start_move/play_exclusive
execute if entity @e[tag=cs_target] run schedule function gourd_guard:cutscene/play_move_loop 11t
