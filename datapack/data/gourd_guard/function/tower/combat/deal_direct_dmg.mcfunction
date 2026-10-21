data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world
particle minecraft:crit ~ ~1 ~ 0.25 0.3 0.25 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 5
execute store result score #check_hp gg.calc run data get entity @s Health 1
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
