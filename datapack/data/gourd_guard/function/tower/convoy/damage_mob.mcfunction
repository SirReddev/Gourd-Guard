# Executed as the wave mob (@s) at @s - hit by nearby active ravager convoy (tagged gg_current_convoy)
# Guard: only hit if not already rammed recently
execute if entity @s[tag=gg_rammed] run return 0

# 1. Fetch active ravager remaining capacity
scoreboard players set #cap gg.calc 0
execute as @e[tag=gg_current_convoy,limit=1] run scoreboard players operation #cap gg.calc = @s gg.convoy_cap
execute unless score #cap gg.calc matches 1.. run return 0

# 2. Fetch this mob's current HP
scoreboard players set #mob_hp gg.calc 0
execute store result score #mob_hp gg.calc run data get entity @s Health 1
execute unless score #mob_hp gg.calc matches 1.. run return 0

# 3. Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# 4. Calculate damage: min(mob_hp, convoy_cap)
scoreboard players operation #dmg_deal gg.calc = #mob_hp gg.calc
execute if score #dmg_deal gg.calc > #cap gg.calc run scoreboard players operation #dmg_deal gg.calc = #cap gg.calc

# 5. Deduct dealt damage from ravager capacity
execute as @e[tag=gg_current_convoy,limit=1] run scoreboard players operation @s gg.convoy_cap -= #dmg_deal gg.calc

# 6. Apply damage to mob via macro
data merge storage gourd_guard:tower {macro:{dmg:1}}
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get #dmg_deal gg.calc
data modify entity @s HurtTime set value 0s
function gourd_guard:tower/convoy/deal_damage with storage gourd_guard:tower macro

# 7. Check if ravager depleted its capacity - trigger death immediately
execute as @e[tag=gg_current_convoy,limit=1,scores={gg.convoy_cap=..0}] run function gourd_guard:tower/convoy/on_convoy_death

# 8. Check mob status: update HP bar or kill if dead, or set ram cooldown if survived
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp
execute if score #check_hp gg.calc matches 1.. run tag @s add gg_rammed
execute if score #check_hp gg.calc matches 1.. run scoreboard players set @s gg.ram_cd 60

execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
