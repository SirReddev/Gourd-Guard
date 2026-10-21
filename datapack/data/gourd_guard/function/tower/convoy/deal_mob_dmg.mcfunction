# Deal lethal/direct collision damage to wave mob
# Uses #convoy_atk_dmg gg.calc (set by ravager prior to dispatch)
data modify entity @s HurtTime set value 0s
execute if score #convoy_atk_dmg gg.calc matches ..45 run damage @s 45 minecraft:out_of_world
execute if score #convoy_atk_dmg gg.calc matches 46..65 run damage @s 65 minecraft:out_of_world
execute if score #convoy_atk_dmg gg.calc matches 66..90 run damage @s 90 minecraft:out_of_world
execute if score #convoy_atk_dmg gg.calc matches 91..130 run damage @s 130 minecraft:out_of_world
execute if score #convoy_atk_dmg gg.calc matches 131.. run damage @s 180 minecraft:out_of_world
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 10
particle minecraft:damage_indicator ~ ~1 ~ 0.25 0.3 0.25 0.05 8
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
