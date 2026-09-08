# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Green slime chunks bursting up out of the potion bottle (with gravity falling down)
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle item slime_ball ~ ~ ~ 0.06 0.14 0.06 0.1 5 normal

# Green slime chunks bursting up out of the cauldron
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^0.98 ^1.18 run particle item slime_ball ~ ~ ~ 0.08 0.16 0.08 0.12 6 normal

# Slime squish bubble effect
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle slime ~ ~ ~ 0.04 0.05 0.04 0.01 2 normal