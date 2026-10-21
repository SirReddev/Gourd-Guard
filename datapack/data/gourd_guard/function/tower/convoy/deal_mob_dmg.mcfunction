# Deal lethal/direct collision damage to wave mob
# Macro argument: $(dmg)
data modify entity @s HurtTime set value 0s
$execute if entity @e[tag=gg_convoy,distance=..8] run damage @s $(dmg) minecraft:generic by @e[tag=gg_convoy,distance=..8,limit=1]
$execute unless entity @e[tag=gg_convoy,distance=..8] run damage @s $(dmg) minecraft:generic
particle minecraft:damage_indicator ~ ~1 ~ 0.25 0.3 0.25 0.05 6
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 run kill @s
