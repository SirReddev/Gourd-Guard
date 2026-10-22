# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 0. Ensure convoy stats are initialized
scoreboard objectives add gg.convoy_cap dummy
scoreboard objectives add gg.calc dummy
execute unless score @s gg.convoy_cap matches 1.. store result score @s gg.convoy_cap run data get entity @s Health 1
execute unless score @s gg.convoy_cap matches 1.. run scoreboard players set @s gg.convoy_cap 300
execute unless score @s gg.convoy_dmg matches 1.. run scoreboard players set @s gg.convoy_dmg 45

# 1. Death check (Health or Capacity depleted)
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death
execute if score @s gg.convoy_cap matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Ram nearby wave mobs within 3.5 blocks (chains up to 3 mobs if capacity remains)
execute as @s at @s if entity @e[tag=gg_mob,tag=!gg_rammed,distance=..3.5] run function gourd_guard:tower/convoy/ram_attack
execute if score @s gg.convoy_cap matches 1.. as @s at @s if entity @e[tag=gg_mob,tag=!gg_rammed,distance=..3.5] run function gourd_guard:tower/convoy/ram_attack
execute if score @s gg.convoy_cap matches 1.. as @s at @s if entity @e[tag=gg_mob,tag=!gg_rammed,distance=..3.5] run function gourd_guard:tower/convoy/ram_attack
