# Deal collision recoil damage to the Ravager convoy
# Macro argument: $(dmg)
data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world

# Check if convoy health dropped to 0 or below
execute store result score #rem_hp gg.calc run data get entity @s Health 1
execute if score #rem_hp gg.calc matches ..0 run tag @s remove gg_convoy
execute if score #rem_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #rem_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death
