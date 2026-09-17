# gourd_guard:npc/blacksmithstand/remove
# Removes the nearest Blacksmithstand NPC within 6 blocks, or all if executed directly as the root

execute if entity @s[tag=aj.gourdguard_npc_blacksmithstand.root] run function aj:gourdguard_npc_blacksmithstand/remove/this
execute unless entity @s[tag=aj.gourdguard_npc_blacksmithstand.root] as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root,distance=..6,limit=1,sort=nearest] run function aj:gourdguard_npc_blacksmithstand/remove/this