# gourd_guard:npc/archerstand/switch_to_shoot
# Transitions from Idle to Shoot animation
tag @s remove gg.archer.state.idle
tag @s add gg.archer.state.shoot
function aj:gourdguard_npc_archerstand/animations/shoot/play_exclusive