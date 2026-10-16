# Disable Adventure Mode Flight (Called after the fade when game ends or victory)

scoreboard players set .global fly_active 0
scoreboard players set @a fly_status 0
scoreboard players set @a fly_start 0

effect clear @a minecraft:levitation
effect clear @a minecraft:slow_falling
