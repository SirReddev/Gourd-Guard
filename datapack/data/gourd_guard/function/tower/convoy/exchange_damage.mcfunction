# Collision Damage Attack
# Executed as the ravager (@s) colliding with nearby wave mobs

# Set ram attack cooldown (10 ticks = 0.5s) to allow rhythmic biting
scoreboard players set @s gg.convoy_ram_cd 10

# 1. Fetch convoy damage score
scoreboard players operation #ram_dmg gg.calc = @s gg.convoy_dmg
execute unless score #ram_dmg gg.calc matches 1.. run scoreboard players set #ram_dmg gg.calc 30

# 2. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..24] ~ ~ ~ 1.0 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..24] ~ ~ ~ 0.9 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.5 0.3 0.5 0.0 6
particle minecraft:damage_indicator ~ ~1 ~ 0.35 0.35 0.35 0.05 12
particle minecraft:crit ~ ~1 ~ 0.35 0.35 0.35 0.1 12

# 3. Deal damage directly to all wave mobs within 6.5 blocks of the ravager
tag @e[tag=gg_ram_target] remove gg_ram_target
execute at @s run tag @e[tag=gg_mob,distance=..6.5] add gg_ram_target
execute as @e[tag=gg_ram_target] at @s run function gourd_guard:tower/convoy/hit_target
tag @e[tag=gg_ram_target] remove gg_ram_target

# 4. Convoy takes slight recoil wear (5 damage per ram engagement)
data modify entity @s HurtTime set value 0s
damage @s 5 minecraft:out_of_world
execute store result score #rem_hp gg.calc run data get entity @s Health 1
execute if score #rem_hp gg.calc matches ..0 run tag @s remove gg_convoy
execute if score #rem_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #rem_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death
