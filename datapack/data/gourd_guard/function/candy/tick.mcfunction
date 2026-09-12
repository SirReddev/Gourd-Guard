# 1. Initialize newly dropped candies
execute if entity @e[type=item,tag=!gg_candy_init] as @e[type=item,tag=!gg_candy_init] if data entity @s Item.components."minecraft:custom_data".candy run function gourd_guard:candy/init

# 2. Process active candies (0 cost when no candies on ground)
execute if entity @e[type=item,tag=gg_candy] as @e[type=item,tag=gg_candy] at @s run function gourd_guard:candy/tick_single