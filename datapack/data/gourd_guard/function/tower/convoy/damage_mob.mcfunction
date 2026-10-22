# Executed as the wave mob (@s) at @s in close range of a ravager convoy
# Ram each mob ONCE per encounter (prevent continuous ticking while passing through)
execute if entity @s[tag=gg_rammed] run return 0
execute if score @s gg.ram_cd matches 1.. run return 0
tag @s add gg_rammed
scoreboard players set @s gg.ram_cd 100

# Audio & visual impact effects
playsound minecraft:entity.ravager.attack master @a[distance=..20] ~ ~ ~ 0.9 1.0
playsound minecraft:entity.generic.hurt master @a[distance=..20] ~ ~ ~ 0.8 1.0
particle minecraft:sweep_attack ~ ~1 ~ 0.3 0.2 0.3 0.0 5
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 8
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.05 6

# Reset hurt time and deal damage directly ONCE!
data modify entity @s HurtTime set value 0s
execute if score #convoy_dmg gg.calc matches 45 run damage @s 45 generic
execute if score #convoy_dmg gg.calc matches 65 run damage @s 65 generic
execute if score #convoy_dmg gg.calc matches 90 run damage @s 90 generic
execute if score #convoy_dmg gg.calc matches 125 run damage @s 125 generic
execute unless score #convoy_dmg gg.calc matches 45 unless score #convoy_dmg gg.calc matches 65 unless score #convoy_dmg gg.calc matches 90 unless score #convoy_dmg gg.calc matches 125 run damage @s 30 generic

# Deduct from ravager's total damage capacity
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if score #convoy_dmg gg.calc matches 45 run scoreboard players remove @s gg.convoy_cap 45
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if score #convoy_dmg gg.calc matches 65 run scoreboard players remove @s gg.convoy_cap 65
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if score #convoy_dmg gg.calc matches 90 run scoreboard players remove @s gg.convoy_cap 90
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if score #convoy_dmg gg.calc matches 125 run scoreboard players remove @s gg.convoy_cap 125
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] unless score #convoy_dmg gg.calc matches 45 unless score #convoy_dmg gg.calc matches 65 unless score #convoy_dmg gg.calc matches 90 unless score #convoy_dmg gg.calc matches 125 run scoreboard players remove @s gg.convoy_cap 30

# Also deal recoil damage to ravager entity health
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] run data modify entity @s HurtTime set value 0s
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] run damage @s 30 generic

# If ravager used up its total damage capacity or died, trigger death
execute as @e[tag=gg_convoy,distance=..3.5,limit=1,scores={gg.convoy_cap=..0}] run function gourd_guard:tower/convoy/on_convoy_death
execute as @e[tag=gg_convoy,distance=..3.5,limit=1] if data entity @s {Health:0.0f} run function gourd_guard:tower/convoy/on_convoy_death

# Update mob HP and floating text display
execute store result score #check_hp gg.calc run data get entity @s Health 10
execute if score #check_hp gg.calc matches 1.. run function gourd_guard:wave/mob_update_hp

# Kill handling if mob HP dropped to 0 or below
execute if score #check_hp gg.calc matches ..0 run tag @s remove gg_mob
execute if score #check_hp gg.calc matches ..0 run tag @s remove path_mob
execute if score #check_hp gg.calc matches ..0 if entity @s[type=magma_cube] at @s run kill @e[type=magma_cube,distance=..3,tag=!gg_mob]
execute if score #check_hp gg.calc matches ..0 run kill @s
