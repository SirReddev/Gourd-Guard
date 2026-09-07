# 1. Initialize newly dropped candies (prevent hotbar pickup & set black glow)
execute as @e[type=item,tag=!gg_candy_init] if data entity @s Item.components."minecraft:custom_data".candy run function gourd_guard:candy/init

# 2. Collect candies when hitting player body (<= 1.2 blocks from player)
execute as @e[type=item,tag=gg_candy] at @s if entity @p[distance=..1.2] run function gourd_guard:candy/collect

# 3. Magnetic pull: Pull smoothly into player body (pickup radius 3.0 blocks)
execute as @e[type=item,tag=gg_candy] at @s if entity @p[distance=1.2..3.0] run function gourd_guard:candy/pull