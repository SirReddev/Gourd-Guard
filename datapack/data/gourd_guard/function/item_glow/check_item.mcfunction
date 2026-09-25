# gourd_guard:item_glow/check_item
# Evaluates color tags on a single new item and marks it checked
execute if items entity @s contents *[custom_data~{glow_red:1}] run function gourd_guard:item_glow/colors/red
execute if items entity @s contents *[custom_data~{glow_gold:1}] run function gourd_guard:item_glow/colors/gold
execute if items entity @s contents *[custom_data~{glow_aqua:1}] run function gourd_guard:item_glow/colors/aqua
execute if items entity @s contents *[custom_data~{glow_lime:1}] run function gourd_guard:item_glow/colors/lime
execute if items entity @s contents *[custom_data~{glow_purple:1}] run function gourd_guard:item_glow/colors/purple
execute if items entity @s contents *[custom_data~{glow_yellow:1}] run function gourd_guard:item_glow/colors/yellow
execute if items entity @s contents *[custom_data~{glow_blue:1}] run function gourd_guard:item_glow/colors/blue
execute if items entity @s contents *[custom_data~{glow_green:1}] run function gourd_guard:item_glow/colors/green
execute if items entity @s contents *[custom_data~{glow_pink:1}] run function gourd_guard:item_glow/colors/pink
execute if items entity @s contents *[custom_data~{glow_magenta:1}] run function gourd_guard:item_glow/colors/magenta
execute if items entity @s contents *[custom_data~{glow_orange:1}] run function gourd_guard:item_glow/colors/orange
execute if items entity @s contents *[custom_data~{glow_cyan:1}] run function gourd_guard:item_glow/colors/cyan
execute if items entity @s contents *[custom_data~{glow_white:1}] run function gourd_guard:item_glow/colors/white
execute if items entity @s contents *[custom_data~{glow_black:1}] run function gourd_guard:item_glow/colors/black
execute if items entity @s contents *[custom_data~{glow_gray:1}] run function gourd_guard:item_glow/colors/gray
execute if items entity @s contents *[custom_data~{glow_light_gray:1}] run function gourd_guard:item_glow/colors/light_gray
execute if items entity @s contents *[custom_data~{glow_light_blue:1}] run function gourd_guard:item_glow/colors/light_blue
execute if items entity @s contents *[custom_data~{glow_brown:1}] run function gourd_guard:item_glow/colors/brown

# Fallback for data entity paths
execute if data entity @s Item.components."minecraft:custom_data".glow_black run function gourd_guard:item_glow/colors/black

tag @s add glow_checked