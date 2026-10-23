# Read the text display's pose and preserve each tower's button-row alignment.
scoreboard players set #btn_y gg.tower_id -100000
execute on passengers if entity @s[type=text_display] store result score #btn_y gg.tower_id run data get entity @s transformation[7] 1000
execute if score #btn_y gg.tower_id matches 0..10000 run scoreboard players remove #btn_y gg.tower_id 100
execute if score #btn_y gg.tower_id matches 0..10000 store result storage gourd_guard:tower macro.button_y double 0.001 run scoreboard players get #btn_y gg.tower_id
execute if score #btn_y gg.tower_id matches 0..10000 run function gourd_guard:tower/placed/position_buttons/rotated with storage gourd_guard:tower macro
