summon minecraft:interaction ~ ~ ~ {width:0.7f,height:0.7f,response:1b,Tags:["gg_tower_place_btn","gg_my_place_btn","gg_place_btn_new"]}
execute as @n[type=interaction,tag=gg_place_btn_new] run scoreboard players operation @s gg.tower_pid = #cur_pid gg.tower_pid
tag @e[type=interaction,tag=gg_place_btn_new] remove gg_place_btn_new
