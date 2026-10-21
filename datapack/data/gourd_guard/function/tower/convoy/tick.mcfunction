# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 1. Death check: if ravager HP dropped to 0 or below, kill rider and despawn
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Ram cooldown decrement
execute if score @s gg.convoy_ram_cd matches 1.. run scoreboard players remove @s gg.convoy_ram_cd 1

# 3. Collision attack against living wave mobs (within 3.0 blocks, only when ram cooldown ready)
execute unless score @s gg.convoy_ram_cd matches 1.. at @s if entity @e[tag=gg_mob,distance=..3.0] run function gourd_guard:tower/convoy/exchange_damage
