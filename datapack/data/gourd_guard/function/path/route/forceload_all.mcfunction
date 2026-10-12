# Pathfinding - Force-load 5x5 chunk area around ALL existing path nodes, pumpkin, and cutscene markers
# Usage: /function gourd_guard:path/route/forceload_all

# Force-load 5x5 chunk area around all path node chunks (armor stands) and pumpkin objective
execute as @e[tag=aj.gourdguard_pumpkin.root] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=aj.gourdguard_pumpkin.root] run tag @s add gg_forceloaded_5x5
execute as @e[tag=path_node] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=path_node] run tag @s add gg_forceloaded
execute as @e[tag=path_node] run tag @s add gg_forceloaded_5x5

# Force-load all cutscene marker chunks
execute as @e[tag=cs_npc_node] at @s run forceload add ~-16 ~-16 ~16 ~16
execute as @e[tag=cs_npc_node] run tag @s add gg_forceloaded
execute as @e[tag=cs_player_start] at @s run forceload add ~-16 ~-16 ~16 ~16
execute as @e[tag=cs_player_start] run tag @s add gg_forceloaded
execute as @e[tag=cs_player_spawn] at @s run forceload add ~-16 ~-16 ~16 ~16
execute as @e[tag=cs_player_spawn] run tag @s add gg_forceloaded

tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Force-loaded 5x5 chunk areas for all path nodes and cutscene markers!","color":"green"}]

