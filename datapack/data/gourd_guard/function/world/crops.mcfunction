# gourd_guard:world/crops
# Fast, throttled crop trampling protection & auto-replanting

# Run check once every 10 ticks (0.5s) to preserve TPS
scoreboard players add #crop_timer gg.timer 1
execute unless score #crop_timer gg.timer matches 10.. run return 0
scoreboard players set #crop_timer gg.timer 0

# Fast-path early return: If no non-candy dropped items exist in the world, skip immediately
execute unless entity @e[type=item,tag=!gg_candy,tag=!gg_crop_checked] run return 0

# Tag trampled crop items
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:wheat"}}] add gg_replant_wheat
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:wheat_seeds"}}] add gg_replant_wheat
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:carrot"}}] add gg_replant_carrot
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:potato"}}] add gg_replant_potato
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:beetroot"}}] add gg_replant_beetroot
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,nbt={Item:{id:"minecraft:beetroot_seeds"}}] add gg_replant_beetroot

# Mark any remaining unchecked non-crop items so they are never scanned again
tag @e[type=item,tag=!gg_candy,tag=!gg_crop_checked,tag=!gg_replant_wheat,tag=!gg_replant_carrot,tag=!gg_replant_potato,tag=!gg_replant_beetroot] add gg_crop_checked

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
