# Disable Adventure Mode Flight (Called when game ends or resets)

scoreboard players set .global fly_active 0
scoreboard players set @a fly_status 0
scoreboard players set @a fly_hold 0

# Strip locked Gourd Glider and flight rockets
item replace entity @a armor.chest with air
clear @a minecraft:elytra
clear @a minecraft:firework_rocket

# Clear effects
effect clear @a minecraft:levitation
effect clear @a minecraft:slow_falling
