# Cutscene System - Setup Peeves
# Runs behind quick fade curtain

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Clean up any previous cutscene entities
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# 2. Tag target starting node 0 for current map
tag @e[tag=cs_npc_node] remove cs_start_npc
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 0 run tag @s add cs_start_npc

# 3. Summon Animated Java Peeves Ghost Model (Hovers at node + 0.6 blocks)
execute if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] positioned ~ ~0.6 ~ rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute unless entity @e[tag=cs_start_npc] at @a[tag=cs_viewer,limit=1] positioned ^ ^0.6 ^3 rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}

# Tag root entity across entire world so it is guaranteed tagged
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root] add peeves_ghost_root

# Align Peeves rotation to match Node 0's recorded rotation
execute if entity @e[tag=cs_start_npc] as @e[tag=peeves_ghost_root] at @e[tag=cs_start_npc,limit=1] run tp @s ~ ~0.6 ~ ~ ~

# Play idle animation and protect
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive
execute as @e[tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Invulnerable set value 1b

# 4. Start Dialogue 1 as player regains view
schedule function gourd_guard:cutscene/dialogue_1 15t
