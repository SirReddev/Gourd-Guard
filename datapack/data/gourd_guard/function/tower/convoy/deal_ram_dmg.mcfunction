# Macro: apply ram collision damage to wave mob (@s)
# Argument: $(dmg)
data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world
particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# Check if mob survived or died
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches 1.. run tag @s add gg_rammed
execute if score #check_hp gg.calc matches 1.. run scoreboard players set @s gg.ram_cd 40

execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
