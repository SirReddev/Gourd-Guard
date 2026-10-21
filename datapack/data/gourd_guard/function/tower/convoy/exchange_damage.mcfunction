# Collision Damage Attack
# Executed as the ravager (@s) colliding with nearby wave mobs

# Set ram attack cooldown (10 ticks = 0.5s) to allow rhythmic biting
scoreboard players set @s gg.convoy_ram_cd 10

# 1. Ensure attack damage is set (fallback 45)
execute unless score @s gg.convoy_dmg matches 1.. run scoreboard players set @s gg.convoy_dmg 45

# 2. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..24] ~ ~ ~ 1.0 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..24] ~ ~ ~ 0.9 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.5 0.3 0.5 0.0 6
particle minecraft:damage_indicator ~ ~1 ~ 0.35 0.35 0.35 0.05 12
particle minecraft:crit ~ ~1 ~ 0.35 0.35 0.35 0.1 12

# 3. Deal damage directly to all wave mobs within 6.0 blocks of the ravager
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.convoy_dmg
execute at @s as @e[tag=gg_mob,distance=..6.0] at @s run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 4. Convoy takes slight recoil wear (15 damage per ram engagement)
function gourd_guard:tower/convoy/deal_convoy_dmg {dmg:15}
