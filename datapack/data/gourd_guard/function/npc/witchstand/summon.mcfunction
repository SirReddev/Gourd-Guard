# gourd_guard:npc/witchstand/summon
# Summons the Witchstand NPC model, locks vertical pitch to 0, and plays idle animation.

execute rotated ~ 0 run function aj:gourdguard_npc_witchstand/summon {args:{animation:"idle",start_animation:true}}

# Stabilize text display: set vertical billboard and disable interpolation jitter
execute as @e[type=text_display,tag=aj.gourdguard_npc_witchstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}

# Interaction Hitbox for Right-Click dialogue & shop
summon minecraft:interaction ~ ~ ~ {width:0.8f,height:1.9f,response:1b,Tags:["gg_npc_interaction","gg_witch_interaction"]}

# Start stirring sound immediately
function gourd_guard:npc/witchstand/play_stir_sound