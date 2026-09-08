# gourd_guard:npc/archerstand/summon
# Summons the Archerstand NPC model, locks vertical pitch to 0, and starts the Idle -> Shoot cycle.

execute rotated ~ 0 run function aj:gourdguard_npc_archerstand/summon {args:{animation:"idle",start_animation:true}}

# Stabilize text display: set vertical billboard and disable interpolation jitter
execute as @e[type=text_display,tag=aj.gourdguard_npc_archerstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}

# Initialize in idle state
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root,distance=..2,limit=1,sort=nearest] run tag @s add gg.archer.state.idle