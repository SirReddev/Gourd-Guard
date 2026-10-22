# Executed as the ravager (@s) at @s
# Tag the single nearest wave mob within 3.5 blocks that hasn't been rammed yet
tag @e[tag=gg_ram_target] remove gg_ram_target
tag @e[tag=gg_mob,tag=!gg_rammed,distance=..3.5,limit=1,sort=nearest] add gg_ram_target
execute unless entity @e[tag=gg_ram_target,limit=1] run return 0

# 1. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0
execute at @e[tag=gg_ram_target,limit=1] run particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
execute at @e[tag=gg_ram_target,limit=1] run particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
execute at @e[tag=gg_ram_target,limit=1] run particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# 2. Get mob's HP
scoreboard players set #mob_hp gg.calc 0
execute store result score #mob_hp gg.calc run data get entity @e[tag=gg_ram_target,limit=1] Health 1
execute unless score #mob_hp gg.calc matches 1.. run scoreboard players set #mob_hp gg.calc 90

# 3. Decision: does mob die?
scoreboard players set #mob_dies gg.calc 0
execute if score @s gg.convoy_cap >= #mob_hp gg.calc run scoreboard players set #mob_dies gg.calc 1

# 4. CASE A: Ravager capacity >= mob HP -> KILL THE MOB
execute if score #mob_dies gg.calc matches 1 run scoreboard players operation @s gg.convoy_cap -= #mob_hp gg.calc
execute if score #mob_dies gg.calc matches 1 as @e[tag=gg_ram_target,limit=1] run damage @s 100000 minecraft:generic
execute if score #mob_dies gg.calc matches 1 as @e[tag=gg_ram_target,limit=1] run tag @s remove gg_mob
execute if score #mob_dies gg.calc matches 1 as @e[tag=gg_ram_target,limit=1] run tag @s remove path_mob
execute if score #mob_dies gg.calc matches 1 as @e[tag=gg_ram_target,limit=1] run kill @s

# 5. CASE B: Ravager capacity < mob HP -> MOB SURVIVES WITH REDUCED HP, RAVAGER EXHAUSTED
execute if score #mob_dies gg.calc matches 0 run scoreboard players operation #mob_hp gg.calc -= @s gg.convoy_cap
execute if score #mob_dies gg.calc matches 0 as @e[tag=gg_ram_target,limit=1] store result entity @s Health float 1.0 run scoreboard players get #mob_hp gg.calc
execute if score #mob_dies gg.calc matches 0 as @e[tag=gg_ram_target,limit=1] run data modify entity @s HurtTime set value 10s
execute if score #mob_dies gg.calc matches 0 as @e[tag=gg_ram_target,limit=1] run tag @s add gg_rammed
execute if score #mob_dies gg.calc matches 0 as @e[tag=gg_ram_target,limit=1] run scoreboard players set @s gg.ram_cd 60
execute if score #mob_dies gg.calc matches 0 as @e[tag=gg_ram_target,limit=1] run function gourd_guard:wave/mob_update_hp
execute if score #mob_dies gg.calc matches 0 run scoreboard players set @s gg.convoy_cap 0

tag @e[tag=gg_ram_target] remove gg_ram_target

# 6. If ravager capacity reached 0, trigger death immediately
execute if score @s gg.convoy_cap matches ..0 run function gourd_guard:tower/convoy/on_convoy_death
