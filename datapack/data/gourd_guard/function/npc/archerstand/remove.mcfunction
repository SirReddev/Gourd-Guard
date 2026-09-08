# gourd_guard:npc/archerstand/remove
# Removes the nearest Archerstand NPC within 6 blocks, or all if executed directly as the root

execute if entity @s[tag=aj.gourdguard_npc_archerstand.root] run function aj:gourdguard_npc_archerstand/remove/this
execute unless entity @s[tag=aj.gourdguard_npc_archerstand.root] as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root,distance=..6,limit=1,sort=nearest] run function aj:gourdguard_npc_archerstand/remove/this