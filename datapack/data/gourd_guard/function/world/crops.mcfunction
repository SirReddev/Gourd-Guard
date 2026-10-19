# gourd_guard:world/crops
# Fast-path early return: If no dropped items exist in the world, skip immediately
execute unless entity @e[type=item] run return 0

# Tag trampled crop items
tag @e[type=item,nbt={Item:{id:"minecraft:wheat"}}] add gg_replant_wheat
tag @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] add gg_replant_wheat
tag @e[type=item,nbt={Item:{id:"minecraft:carrot"}}] add gg_replant_carrot
tag @e[type=item,nbt={Item:{id:"minecraft:potato"}}] add gg_replant_potato
tag @e[type=item,nbt={Item:{id:"minecraft:beetroot"}}] add gg_replant_beetroot
tag @e[type=item,nbt={Item:{id:"minecraft:beetroot_seeds"}}] add gg_replant_beetroot

# Early exit if no crop items were dropped
execute unless entity @e[tag=gg_replant_wheat] unless entity @e[tag=gg_replant_carrot] unless entity @e[tag=gg_replant_potato] unless entity @e[tag=gg_replant_beetroot] run return 0

# Restore farmland & crops
execute at @e[tag=gg_replant_wheat] run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute at @e[tag=gg_replant_wheat] run setblock ~ ~ ~ minecraft:wheat[age=7]
kill @e[tag=gg_replant_wheat]

execute at @e[tag=gg_replant_carrot] run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute at @e[tag=gg_replant_carrot] run setblock ~ ~ ~ minecraft:carrots[age=7]
kill @e[tag=gg_replant_carrot]

execute at @e[tag=gg_replant_potato] run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute at @e[tag=gg_replant_potato] run setblock ~ ~ ~ minecraft:potatoes[age=7]
kill @e[tag=gg_replant_potato]

execute at @e[tag=gg_replant_beetroot] run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute at @e[tag=gg_replant_beetroot] run setblock ~ ~ ~ minecraft:beetroots[age=3]
kill @e[tag=gg_replant_beetroot]
