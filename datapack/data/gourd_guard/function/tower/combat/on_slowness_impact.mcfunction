# Executed as & at the slowness potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.2
playsound minecraft:particle.soul_escape master @a[distance=..24] ~ ~ ~ 1.0 0.9
particle minecraft:soul ~ ~ ~ 0.6 0.5 0.6 0.08 35
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.4 0.5 0.04 20

# Duration score:
execute if score @s gg.fw_slow_dur matches 20.. run scoreboard players operation #apply_slow_dur gg.calc = @s gg.fw_slow_dur
execute unless score @s gg.fw_slow_dur matches 20.. run scoreboard players set #apply_slow_dur gg.calc 100

# 1. Apply 5-second 50% slow (100 ticks) to closest wave mob (No damage - pure slow utility)
tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..3.0] add gg_hit_direct

execute as @e[tag=gg_hit_direct,limit=1] run scoreboard players operation @s gg.slow_timer = #apply_slow_dur gg.calc
execute as @e[tag=gg_hit_direct,limit=1] unless score @s gg.slow_timer matches 20.. run scoreboard players set @s gg.slow_timer 100
execute as @e[tag=gg_hit_direct,limit=1] run effect give @s minecraft:slowness 5 1 false
execute as @e[tag=gg_hit_direct,limit=1] run tag @s add gg_slowed

# 2. Apply 5-second slow (100 ticks) to all other wave mobs within 3.5 blocks (No damage)
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run scoreboard players operation @s gg.slow_timer = #apply_slow_dur gg.calc
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] unless score @s gg.slow_timer matches 20.. run scoreboard players set @s gg.slow_timer 100
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run effect give @s minecraft:slowness 5 0 false
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run tag @s add gg_slowed
tag @e remove gg_hit_direct

# 3. Remove projectile
kill @s
