# Cutscene System - Reset
# Resets cutscene state and cleans up entities

scoreboard players set .global cs.state 0
scoreboard players set .global cs.timer 0
function chatbox:reset

# Remove camera & Peeves entities
# Clean NPC glowing
function gourd_guard:npc/glow/off
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# Remove legacy armor stand markers
kill @e[type=armor_stand,tag=cs_npc_node]
kill @e[type=armor_stand,tag=cs_cam_node]
kill @e[type=armor_stand,tag=cs_player_spawn]

# Remove post-effects & restore effects
posteffect remove @a gourd_guard:cutscene_fade
effect clear @a[tag=cs_viewer] minecraft:invisibility

# Remove viewer tag
tag @a remove cs_viewer
