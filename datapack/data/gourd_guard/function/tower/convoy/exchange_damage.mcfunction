# Collision Damage Attack
# Executed as the ravager (@s) colliding with nearby wave mobs

# Set ram attack cooldown (10 ticks = 0.5s) to allow rhythmic biting
scoreboard players set @s gg.convoy_ram_cd 10

# 1. Ensure attack damage is set (fallback 65)
execute unless score @s gg.convoy_dmg matches 1.. run scoreboard players set @s gg.convoy_dmg 65

# 2. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 1.0 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.5 0.3 0.5 0.0 4
particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.3 0.3 0.05 8
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8

# 3. Deal damage to all wave mobs within 3.0 blocks
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.convoy_dmg
execute as @e[tag=gg_mob,distance=..3.0] at @s run function gourd_guard:tower/convoy/deal_mob_dmg with storage gourd_guard:tower macro
