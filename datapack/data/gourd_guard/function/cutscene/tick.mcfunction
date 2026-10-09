# Cutscene System - Main Tick Loop
# Runs each tick from gourd_guard:tick

# Dialogue auto-advance timer during states 1 and 3 (every 70 ticks = 3.5s)
execute if score .global cs.state matches 1 run scoreboard players add .global cs.timer 1
execute if score .global cs.state matches 3 run scoreboard players add .global cs.timer 1

execute if score .global cs.timer matches 70.. as @a[tag=cs_viewer,limit=1] run function chatbox:sequence/on_sneak
execute if score .global cs.timer matches 70.. run scoreboard players set .global cs.timer 0

# Only run movement logic during state 2
execute unless score .global cs.state matches 2 run return 0

# Steer and move Peeves towards waypoint (gliding at +0.6 blocks)
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s facing entity @e[tag=cs_target,limit=1] feet run tp @s ~ ~ ~ ~ 0
execute if entity @e[tag=cs_target] as @e[tag=peeves_ghost_root] at @s run tp @s ^ ^ ^0.18

# Advance waypoint when Peeves is within 0.8 blocks of current target
execute as @e[tag=peeves_ghost_root] at @s if entity @e[tag=cs_target,distance=..0.8] run function gourd_guard:cutscene/advance_node
