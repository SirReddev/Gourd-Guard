# gourd_guard:npc/archerstand/init
# Initializes the Archer NPC into the Idle state and starts the idle animation
tag @s remove gg.archer.state.shoot
tag @s add gg.archer.state.idle
function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive