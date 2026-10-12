# gourd_guard:pumpkin/remove
# Removes the nearest Gourd Guard Pumpkin model within 10 blocks, or self if executed as root

execute if entity @s[tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/remove/this
execute unless entity @s[tag=aj.gourdguard_pumpkin.root] as @e[type=item_display,tag=aj.gourdguard_pumpkin.root,distance=..10,limit=1,sort=nearest] run function aj:gourdguard_pumpkin/remove/this
