# gourd_guard:npc/witchstand/remove
# Removes the nearest Witchstand NPC within 6 blocks, or all if executed directly as the root

execute if entity @s[tag=aj.gourdguard_npc_witchstand.root] run function aj:gourdguard_npc_witchstand/remove/this
execute unless entity @s[tag=aj.gourdguard_npc_witchstand.root] as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root,distance=..6,limit=1,sort=nearest] run function aj:gourdguard_npc_witchstand/remove/this