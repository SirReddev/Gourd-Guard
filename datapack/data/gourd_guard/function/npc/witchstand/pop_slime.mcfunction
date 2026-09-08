# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Cauldron bubbling liquid splash (gravity droplets arcing out)
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^1.05 ^1.20 run particle splash ~ ~ ~ 0.08 0.18 0.08 0.15 8 normal
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.25 ^1.05 ^1.20 run particle splash ~ ~ ~ 0.08 0.18 0.08 0.15 8 normal

# Cauldron popping bubbles
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^1.05 ^1.20 run particle bubble_pop ~ ~ ~ 0.06 0.10 0.06 0.05 4 normal
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.25 ^1.05 ^1.20 run particle bubble_pop ~ ~ ~ 0.06 0.10 0.06 0.05 4 normal

# Green magical witch sparks
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^1.05 ^1.20 run particle happy_villager ~ ~ ~ 0.08 0.12 0.08 0.05 3 normal
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^0.25 ^1.05 ^1.20 run particle happy_villager ~ ~ ~ 0.08 0.12 0.08 0.05 3 normal