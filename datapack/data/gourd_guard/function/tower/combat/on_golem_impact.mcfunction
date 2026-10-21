# Executed as & at the copper golem projectile upon hitting the target point
# 1. Copper smash impact sounds & particle burst
playsound minecraft:block.copper.hit master @a[distance=..24] ~ ~ ~ 1.0 0.8
playsound minecraft:entity.iron_golem.damage master @a[distance=..24] ~ ~ ~ 0.9 1.1
playsound minecraft:block.anvil.land master @a[distance=..24] ~ ~ ~ 0.5 1.5
particle minecraft:wax_off ~ ~ ~ 0.5 0.5 0.5 0.1 40

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 60
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 30

# 2. Deal direct hit damage to the closest wave mob within 2.8 blocks of impact
data merge storage gourd_guard:tower {macro:{dmg:60,splash:30}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 3. Deal splash damage to all other wave mobs within 2.5 blocks of impact
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..2.5] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct

# 4. Remove the projectile entity and its block_display passenger
execute on passengers run kill @s
kill @s
