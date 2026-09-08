# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Single green slime droplet bouncing up and arcing out of the cauldron
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^1.05 ^1.20 run particle block slime_block ~ ~ ~ 0.05 0.25 0.05 0.08 3 normal