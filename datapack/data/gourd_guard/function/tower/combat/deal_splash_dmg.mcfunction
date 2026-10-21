data modify entity @s HurtTime set value 0s
$damage @s $(splash) minecraft:out_of_world
particle minecraft:crit ~ ~0.8 ~ 0.2 0.25 0.2 0.08 5
particle minecraft:damage_indicator ~ ~0.8 ~ 0.15 0.2 0.15 0.05 3
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 run kill @s
