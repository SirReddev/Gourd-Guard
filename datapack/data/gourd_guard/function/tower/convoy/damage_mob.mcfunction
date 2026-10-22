# Executed as the wave mob (@s) at @s - hit ONCE by nearby ravager convoy
# Guard: only hit if not already rammed recently
execute if entity @s[tag=gg_rammed] run return 0

# Tag as rammed with 5s cooldown before this mob can be rammed again
tag @s add gg_rammed
scoreboard players set @s gg.ram_cd 100

# Cache this mob's current HP BEFORE dealing damage (this is what ravager "spends")
execute store result score #mob_hp_before gg.calc run data get entity @s Health 1

# Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# Deal damage
data modify entity @s HurtTime set value 0s
execute if score #convoy_dmg gg.calc matches 45 run damage @s 45 generic
execute if score #convoy_dmg gg.calc matches 65 run damage @s 65 generic
execute if score #convoy_dmg gg.calc matches 90 run damage @s 90 generic
execute if score #convoy_dmg gg.calc matches 125 run damage @s 125 generic
execute unless score #convoy_dmg gg.calc matches 45 unless score #convoy_dmg gg.calc matches 65 unless score #convoy_dmg gg.calc matches 90 unless score #convoy_dmg gg.calc matches 125 run damage @s 30 generic

# Deduct actual HP spent from ravager's total damage capacity
# (capped at the actual convoy_dmg - so overkill damage doesn't drain extra capacity)
execute if score #mob_hp_before gg.calc < #convoy_dmg gg.calc run scoreboard players operation #dmg_spent gg.calc = #mob_hp_before gg.calc
execute if score #mob_hp_before gg.calc >= #convoy_dmg gg.calc run scoreboard players operation #dmg_spent gg.calc = #convoy_dmg gg.calc
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] run scoreboard players operation @s gg.convoy_cap -= #dmg_spent gg.calc

# If ravager used up its total damage capacity, trigger death
execute as @e[tag=gg_convoy,distance=..3.5,limit=1,scores={gg.convoy_cap=..0}] run function gourd_guard:tower/convoy/on_convoy_death
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if data entity @s {Health:0.0f} run function gourd_guard:tower/convoy/on_convoy_death

# Update mob HP display and kill if dead
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
