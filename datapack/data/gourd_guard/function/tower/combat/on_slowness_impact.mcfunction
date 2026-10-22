# Executed as & at the slowness potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.2
playsound minecraft:particle.soul_escape master @a[distance=..24] ~ ~ ~ 1.0 0.9
particle minecraft:soul ~ ~ ~ 0.6 0.5 0.6 0.08 35
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.4 0.5 0.04 20

# Duration score: default to 100 ticks = 5.0 seconds
execute if score @s gg.fw_slow_dur matches 20.. run scoreboard players operation #slow_dur gg.calc = @s gg.fw_slow_dur
execute unless score @s gg.fw_slow_dur matches 20.. run scoreboard players set #slow_dur gg.calc 100

# 1. Apply 50% slow (100 ticks = 5s) to closest wave mob that is NOT already actively slowed
tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..3.0] add gg_hit_direct

execute as @e[tag=gg_hit_direct,limit=1] unless score @s gg.slow_dur matches 1.. run scoreboard players operation @s gg.slow_dur = #slow_dur gg.calc
execute as @e[tag=gg_hit_direct,limit=1] unless score @s gg.slow_val matches 1.. run scoreboard players set @s gg.slow_val 50
execute as @e[tag=gg_hit_direct,limit=1] run effect give @s minecraft:slowness 5 0 true

# 2. Apply 50% slow (100 ticks = 5s) to splash mobs within 3.5b that are NOT already actively slowed
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] unless score @s gg.slow_dur matches 1.. run scoreboard players operation @s gg.slow_dur = #slow_dur gg.calc
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] unless score @s gg.slow_val matches 1.. run scoreboard players set @s gg.slow_val 50
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run effect give @s minecraft:slowness 5 0 true

tag @e remove gg_hit_direct

# 3. Remove projectile
kill @s
