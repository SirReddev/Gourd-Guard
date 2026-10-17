# Disable Adventure Mode Flight (Called when game ends or resets)

scoreboard players set .global fly_active 0
scoreboard players set @a fly_status 0
scoreboard players set @a fly_hold 0

# Strip locked Gourd Glider and flight rockets
clear @a minecraft:elytra[minecraft:custom_data={gg_glider:1b}]
clear @a minecraft:firework_rocket[minecraft:custom_data={gg_rocket:1b}]

# Clear effects
effect clear @a minecraft:levitation
effect clear @a minecraft:slow_falling
