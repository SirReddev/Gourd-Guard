# Cutscene System - Setup Camera and Peeves
# Runs behind black curtain

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Clean up any previous cutscene entities
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# 2. Tag target starting nodes for current map
tag @e[tag=cs_cam_node] remove cs_start_cam
tag @e[tag=cs_npc_node] remove cs_start_npc
execute as @e[tag=cs_cam_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 0 run tag @s add cs_start_cam
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 0 run tag @s add cs_start_npc

# 3. Summon Animated Java Peeves Ghost Model (Hovers at node + 0.6 blocks)
execute if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] positioned ~ ~0.6 ~ rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute unless entity @e[tag=cs_start_npc] at @a[tag=cs_viewer,limit=1] positioned ^ ^1.5 ^4 rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}

tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..4,limit=1] add peeves_ghost_root
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive
execute as @e[tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Invulnerable set value 1b

# 4. Position and summon Cutscene Camera
execute if entity @e[tag=cs_start_cam] at @e[tag=cs_start_cam,limit=1] run summon minecraft:item_display ~ ~ ~ {Tags:["gg_cutscene_cam"],teleport_duration:1,interpolation_duration:1,transformation:{scale:[0f,0f,0f]}}
execute unless entity @e[tag=cs_start_cam] if entity @e[tag=peeves_ghost_root] at @e[tag=peeves_ghost_root,limit=1] positioned ^ ^1.6 ^-3.5 run summon minecraft:item_display ~ ~ ~ {Tags:["gg_cutscene_cam"],teleport_duration:1,interpolation_duration:1,transformation:{scale:[0f,0f,0f]}}

# 5. Face Camera towards Peeves' eyes
execute as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=peeves_ghost_root,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# 6. Keep viewer in Adventure Mode with Invisibility, and teleport to camera
gamemode adventure @a[tag=cs_viewer]
effect give @a[tag=cs_viewer] minecraft:invisibility 300 0 true
execute as @a[tag=cs_viewer] at @e[tag=gg_cutscene_cam,limit=1] run tp @s ~ ~ ~ ~ ~

# 7. Start Dialogue 1 as view clears
schedule function gourd_guard:cutscene/dialogue_1 20t
