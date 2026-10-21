# Executed as & at the enchanted book projectile upon hitting target point
# 1. Magic impact audio & mystical particle burst
playsound minecraft:entity.player.attack.crit master @a[distance=..24] ~ ~ ~ 1.2 0.8
playsound minecraft:block.enchantment_table.use master @a[distance=..24] ~ ~ ~ 1.2 0.6
playsound minecraft:entity.generic.explode master @a[distance=..24] ~ ~ ~ 0.5 1.6
particle minecraft:enchant ~ ~ ~ 0.6 0.6 0.6 1.0 50
particle minecraft:portal ~ ~ ~ 0.5 0.5 0.5 0.2 30
particle minecraft:crit ~ ~ ~ 0.4 0.4 0.4 0.15 20

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 110
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 55

# 2. Deal direct hit damage to the closest wave mob within 2.8 blocks
data merge storage gourd_guard:tower {macro:{dmg:110,splash:55}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 3. Deal splash damage to all other wave mobs within 2.8 blocks
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..2.8] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct

# 4. Remove projectile
kill @s
