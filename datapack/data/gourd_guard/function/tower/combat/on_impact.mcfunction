# Executed as & at the firework projectile upon hitting the target point
# 1. Protect any nearby players from vanilla firework explosion damage for 1 second, then trigger real firework burst!
effect give @a[distance=..6] minecraft:resistance 1 4 true
summon minecraft:firework_rocket ~ ~ ~ {Life:0,LifeTime:0,Silent:1b,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",has_twinkle:1b,colors:[I;16733525,16755200,14602026],fade_colors:[I;16777045]}]}}}}
playsound minecraft:entity.firework_rocket.blast master @a[distance=..24] ~ ~ ~ 0.9 1.1
playsound minecraft:entity.firework_rocket.twinkle master @a[distance=..24] ~ ~ ~ 0.6 1.2

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 45
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 22

# 2. Deal direct hit damage to the closest wave mob within 2.8 blocks of impact
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 3. Deal splash damage to all other wave mobs within 2.5 blocks of impact
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..2.5] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
tag @e remove gg_hit_direct

# 4. Remove the firework projectile entity
kill @s
