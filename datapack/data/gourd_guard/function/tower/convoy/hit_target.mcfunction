# Executed as each target wave mob (@s) at @s
# Reset hurt time so damage registers unconditionally
data modify entity @s HurtTime set value 0s

# Apply damage based on #ram_dmg gg.calc (30, 45, 65, 90, 125, or fallback)
execute if score #ram_dmg gg.calc matches 30 run damage @s 30 minecraft:out_of_world
execute if score #ram_dmg gg.calc matches 45 run damage @s 45 minecraft:out_of_world
execute if score #ram_dmg gg.calc matches 65 run damage @s 65 minecraft:out_of_world
execute if score #ram_dmg gg.calc matches 90 run damage @s 90 minecraft:out_of_world
execute if score #ram_dmg gg.calc matches 125 run damage @s 125 minecraft:out_of_world
execute unless score #ram_dmg gg.calc matches 30 unless score #ram_dmg gg.calc matches 45 unless score #ram_dmg gg.calc matches 65 unless score #ram_dmg gg.calc matches 90 unless score #ram_dmg gg.calc matches 125 run damage @s 30 minecraft:out_of_world

# Visual particles on each hit mob
particle minecraft:crit ~ ~1 ~ 0.25 0.3 0.25 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 5

# Update mob HP and floating text display
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp

# Kill handling if mob HP dropped to 0 or below
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
