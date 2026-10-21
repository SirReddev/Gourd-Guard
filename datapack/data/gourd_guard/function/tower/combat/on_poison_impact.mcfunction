# Executed as & at the poison potion projectile upon hitting target point
playsound minecraft:entity.splash_potion.break master @a[distance=..24] ~ ~ ~ 1.2 0.8
playsound minecraft:entity.witch.celebrate master @a[distance=..24] ~ ~ ~ 0.6 1.2
playsound minecraft:block.slime_block.place master @a[distance=..24] ~ ~ ~ 0.8 1.1
particle minecraft:spore_blossom_air ~ ~ ~ 0.6 0.6 0.6 0.1 40
particle minecraft:item_slime ~ ~ ~ 0.5 0.5 0.5 0.15 25

# Ensure non-zero damage values even if projectile scores were uninitialized
execute unless score @s gg.fw_dmg matches 1.. run scoreboard players set @s gg.fw_dmg 50
execute unless score @s gg.fw_splash matches 1.. run scoreboard players set @s gg.fw_splash 25

# 1. Deal direct hit damage & apply Poison II for 6 seconds to the closest wave mob
data merge storage gourd_guard:tower {macro:{dmg:50,splash:25}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

tag @e remove gg_hit_direct
tag @n[tag=gg_mob,distance=..2.8] add gg_hit_direct
execute as @e[tag=gg_hit_direct,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro
execute as @e[tag=gg_hit_direct,limit=1] run effect give @s minecraft:poison 6 1 true
execute as @e[tag=gg_hit_direct,limit=1] run tag @s add gg_poisoned

# 2. Deal splash damage & apply Poison I for 4 seconds to all other wave mobs within 3.0 blocks
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run effect give @s minecraft:poison 4 0 true
execute as @e[tag=gg_mob,tag=!gg_hit_direct,distance=..3.0] run tag @s add gg_poisoned
tag @e remove gg_hit_direct

# 3. Remove projectile
kill @s
