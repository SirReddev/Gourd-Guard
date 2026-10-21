# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 1. Death check: if ravager HP dropped to 0 or below, kill rider and despawn
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Ram cooldown decrement
execute if score @s gg.convoy_ram_cd matches 1.. run scoreboard players remove @s gg.convoy_ram_cd 1

# 3. Collision detection against living wave mobs (within 3.5 blocks, only when ram cooldown ready)
execute unless score @s gg.convoy_ram_cd matches 1.. run tag @e[tag=gg_convoy_target] remove gg_convoy_target
execute unless score @s gg.convoy_ram_cd matches 1.. run tag @e[tag=gg_mob,tag=!gg_boss,distance=..3.5,limit=1,sort=nearest] add gg_convoy_target
execute unless score @s gg.convoy_ram_cd matches 1.. unless entity @e[tag=gg_convoy_target] run tag @e[tag=gg_mob,distance=..3.5,limit=1,sort=nearest] add gg_convoy_target
execute unless score @s gg.convoy_ram_cd matches 1.. if entity @e[tag=gg_convoy_target] run function gourd_guard:tower/convoy/exchange_damage
tag @e[tag=gg_convoy_target] remove gg_convoy_target
