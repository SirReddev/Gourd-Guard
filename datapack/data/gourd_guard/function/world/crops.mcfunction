# gourd_guard:world/crops
# Detects and instantly restores trampled crops and destroyed farmland

# 1. Wheat & Wheat Seeds
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat"}}] at @s run setblock ~ ~ ~ minecraft:wheat[age=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] at @s run setblock ~ ~ ~ minecraft:wheat[age=7]

# 2. Carrots
execute as @e[type=item,nbt={Item:{id:"minecraft:carrot"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:carrot"}}] at @s run setblock ~ ~ ~ minecraft:carrots[age=7]

# 3. Potatoes
execute as @e[type=item,nbt={Item:{id:"minecraft:potato"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:potato"}}] at @s run setblock ~ ~ ~ minecraft:potatoes[age=7]

# 4. Beetroot & Beetroot Seeds
execute as @e[type=item,nbt={Item:{id:"minecraft:beetroot"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:beetroot"}}] at @s run setblock ~ ~ ~ minecraft:beetroots[age=3]
execute as @e[type=item,nbt={Item:{id:"minecraft:beetroot_seeds"}}] at @s run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]
execute as @e[type=item,nbt={Item:{id:"minecraft:beetroot_seeds"}}] at @s run setblock ~ ~ ~ minecraft:beetroots[age=3]

# Kill dropped crop items immediately so they never clutter inventory
kill @e[type=item,nbt={Item:{id:"minecraft:wheat"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:carrot"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:potato"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:beetroot"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:beetroot_seeds"}}]
