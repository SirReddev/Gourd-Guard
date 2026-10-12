# Pathfinding - Force-load chunks for ALL existing path nodes and cutscene markers
# Run this ONCE after setting up your map to ensure all marker chunks are always loaded
# Usage: /function gourd_guard:path/route/forceload_all

# Force-load all path node chunks (armor stands)
execute as @e[tag=path_node,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=path_node,tag=!gg_forceloaded] run tag @s add gg_forceloaded

# Force-load all cutscene marker chunks
execute as @e[tag=cs_npc_node,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_npc_node,tag=!gg_forceloaded] run tag @s add gg_forceloaded
execute as @e[tag=cs_player_start,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_player_start,tag=!gg_forceloaded] run tag @s add gg_forceloaded
execute as @e[tag=cs_player_spawn,tag=!gg_forceloaded] at @s run forceload add ~ ~
execute as @e[tag=cs_player_spawn,tag=!gg_forceloaded] run tag @s add gg_forceloaded

tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Force-loaded chunks for all path nodes and cutscene markers!","color":"green"}]
