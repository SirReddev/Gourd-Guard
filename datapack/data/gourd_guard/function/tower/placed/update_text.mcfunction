# Executed as a placed tower root entity (@s)
# Store level and sell value into storage gourd_guard:tower macro for dynamic text_display formatting
execute store result storage gourd_guard:tower macro.lvl int 1 run scoreboard players get @s gg.tower_lvl
execute store result storage gourd_guard:tower macro.sell int 1 run scoreboard players get @s gg.tower_sell

execute if score @s gg.tower_type matches 1 run data modify storage gourd_guard:tower macro.name set value "Firework Cannon"

execute on passengers if entity @s[type=text_display] run function gourd_guard:tower/placed/apply_text_macro with storage gourd_guard:tower macro
