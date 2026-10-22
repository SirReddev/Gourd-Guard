# Executed as & at the slowness potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 1.2
playsound minecraft:particle.soul_escape master @a[distance=..24] ~ ~ ~ 1.0 0.9
particle minecraft:soul ~ ~ ~ 0.6 0.5 0.6 0.08 35
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.4 0.5 0.04 20

# Duration: default 100 ticks = 5s
execute if score @s gg.fw_slow_dur matches 20.. run scoreboard players operation #slow_dur gg.calc = @s gg.fw_slow_dur
execute unless score @s gg.fw_slow_dur matches 20.. run scoreboard players set #slow_dur gg.calc 100

# Apply slowness to all wave mobs within 4.0 blocks
execute as @e[tag=gg_mob,distance=..4.0] run function gourd_guard:tower/combat/apply_slow

# Remove projectile
kill @s
