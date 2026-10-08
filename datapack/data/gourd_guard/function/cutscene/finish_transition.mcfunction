# Cutscene System - Finish Transition & Restore Players
# Runs behind black curtain

scoreboard players operation TargetMap cs.cmp = .global map

# 1. Teleport players to map spawn point (or in front of Peeves)
tag @e[tag=cs_player_spawn] remove cs_spawn_target
execute as @e[tag=cs_player_spawn] if score @s cs.map = TargetMap cs.cmp run tag @s add cs_spawn_target

execute if entity @e[tag=cs_spawn_target] at @e[tag=cs_spawn_target,limit=1] run tp @a ~ ~ ~ ~ ~
execute unless entity @e[tag=cs_spawn_target] at @e[tag=peeves_mount,limit=1] positioned ^ ^ ^-3.5 facing entity @e[tag=peeves_mount,limit=1] eyes run tp @a ~ ~ ~ ~ 0

# 2. Restore players out of Spectator Mode
spectate @s @a
gamemode adventure @a

# 3. Clean up cutscene camera
kill @e[tag=gg_cutscene_cam]

# 4. Ensure Peeves remains at Pumpkin in looping Idle
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive

# 5. Summon talk interaction hitbox on Peeves
kill @e[tag=gg_peeves_interaction]
execute at @e[tag=peeves_mount,limit=1] run summon minecraft:interaction ~ ~-0.5 ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_peeves_interaction"]}

# 6. Cutscene state 4 (Waiting for player to talk to Peeves & start waves)
scoreboard players set .global cs.state 4

# 7. Schedule posteffect cleanup
schedule function gourd_guard:cutscene/clear_posteffect 40t
