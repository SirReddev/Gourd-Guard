# Executed as the tower root item_display (@s)
# 1. Remove any locator markers belonging to the same aj.id
scoreboard players operation #rem_aj_id aj.id = @s aj.id
execute as @e[type=marker,tag=aj.global.locator] if score @s aj.id = #rem_aj_id aj.id run kill @s

# 2. Kill all passenger bone item_displays and text_displays
execute on passengers if entity @s[type=!player] run kill @s

# 3. Kill the root item_display itself
kill @s
