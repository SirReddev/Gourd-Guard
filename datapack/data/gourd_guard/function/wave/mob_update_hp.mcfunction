# Executed as the wave mob entity (@s)
execute store result score #cur_hp gg.calc run data get entity @s Health 1
execute if score #cur_hp gg.calc matches 1.. unless score @s gg.last_hp = #cur_hp gg.calc run function gourd_guard:wave/set_mob_hp
