scoreboard players add .global coins 1
scoreboard players operation @a coins = .global coins
playsound minecraft:entity.item.pickup player @p[distance=..3.0] ~ ~ ~ 1.0 1.0 1
kill @s