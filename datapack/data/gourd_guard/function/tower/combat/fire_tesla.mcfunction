# Executed as & at the Tesla Coil root (@s) facing the target
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.tower_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.tower_splash

# Discharge audio & particle feedback at Tesla Coil
playsound minecraft:item.trident.thunder master @a[distance=..24] ~ ~3.5 ~ 1.2 1.5
playsound minecraft:block.beacon.activate master @a[distance=..24] ~ ~3.5 ~ 0.8 1.8
particle minecraft:electric_spark ~ ~3.7 ~ 0.3 0.3 0.3 0.1 20

# Execute lightning strike at the target mob
execute at @n[tag=gg_tower_target] run summon minecraft:lightning_bolt ~ ~ ~
execute at @n[tag=gg_tower_target] run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..32] ~ ~ ~ 1.0 1.2
execute at @n[tag=gg_tower_target] run particle minecraft:electric_spark ~ ~1 ~ 0.6 0.6 0.6 0.2 35

# Extinguish any ground fire and protect nearby players from vanilla lightning damage
execute at @n[tag=gg_tower_target] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace fire
execute at @n[tag=gg_tower_target] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace soul_fire
execute at @n[tag=gg_tower_target] as @a[distance=..5] run data modify entity @s Fire set value 0s
execute at @n[tag=gg_tower_target] as @a[distance=..5] run effect give @s minecraft:resistance 1 4 true

# Deal heavy direct hit damage to the struck target mob
tag @e remove gg_hit_direct
tag @n[tag=gg_tower_target] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# Deal shock splash damage to nearby wave mobs (3.5 blocks)
execute at @n[tag=gg_tower_target] as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct
