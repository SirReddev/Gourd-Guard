# Executed as the ravager (@s) at @s
scoreboard objectives add gg.convoy_cap dummy
scoreboard objectives add gg.calc dummy

# Ensure ravager capacity is set
execute unless score @s gg.convoy_cap matches 1.. run scoreboard players set @s gg.convoy_cap 300

# Tag the single nearest wave mob within 3.5 blocks that hasn't been rammed yet
tag @e[tag=gg_ram_target] remove gg_ram_target
tag @e[tag=gg_mob,tag=!gg_rammed,distance=..3.5,limit=1,sort=nearest] add gg_ram_target
execute unless entity @e[tag=gg_ram_target,limit=1] run return 0

# 1. Audio impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0

# 2. Get mob's HP
scoreboard players set #mob_hp gg.calc 0
execute store result score #mob_hp gg.calc run data get entity @e[tag=gg_ram_target,limit=1] Health 1
execute unless score #mob_hp gg.calc matches 1.. run scoreboard players set #mob_hp gg.calc 90

# 3. Calculate damage to deal: min(mob_hp, convoy_cap)
scoreboard players operation #dmg_deal gg.calc = #mob_hp gg.calc
execute if score #dmg_deal gg.calc > @s gg.convoy_cap run scoreboard players operation #dmg_deal gg.calc = @s gg.convoy_cap

# 4. Deduct dealt damage from ravager capacity
scoreboard players operation @s gg.convoy_cap -= #dmg_deal gg.calc

# 5. Deal damage to target mob via macro
data merge storage gourd_guard:tower {macro:{dmg:1}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get #dmg_deal gg.calc
execute as @e[tag=gg_ram_target,limit=1] at @s run function gourd_guard:tower/convoy/deal_ram_dmg with storage gourd_guard:tower macro

tag @e[tag=gg_ram_target] remove gg_ram_target

# 6. If ravager capacity reached 0, trigger death immediately
execute if score @s gg.convoy_cap matches ..0 run function gourd_guard:tower/convoy/on_convoy_death
