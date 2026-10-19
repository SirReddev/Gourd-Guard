# Deal lethal/direct collision damage to wave mob
# Macro argument: $(dmg)
data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world
particle minecraft:damage_indicator ~ ~1 ~ 0.25 0.3 0.25 0.05 6
execute store result score #check_hp gg.calc run data get entity @s Health 1
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
