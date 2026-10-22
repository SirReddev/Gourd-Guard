# Executed as the wave mob (@s) at @s - hit by nearby active ravager convoy (tagged gg_active_convoy)
# Guard: only hit if not already rammed recently
execute if entity @s[tag=gg_rammed] run return 0

# 1. Fetch active ravager remaining capacity
scoreboard players set #cap gg.calc 0
execute as @e[tag=gg_active_convoy,limit=1] run scoreboard players operation #cap gg.calc = @s gg.convoy_cap
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

# 4. If mob HP <= ravager capacity: ravager has enough capacity to KILL this mob!
# Deduct mob_hp from ravager capacity
execute if score #mob_hp gg.calc <= #cap gg.calc as @e[tag=gg_active_convoy,limit=1] run scoreboard players operation @s gg.convoy_cap -= #mob_hp gg.calc
# Deal lethal damage to mob:
execute if score #mob_hp gg.calc <= #cap gg.calc run damage @s 100000 minecraft:generic
execute if score #mob_hp gg.calc <= #cap gg.calc run tag @s remove gg_mob
execute if score #mob_hp gg.calc <= #cap gg.calc run tag @s remove path_mob
execute if score #mob_hp gg.calc <= #cap gg.calc if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #mob_hp gg.calc <= #cap gg.calc run kill @s

# 5. If mob HP > ravager capacity: ravager does NOT have enough capacity to kill this mob!
# The mob takes #cap damage and survives. Ravager capacity becomes 0.
execute if score #mob_hp gg.calc > #cap gg.calc run scoreboard players operation #mob_hp gg.calc -= #cap gg.calc
execute if score #mob_hp gg.calc > #cap gg.calc as @e[tag=gg_active_convoy,limit=1] run scoreboard players set @s gg.convoy_cap 0
# Set mob's new reduced HP directly into its Health float
execute if score #mob_hp gg.calc > #cap gg.calc store result entity @s Health float 1.0 run scoreboard players get #mob_hp gg.calc
execute if score #mob_hp gg.calc > #cap gg.calc run data modify entity @s HurtTime set value 10s
execute if score #mob_hp gg.calc > #cap gg.calc run tag @s add gg_rammed
execute if score #mob_hp gg.calc > #cap gg.calc run scoreboard players set @s gg.ram_cd 60
execute if score #mob_hp gg.calc > #cap gg.calc run function gourd_guard:wave/mob_update_hp

# 6. If ravager capacity reached 0, kill the ravager immediately
execute as @e[tag=gg_active_convoy,limit=1,scores={gg.convoy_cap=..0}] run function gourd_guard:tower/convoy/on_convoy_death
