# Cutscene System - Finish Transition & Enable Dialogue Hitbox
# Called after Dialogue 2 at the Sacred Pumpkin

# Ensure Peeves remains at Pumpkin in looping Idle and upright (pitch 0)
execute as @e[tag=peeves_ghost_root] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive

# Summon talk interaction hitbox on Peeves
kill @e[tag=gg_peeves_interaction]
execute at @e[tag=peeves_ghost_root,limit=1] run summon minecraft:interaction ~ ~-0.5 ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_peeves_interaction"]}

# Cutscene state 4 (Waiting for player to talk to Peeves & start waves)
scoreboard players set .global cs.state 4

# Clear fade and ensure session released
posteffect remove @a gourd_guard:cutscene_fade
execute as @a[tag=cs_viewer] run function chatbox:session/release

# Enable themed glowing on all village NPCs during grace period
function gourd_guard:npc/glow/on
