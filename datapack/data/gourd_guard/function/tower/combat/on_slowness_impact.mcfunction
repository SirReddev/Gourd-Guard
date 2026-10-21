# Executed as & at the slowness potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.2
playsound minecraft:particle.soul_escape master @a[distance=..24] ~ ~ ~ 1.0 0.9
particle minecraft:soul ~ ~ ~ 0.5 0.5 0.5 0.08 30
particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.04 15

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 35
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 20

# 1. Deal direct hit damage & apply 5-second 50% slow (100 ticks) to closest wave mob
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro
execute as @e[tag=gg_hit_direct,limit=1] run tag @s add gg_slowed
execute as @e[tag=gg_hit_direct,limit=1] run scoreboard players set @s gg.slow_timer 100
execute as @e[tag=gg_hit_direct,limit=1] run effect give @s minecraft:slowness 5 1 true

# 2. Deal splash damage & apply 3-second slow (60 ticks) to all other wave mobs within 3.0 blocks
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run tag @s add gg_slowed
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run scoreboard players set @s gg.slow_timer 60
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run effect give @s minecraft:slowness 3 0 true
tag @e remove gg_hit_direct

# 3. Remove projectile
kill @s
