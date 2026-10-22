# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 1. Death check: if ravager HP dropped to 0 or below, kill rider and despawn
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Cache convoy damage score
scoreboard players operation #convoy_dmg gg.calc = @s gg.convoy_dmg
execute unless score #convoy_dmg gg.calc matches 1.. run scoreboard players set #convoy_dmg gg.calc 30

# 3. Check if mob is near in close range (within 3.0 blocks) and damage that mob!
execute at @s as @e[tag=gg_mob,distance=..3.0] at @s run function gourd_guard:tower/convoy/damage_mob
