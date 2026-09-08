# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime aj.i 0

# Shoot a slime droplet up and out toward the side of the cauldron
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.24 ^0.98 ^1.18 run particle item slime_ball ~ ~ ~ -0.08 0.22 -0.06 0.15 0 normal

# Soft slime squish / splash at the rim
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.24 ^0.98 ^1.18 run particle item slime_ball ~ ~ ~ 0.02 0.05 0.02 0.05 2 normal