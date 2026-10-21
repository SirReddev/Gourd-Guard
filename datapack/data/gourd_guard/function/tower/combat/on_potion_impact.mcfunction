# Executed as & at the potion projectile upon hitting the target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.0
playsound minecraft:entity.witch.celebrate master @a[distance=..24] ~ ~ ~ 0.5 1.5
particle minecraft:instant_effect ~ ~ ~ 0.5 0.5 0.5 0.1 30
particle minecraft:witch ~ ~ ~ 0.4 0.4 0.4 0.05 20
particle minecraft:damage_indicator ~ ~0.5 ~ 0.5 0.5 0.5 0.1 14

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 80
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 40

# 1. Deal direct hit damage to the closest wave mob within 2.8 blocks of impact
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 2. Deal splash damage to all other wave mobs within 3.0 blocks of impact
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct

# 3. Remove the potion projectile entity
kill @s
