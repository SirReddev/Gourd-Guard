# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 1. Death check
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death
execute if score @s gg.convoy_cap matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Damage close wave mob (within 3 blocks) that hasn't been rammed yet
execute at @s as @n[tag=gg_mob,tag=!gg_rammed,distance=..3.0] at @s run function gourd_guard:tower/convoy/damage_mob
execute if score @s gg.convoy_cap matches 1.. at @s as @n[tag=gg_mob,tag=!gg_rammed,distance=..3.0] at @s run function gourd_guard:tower/convoy/damage_mob
execute if score @s gg.convoy_cap matches 1.. at @s as @n[tag=gg_mob,tag=!gg_rammed,distance=..3.0] at @s run function gourd_guard:tower/convoy/damage_mob
