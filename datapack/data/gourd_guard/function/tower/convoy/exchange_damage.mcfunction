# Collision Damage Exchange
# Executed as the ravager (@s) colliding with target wave mob @e[tag=gg_convoy_target,limit=1]

# Set ram attack cooldown (8 ticks) to prevent per-tick computation spam
scoreboard players set @s gg.convoy_ram_cd 8

# 1. Read mob remaining HP (skip & untag if already dead)
execute store result score #mob_hp gg.calc run data get entity @e[tag=gg_convoy_target,limit=1] Health 1
execute if score #mob_hp gg.calc matches ..0 as @e[tag=gg_convoy_target,limit=1] run tag @s remove gg_mob
execute if score #mob_hp gg.calc matches ..0 as @e[tag=gg_convoy_target,limit=1] run tag @s remove path_mob
execute if score #mob_hp gg.calc matches ..0 as @e[tag=gg_convoy_target,limit=1] run kill @s
execute if score #mob_hp gg.calc matches ..0 run return 0

# 2. Read convoy remaining HP
execute store result score #convoy_hp gg.calc run data get entity @s Health 1

# 3. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 1.0 0.9
particle minecraft:sweep_attack ~ ~1 ~ 0.4 0.3 0.4 0.0 3
particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.3 0.3 0.05 8
particle minecraft:crit ~ ~1 ~ 0.4 0.4 0.4 0.1 10

# 4. Mob takes damage equal to the convoy's current HP
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get #convoy_hp gg.calc
execute as @e[tag=gg_convoy_target,limit=1] run function gourd_guard:tower/convoy/deal_mob_dmg with storage gourd_guard:tower macro

# 5. Convoy takes damage equal to the mob's HP
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get #mob_hp gg.calc
function gourd_guard:tower/convoy/deal_convoy_dmg with storage gourd_guard:tower macro
