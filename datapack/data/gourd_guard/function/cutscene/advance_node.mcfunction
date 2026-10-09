# Cutscene System - Advance Node
# Called when Peeves reaches a checkpoint

# 1. Snap Peeves to checkpoint position (+0.6) and apply checkpoint horizontal rotation (pitch 0)
execute as @e[tag=peeves_ghost_root] at @e[tag=cs_target,limit=1] run tp @s ~ ~0.6 ~ ~ 0

# 2. Increment TargetNode
scoreboard players add TargetNode cs.cmp 1

# 3. Retag next target node
tag @e[tag=cs_npc_node] remove cs_target
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node = TargetNode cs.cmp run tag @s add cs_target

# 4. If no next node exists, Peeves reached the final pumpkin checkpoint!
execute unless entity @e[tag=cs_target] run function gourd_guard:cutscene/reach_pumpkin
