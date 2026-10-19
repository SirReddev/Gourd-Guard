# Cutscene System - Reset
# Resets cutscene state and cleans up entities

scoreboard players set .global cs.state 0
scoreboard players set .global cs.timer 0
function chatbox:reset
function gourd_guard:fly/disable

# Remove camera & Peeves entities
# Clean NPC glowing
function gourd_guard:npc/glow/off
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# Remove post-effects & restore effects
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black
effect clear @a[tag=cs_viewer] minecraft:invisibility

# Remove viewer tag
tag @a remove cs_viewer
