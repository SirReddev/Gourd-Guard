# Executed as the wave mob (@s) at @s - hit by nearby ravager convoy
# Guard: only hit if not already rammed recently
execute if entity @s[tag=gg_rammed] run return 0

# Tag as rammed with 5s cooldown so this specific mob isn't double-hit if it survives
tag @s add gg_rammed
scoreboard players set @s gg.ram_cd 100

# Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# 1. Fetch ravager remaining capacity
scoreboard players set #cap gg.calc 0
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] run scoreboard players operation #cap gg.calc = @s gg.convoy_cap
execute if score #cap gg.calc matches ..0 run return 0

# 2. Fetch this mob's current HP
execute store result score #mob_hp gg.calc run data get entity @s Health 1
execute if score #mob_hp gg.calc matches ..0 run return 0

# 3. Calculate damage to deal: min(mob_hp, convoy_cap)
scoreboard players operation #dmg_deal gg.calc = #mob_hp gg.calc
execute if score #dmg_deal gg.calc > #cap gg.calc run scoreboard players operation #dmg_deal gg.calc = #cap gg.calc

# 4. Deduct dealt damage from ravager capacity
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] run scoreboard players operation @s gg.convoy_cap -= #dmg_deal gg.calc

# 5. Deal dynamic damage to mob via macro
data merge storage gourd_guard:convoy {macro:{dmg:1}}
execute store result storage gourd_guard:convoy macro.dmg int 1 run scoreboard players get #dmg_deal gg.calc
function gourd_guard:tower/convoy/deal_damage with storage gourd_guard:convoy macro

# 6. Check if ravager depleted its capacity - trigger death
execute as @e[tag=gg_convoy,distance=..3.5,limit=1,scores={gg.convoy_cap=..0}] run function gourd_guard:tower/convoy/on_convoy_death

# 7. Update mob HP display or remove if dead
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
