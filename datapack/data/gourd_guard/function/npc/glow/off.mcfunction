# gourd_guard:npc/glow/off
# Removes glowing outlines from all village shop NPCs & Peeves when game/waves start

execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.entity] run data modify entity @s Glowing set value 0b
team leave @e[type=item_display,tag=aj.gourdguard_npc_witchstand.entity]

execute as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.entity] run data modify entity @s Glowing set value 0b
team leave @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.entity]

execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.entity] run data modify entity @s Glowing set value 0b
team leave @e[type=item_display,tag=aj.gourdguard_npc_archerstand.entity]

execute as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.entity] run data modify entity @s Glowing set value 0b
team leave @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.entity]

execute as @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity] run data modify entity @s Glowing set value 0b
team leave @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity]
