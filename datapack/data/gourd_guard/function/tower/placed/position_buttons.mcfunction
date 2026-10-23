# Read the text display's pose and preserve each tower's button-row alignment.
scoreboard players set #btn_y gg.tower_id -100000
execute on passengers if entity @s[type=text_display] store result score #btn_y gg.tower_id run data get entity @s transformation[7] 1000
execute if score @s gg.tower_type matches 1 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 115
execute if score @s gg.tower_type matches 2 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 105
execute if score @s gg.tower_type matches 3 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 65
execute if score @s gg.tower_type matches 4 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 51
execute if score @s gg.tower_type matches 5 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 53
execute if score @s gg.tower_type matches 6 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 51
execute if score @s gg.tower_type matches 7 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 51
execute if score @s gg.tower_type matches 8 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 44
execute if score @s gg.tower_type matches 9 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 1520
execute if score @s gg.tower_type matches 10 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 489
execute if score @s gg.tower_type matches 11 if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 45
execute if score #btn_y gg.tower_id matches 0..10000 store result storage gourd_guard:tower macro.button_y double 0.001 run scoreboard players get #btn_y gg.tower_id
data modify storage gourd_guard:tower macro.button_move_x set value -1.525d
data modify storage gourd_guard:tower macro.button_sell_x set value -0.625d
data modify storage gourd_guard:tower macro.button_upgrade_x set value 0.4375d
data modify storage gourd_guard:tower macro.button_stats_x set value 1.4875d
execute if score @s gg.tower_type matches 9 run data modify storage gourd_guard:tower macro.button_move_x set value -0.475d
execute if score @s gg.tower_type matches 9 run data modify storage gourd_guard:tower macro.button_sell_x set value 0.425d
execute if score #btn_y gg.tower_id matches 0..10000 run function gourd_guard:tower/placed/position_buttons/rotated with storage gourd_guard:tower macro
