# Disable Adventure Mode Flight (Called after the fade when game ends or victory)

scoreboard players set .global fly_active 0
scoreboard players set @a fly_status 0
scoreboard players set @a fly_start 0
scoreboard players set @a fly_hold 0

# Remove locked Gourd Glider and rockets
item replace entity @a armor.chest with air
clear @a minecraft:elytra[unbreakable={}]
clear @a minecraft:firework_rocket[custom_data~{gg_rocket:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gg_rocket:1b}}}}]

effect clear @a minecraft:levitation
effect clear @a minecraft:slow_falling
