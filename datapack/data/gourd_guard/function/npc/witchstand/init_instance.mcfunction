# gourd_guard:npc/witchstand/init_instance
# Executed as and at the newly summoned witchstand root entity

# Lock pitch to 0 (horizontal orientation only)
tp @s ~ ~ ~ ~ 0

# Tag the witchstand instance
tag @s add gourdguard.npc.witchstand

# Start the idle animation loop
function aj:gourdguard_npc_witchstand/animations/idle/play