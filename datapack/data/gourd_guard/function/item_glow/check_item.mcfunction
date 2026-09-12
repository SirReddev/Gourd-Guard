# gourd_guard:item_glow/check_item
# Evaluates color tags on a single new item and marks it checked
execute if data entity @s Item.components."minecraft:custom_data".glow_red run function gourd_guard:item_glow/colors/red
execute if data entity @s Item.components."minecraft:custom_data".glow_gold run function gourd_guard:item_glow/colors/gold
execute if data entity @s Item.components."minecraft:custom_data".glow_aqua run function gourd_guard:item_glow/colors/aqua
execute if data entity @s Item.components."minecraft:custom_data".glow_lime run function gourd_guard:item_glow/colors/lime
execute if data entity @s Item.components."minecraft:custom_data".glow_purple run function gourd_guard:item_glow/colors/purple
execute if data entity @s Item.components."minecraft:custom_data".glow_yellow run function gourd_guard:item_glow/colors/yellow
execute if data entity @s Item.components."minecraft:custom_data".glow_blue run function gourd_guard:item_glow/colors/blue
execute if data entity @s Item.components."minecraft:custom_data".glow_green run function gourd_guard:item_glow/colors/green
execute if data entity @s Item.components."minecraft:custom_data".glow_pink run function gourd_guard:item_glow/colors/pink
execute if data entity @s Item.components."minecraft:custom_data".glow_magenta run function gourd_guard:item_glow/colors/magenta
execute if data entity @s Item.components."minecraft:custom_data".glow_orange run function gourd_guard:item_glow/colors/orange
execute if data entity @s Item.components."minecraft:custom_data".glow_cyan run function gourd_guard:item_glow/colors/cyan
execute if data entity @s Item.components."minecraft:custom_data".glow_white run function gourd_guard:item_glow/colors/white
execute if data entity @s Item.components."minecraft:custom_data".glow_black run function gourd_guard:item_glow/colors/black
execute if data entity @s Item.components."minecraft:custom_data".glow_gray run function gourd_guard:item_glow/colors/gray
execute if data entity @s Item.components."minecraft:custom_data".glow_light_gray run function gourd_guard:item_glow/colors/light_gray
execute if data entity @s Item.components."minecraft:custom_data".glow_light_blue run function gourd_guard:item_glow/colors/light_blue
execute if data entity @s Item.components."minecraft:custom_data".glow_brown run function gourd_guard:item_glow/colors/brown

tag @s add glow_checked