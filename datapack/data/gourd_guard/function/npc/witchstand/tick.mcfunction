# gourd_guard:npc/witchstand/tick
# Runs every tick - produces flame and smoke effects shooting out of the potion/cauldron

# Fire and flame sparks
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle flame ~ ~ ~ 0.03 0.08 0.03 0.02 1 normal

# Subtle smoke puffs
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle smoke ~ ~ ~ 0.02 0.04 0.02 0.01 1 normal

# Occasional purple witch sparkles
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.92 ^0.91 run particle witch ~ ~ ~ 0.04 0.04 0.04 0.01 1 normal