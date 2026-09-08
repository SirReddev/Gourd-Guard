# gourd_guard:npc/archerstand/switch_to_idle
# Transitions from Shoot to Idle animation
tag @s remove gg.archer.state.shoot
tag @s add gg.archer.state.idle
function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive