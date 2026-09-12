# gourd_guard:prop/graveyard/grave3/remove
# Removes the nearest Grave 3 prop within 6 blocks
execute if entity @s[tag=aj.gourdguard_prop_graveyard_grave3.root] run function aj:gourdguard_prop_graveyard_grave3/remove/this
execute unless entity @s[tag=aj.gourdguard_prop_graveyard_grave3.root] as @e[type=item_display,tag=aj.gourdguard_prop_graveyard_grave3.root,distance=..6,limit=1,sort=nearest] run function aj:gourdguard_prop_graveyard_grave3/remove/this