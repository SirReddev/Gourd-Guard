# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Green slime splash particles popping up out of the potion bottle
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle slime ~ ~ ~ 0.05 0.15 0.05 0.1 8 normal

# Green slime splash particles popping up out of the cauldron
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^0.98 ^1.18 run particle slime ~ ~ ~ 0.08 0.18 0.08 0.15 10 normal

# Water splash droplets with gravity popping out
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.18 ^0.88 ^0.91 run particle splash ~ ~ ~ 0.05 0.12 0.05 0.1 6 normal