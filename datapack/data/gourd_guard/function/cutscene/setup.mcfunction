# Cutscene System - Setup Peeves & Teleport Player
# Runs at 15t behind solid black curtain

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Clean up any previous cutscene entities
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# 2. Tag target starting node 0 for current map
tag @e[tag=cs_npc_node] remove cs_start_npc
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 0 run tag @s add cs_start_npc

# 3. Teleport player to start place (set via /function gourd_guard:cutscene/node/set_start)
tag @e[tag=cs_player_start] remove cs_target_start
execute as @e[tag=cs_player_start] if score @s cs.map = TargetMap cs.cmp run tag @s add cs_target_start
execute if entity @e[tag=cs_target_start] as @a[tag=cs_viewer] at @e[tag=cs_target_start,limit=1] run tp @s ~ ~ ~ ~ ~

# 4. Summon Animated Java Peeves Ghost Model (Hovers at node + 0.6 blocks)
execute if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] positioned ~ ~0.6 ~ rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute unless entity @e[tag=cs_start_npc] at @a[tag=cs_viewer,limit=1] positioned ^ ^0.6 ^3 rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}

# Tag root entity across entire world so it is guaranteed tagged
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root] add peeves_ghost_root

# Align Peeves rotation to match Node 0's recorded facing (pitch 0)
execute if entity @e[tag=cs_start_npc] as @e[tag=peeves_ghost_root] at @e[tag=cs_start_npc,limit=1] run tp @s ~ ~0.6 ~ ~ 0

# Play idle animation and protect
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive
execute as @e[tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Invulnerable set value 1b

# Make Peeves glow white during cutscene
team join gg_glow_white @e[tag=aj.gourdguard_npc_ghost.entity]
execute as @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Glowing set value 1b

# 5. Fallback teleport if cs_player_start wasn't set (positions player facing Peeves)
execute unless entity @e[tag=cs_target_start] if entity @e[tag=cs_start_npc] as @a[tag=cs_viewer] at @e[tag=cs_start_npc,limit=1] positioned ^ ^ ^-3 rotated ~ 0 run tp @s ~ ~ ~ ~ 0
