# Disable Adventure Mode Flight (Called when game ends or resets)

scoreboard players set .global fly_active 0
scoreboard players set @a[tag=!gourd_test] fly_status 0
scoreboard players set @a[tag=!gourd_test] fly_hold 0

# Strip locked Gourd Glider and flight rockets (only from players, never builders)
clear @a[tag=!gourd_test] minecraft:elytra[minecraft:custom_data={gg_glider:1b}]
clear @a[tag=!gourd_test] minecraft:firework_rocket[minecraft:custom_data={gg_rocket:1b}]

# Clear effects
effect clear @a[tag=!gourd_test] minecraft:levitation
effect clear @a[tag=!gourd_test] minecraft:slow_falling
