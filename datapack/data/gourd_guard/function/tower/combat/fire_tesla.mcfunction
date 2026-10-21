# Executed as & at the Tesla Coil root (@s) facing the target
data merge storage gourd_guard:tower {macro:{dmg:200,splash:100}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.tower_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.tower_splash

# Discharge audio & particle feedback at Tesla Coil
playsound minecraft:item.trident.thunder master @a[distance=..24] ~ ~3.5 ~ 1.2 1.5
playsound minecraft:block.beacon.activate master @a[distance=..24] ~ ~3.5 ~ 0.8 1.8
particle minecraft:electric_spark ~ ~3.7 ~ 0.3 0.3 0.3 0.1 20

# Protect any existing items in the strike zone from lightning damage
execute at @n[tag=gg_tower_target] as @e[type=item,distance=..8] run data merge entity @s {Invulnerable:1b,Health:1000s}

# Execute lightning strike at the target mob
execute at @n[tag=gg_tower_target] run summon minecraft:lightning_bolt ~ ~ ~
execute at @n[tag=gg_tower_target] run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..32] ~ ~ ~ 1.0 1.2
execute at @n[tag=gg_tower_target] run particle minecraft:electric_spark ~ ~1 ~ 0.6 0.6 0.6 0.2 35

# Extinguish any ground fire and protect nearby players from vanilla lightning damage
execute at @n[tag=gg_tower_target] run fill ~-2 ~-1 ~-2 ~2 ~2 ~2 air replace fire
execute at @n[tag=gg_tower_target] run fill ~-2 ~-1 ~-2 ~2 ~2 ~2 air replace soul_fire
execute at @n[tag=gg_tower_target] as @a[distance=..5] run effect give @s minecraft:fire_resistance 2 0 true
execute at @n[tag=gg_tower_target] as @a[distance=..5] run effect give @s minecraft:resistance 1 4 true

# Deal heavy direct hit damage to the struck target mob
tag @e remove gg_hit_direct
tag @n[tag=gg_tower_target] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# Deal shock splash damage to nearby wave mobs (3.5 blocks)
execute at @n[tag=gg_tower_target] as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.5] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct

# Protect newly dropped items immediately and initialize candy so lightning never destroys them
execute at @n[tag=gg_tower_target] as @e[type=item,distance=..8] run data merge entity @s {Invulnerable:1b,Health:1000s}
execute at @n[tag=gg_tower_target] as @e[type=item,distance=..8,tag=!gg_candy_init] if data entity @s Item.components."minecraft:custom_data".candy run function gourd_guard:candy/init
