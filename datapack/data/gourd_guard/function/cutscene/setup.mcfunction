# Cutscene System - Setup Peeves & Teleport Player
# Runs at 15t behind solid black curtain

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Clean up any previous cutscene entities
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco]
kill @e[tag=gg_peeves_interaction]

# 2. Ensure any legacy cutscene markers without a valid cs.map default to map 1
execute as @e[tag=cs_npc_node] unless score @s cs.map matches 1..5 run scoreboard players set @s cs.map 1
execute as @e[tag=cs_player_start] unless score @s cs.map matches 1..5 run scoreboard players set @s cs.map 1
execute as @e[tag=cs_player_spawn] unless score @s cs.map matches 1..5 run scoreboard players set @s cs.map 1

# 3. Tag target starting node 0 (or fallback to node 1) for current map
tag @e[tag=cs_npc_node] remove cs_start_npc
execute as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 0 run tag @s add cs_start_npc
execute unless entity @e[tag=cs_start_npc] as @e[tag=cs_npc_node] if score @s cs.map = TargetMap cs.cmp if score @s cs.node matches 1 run tag @s add cs_start_npc

# 4. Teleport players (except gourd_test) to start place (cs_player_start -> fallback cs_player_spawn -> fallback cs_start_npc -> fallback Map 1 coords)
tag @e[tag=cs_player_start] remove cs_target_start
tag @e[tag=cs_player_spawn] remove cs_target_start
execute as @e[tag=cs_player_start] if score @s cs.map = TargetMap cs.cmp run tag @s add cs_target_start
execute unless entity @e[tag=cs_target_start] as @e[tag=cs_player_spawn] if score @s cs.map = TargetMap cs.cmp run tag @s add cs_target_start
execute if entity @e[tag=cs_target_start] as @a[tag=cs_viewer,tag=!gourd_test] at @e[tag=cs_target_start,limit=1] run tp @s ~ ~ ~ ~ ~
execute unless entity @e[tag=cs_target_start] if entity @e[tag=cs_start_npc] as @a[tag=cs_viewer,tag=!gourd_test] at @e[tag=cs_start_npc,limit=1] positioned ^ ^ ^-3 rotated ~ 0 run tp @s ~ ~ ~ ~ 0
execute unless entity @e[tag=cs_target_start] unless entity @e[tag=cs_start_npc] if score TargetMap cs.cmp matches 1 as @a[tag=cs_viewer,tag=!gourd_test] in minecraft:overworld run tp @s 2500.5 -5.0 0.5 0 0

# 5. Summon Animated Java Peeves Ghost Model (Hovers at node + 0.6 blocks)
execute if entity @e[tag=cs_start_npc] at @e[tag=cs_start_npc,limit=1] positioned ~ ~0.6 ~ rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute unless entity @e[tag=cs_start_npc] if score TargetMap cs.cmp matches 1 in minecraft:overworld positioned 2500.5 -4.4 3.5 rotated 180 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute unless entity @e[tag=cs_start_npc] unless score TargetMap cs.cmp matches 1 at @a[tag=cs_viewer,limit=1] positioned ^ ^0.6 ^3 rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}

# Tag root entity across entire world so it is guaranteed tagged (excluding decorative Peeves)
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,tag=!gg_npc_deco] add peeves_ghost_root

# Align Peeves rotation to match Node 0's recorded facing (pitch 0)
execute if entity @e[tag=cs_start_npc] as @e[tag=peeves_ghost_root] at @e[tag=cs_start_npc,limit=1] run tp @s ~ ~0.6 ~ ~ 0

# Play idle animation and protect
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive
execute as @e[tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco] run data modify entity @s Invulnerable set value 1b

# Make Peeves glow white during cutscene
team join gg_glow_white @e[tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

# 6. Play transition sound right after the player is teleported so it isn't cut off by distance
execute as @a[tag=cs_viewer] at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 0.25 1
