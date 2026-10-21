# Executed as & at the slowness potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.2
playsound minecraft:particle.soul_escape master @a[distance=..24] ~ ~ ~ 1.0 0.9
particle minecraft:soul ~ ~ ~ 0.6 0.5 0.6 0.08 35
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.4 0.5 0.04 20

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 35
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 20
execute unless score @s gg.fw_slow_dur matches 20.. run scoreboard players set @s gg.fw_slow_dur 100
scoreboard players operation #apply_slow_dur gg.calc = @s gg.fw_slow_dur

# 1. Deal direct hit damage & apply 5-second 50% slow (100 ticks) to closest wave mob
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# Only apply/start slow if the mob is NOT currently slowed, so the 5s timer strictly expires without perma-slow locks
execute as @e[tag=gg_hit_direct,tag=!gg_slowed,limit=1] run scoreboard players operation @s gg.slow_timer = #apply_slow_dur gg.calc
execute as @e[tag=gg_hit_direct,tag=!gg_slowed,limit=1] run effect give @s minecraft:slowness 5 1 true
execute as @e[tag=gg_hit_direct,tag=!gg_slowed,limit=1] run tag @s add gg_slowed

# 2. Deal splash damage & apply 5-second slow (100 ticks) to all other wave mobs within 3.5 blocks
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
execute as @e[tag=gg_mob,tag=!gg_hit_direct,tag=!gg_slowed,distance=..3.5] run scoreboard players operation @s gg.slow_timer = #apply_slow_dur gg.calc
execute as @e[tag=gg_mob,tag=!gg_hit_direct,tag=!gg_slowed,distance=..3.5] run effect give @s minecraft:slowness 5 0 true
execute as @e[tag=gg_mob,tag=!gg_hit_direct,tag=!gg_slowed,distance=..3.5] run tag @s add gg_slowed
tag @e remove gg_hit_direct

# 3. Remove projectile
kill @s
