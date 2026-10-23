# Executed as a placed tower root entity (@s)
execute store result storage gourd_guard:tower macro.lvl int 1 run scoreboard players get @s gg.tower_lvl
function gourd_guard:tower/placed/set_base_sell
execute store result storage gourd_guard:tower macro.sell int 1 run scoreboard players get #base_sell coins

execute if score @s gg.tower_type matches 1 run data modify storage gourd_guard:tower macro.name set value "Firework Cannon"
execute if score @s gg.tower_type matches 2 run data modify storage gourd_guard:tower macro.name set value "Copper Golem Launcher"
execute if score @s gg.tower_type matches 3 run data modify storage gourd_guard:tower macro.name set value "Pillager Convoy"
execute if score @s gg.tower_type matches 4 run data modify storage gourd_guard:tower macro.name set value "Damage Cauldron"
execute if score @s gg.tower_type matches 5 run data modify storage gourd_guard:tower macro.name set value "Tesla Coil"
execute if score @s gg.tower_type matches 6 run data modify storage gourd_guard:tower macro.name set value "Poison Cauldron"
execute if score @s gg.tower_type matches 7 run data modify storage gourd_guard:tower macro.name set value "Slowness Cauldron"
execute if score @s gg.tower_type matches 8 run data modify storage gourd_guard:tower macro.name set value "Magic Altar"
execute if score @s gg.tower_type matches 9 run data modify storage gourd_guard:tower macro.name set value "Scarecrow"
execute if score @s gg.tower_type matches 10 run data modify storage gourd_guard:tower macro.name set value "Fortune Pillar"
execute if score @s gg.tower_type matches 11 run data modify storage gourd_guard:tower macro.name set value "Ballista"

# Scarecrow uses simpler text macro (no upgrade/stats buttons)
execute if score @s gg.tower_type matches 9 on passengers if entity @s[type=text_display] run function gourd_guard:tower/placed/apply_text_macro_scarecrow with storage gourd_guard:tower macro
execute unless score @s gg.tower_type matches 9 on passengers if entity @s[type=text_display] run function gourd_guard:tower/placed/apply_text_macro with storage gourd_guard:tower macro
