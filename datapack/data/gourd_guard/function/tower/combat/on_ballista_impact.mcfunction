# Ballista arrows deal direct damage without the firework explosion
playsound minecraft:entity.arrow.hit_player master @a[distance=..24] ~ ~ ~ 0.8 1.0
particle minecraft:crit ~ ~ ~ 0.15 0.15 0.15 0.1 8

execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 80
data merge storage gourd_guard:tower {macro:{dmg:80}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..1.6] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct
kill @s
