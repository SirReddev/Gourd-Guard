# gourd_guard:npc/gravediggerstand/remove
# Removes the nearest Gravediggerstand NPC within 6 blocks, or all if executed directly as the root

execute if entity @s[tag=aj.gourdguard_npc_gravediggerstand.root] run function aj:gourdguard_npc_gravediggerstand/remove/this
execute unless entity @s[tag=aj.gourdguard_npc_gravediggerstand.root] as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root,distance=..6,limit=1,sort=nearest] run function aj:gourdguard_npc_gravediggerstand/remove/this

# Remove nearby interaction entity
kill @e[type=interaction,tag=gg_gravedigger_interaction,distance=..6,limit=1,sort=nearest]