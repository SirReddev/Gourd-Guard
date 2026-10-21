# Executed as a placed tower root entity (@s)
execute store result storage gourd_guard:tower macro.lvl int 1 run scoreboard players get @s gg.tower_lvl
execute store result storage gourd_guard:tower macro.sell int 1 run scoreboard players get @s gg.tower_sell

execute if score @s gg.tower_type matches 1 run data modify storage gourd_guard:tower macro.name set value "Firework Cannon"
execute if score @s gg.tower_type matches 2 run data modify storage gourd_guard:tower macro.name set value "Copper Golem Launcher"
execute if score @s gg.tower_type matches 3 run data modify storage gourd_guard:tower macro.name set value "Pillager Convoy"
execute if score @s gg.tower_type matches 4 run data modify storage gourd_guard:tower macro.name set value "Cauldron Damage"
execute if score @s gg.tower_type matches 5 run data modify storage gourd_guard:tower macro.name set value "Tesla Coil"
execute if score @s gg.tower_type matches 6 run data modify storage gourd_guard:tower macro.name set value "Cauldron Poison"
execute if score @s gg.tower_type matches 7 run data modify storage gourd_guard:tower macro.name set value "Cauldron Slowness"
execute if score @s gg.tower_type matches 8 run data modify storage gourd_guard:tower macro.name set value "Magic Altar"

execute on passengers if entity @s[type=text_display] run function gourd_guard:tower/placed/apply_text_macro with storage gourd_guard:tower macro
