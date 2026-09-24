# gourd_guard:npc/gravediggerstand/summon
# Summons the Gravediggerstand NPC model, locks vertical pitch to 0, and loops the digging animation.

execute rotated ~ 0 run function aj:gourdguard_npc_gravediggerstand/summon {args:{animation:"digging",start_animation:true}}

# Stabilize text display: set vertical billboard and disable interpolation jitter
execute as @e[type=text_display,tag=aj.gourdguard_npc_gravediggerstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}

# Interaction Hitbox for Right-Click dialogue & shop
summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_gravedigger_interaction"]}