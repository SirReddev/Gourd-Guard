# Ensure color teams exist
execute unless score .init glow_init matches 1 run function gourd_guard:item_glow/setup_teams

# Early exit if no untagged items exist
execute unless entity @e[type=item,tag=!glow_checked] run return 0

# 1-Time evaluation of newly dropped items
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_red run function gourd_guard:item_glow/colors/red
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_gold run function gourd_guard:item_glow/colors/gold
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_aqua run function gourd_guard:item_glow/colors/aqua
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_lime run function gourd_guard:item_glow/colors/lime
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_purple run function gourd_guard:item_glow/colors/purple
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_yellow run function gourd_guard:item_glow/colors/yellow
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_blue run function gourd_guard:item_glow/colors/blue
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_green run function gourd_guard:item_glow/colors/green
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_pink run function gourd_guard:item_glow/colors/pink
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_magenta run function gourd_guard:item_glow/colors/magenta
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_orange run function gourd_guard:item_glow/colors/orange
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_cyan run function gourd_guard:item_glow/colors/cyan
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_white run function gourd_guard:item_glow/colors/white
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_black run function gourd_guard:item_glow/colors/black
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_gray run function gourd_guard:item_glow/colors/gray
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_light_gray run function gourd_guard:item_glow/colors/light_gray
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_light_blue run function gourd_guard:item_glow/colors/light_blue
execute as @e[type=item,tag=!glow_checked] if data entity @s Item.components."minecraft:custom_data".glow_brown run function gourd_guard:item_glow/colors/brown

# Mark any untagged items as checked so they are never processed again (0 lag)
tag @e[type=item,tag=!glow_checked] add glow_checked