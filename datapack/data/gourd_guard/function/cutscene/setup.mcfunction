# Cutscene System - Setup Camera, Peeves, and Spectator
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

# 3. Position and summon Cutscene Camera item_display
execute if entity @e[tag=cs_start_cam] at @e[tag=cs_start_cam,limit=1] run summon minecraft:item_display ~ ~ ~ {Tags:["gg_cutscene_cam"],teleport_duration:1,interpolation_duration:1,transformation:{scale:[0f,0f,0f]}}
execute unless entity @e[tag=cs_start_cam] if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] positioned ^ ^2.2 ^-4.5 run summon minecraft:item_display ~ ~ ~ {Tags:["gg_cutscene_cam"],teleport_duration:1,interpolation_duration:1,transformation:{scale:[0f,0f,0f]}}
execute unless entity @e[tag=gg_cutscene_cam] at @p positioned ^ ^2.5 ^-4.5 run summon minecraft:item_display ~ ~ ~ {Tags:["gg_cutscene_cam"],teleport_duration:1,interpolation_duration:1,transformation:{scale:[0f,0f,0f]}}

# 4. Put all players in Spectator and attach to Camera
gamemode spectator @a
spectate @e[tag=gg_cutscene_cam,limit=1] @a

# 5. Summon Peeves invisible hover mount (silverfish)
execute if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] run summon silverfish ~ ~0.5 ~ {NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["peeves_mount","peeves_mount_new"],ActiveEffects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}]}
execute unless entity @e[tag=cs_start_npc] at @e[tag=gg_cutscene_cam,limit=1] positioned ^ ^-1.5 ^4 run summon silverfish ~ ~0.5 ~ {NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["peeves_mount","peeves_mount_new"],ActiveEffects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}]}

scoreboard players operation @e[tag=peeves_mount_new] cs.map = TargetMap cs.cmp
scoreboard players set @e[tag=peeves_mount_new] cs.node 0

# 6. Summon Animated Java Ghost Model and mount onto silverfish
execute at @e[tag=peeves_mount_new,limit=1] run function aj:gourdguard_npc_ghost/summon {animation:"idle"}
ride @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..3,limit=1] mount @e[tag=peeves_mount_new,limit=1]
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..3,limit=1] add peeves_ghost_root
execute as @e[tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Invulnerable set value 1b

tag @e[tag=peeves_mount_new] remove peeves_mount_new

# 7. Turn Camera to look at Peeves
execute as @e[tag=gg_cutscene_cam] at @s facing entity @e[tag=peeves_mount,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# 8. Start Dialogue 1 as view clears
schedule function gourd_guard:cutscene/dialogue_1 25t
