# Cutscene System - Main Tick Loop
# Runs each tick from gourd_guard:tick

# Only run movement logic during state 2 (walking phase)
execute unless score .global cs.state matches 2 run return 0

# Steer and move Peeves towards waypoint (gliding at +0.6 blocks, pitch 0)
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s facing entity @e[tag=cs_target,limit=1] feet rotated ~ 0 run tp @s ^ ^ ^0.18 ~ 0

# Advance waypoint when Peeves is within 1.3 blocks of current target
execute as @e[tag=peeves_ghost_root] at @s if entity @e[tag=cs_target,distance=..1.3] run function gourd_guard:cutscene/advance_node
