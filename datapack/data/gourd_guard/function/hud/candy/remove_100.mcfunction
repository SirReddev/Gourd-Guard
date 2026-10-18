scoreboard players remove .global coins 100
execute if score .global coins matches ..-1 run scoreboard players set .global coins 0
scoreboard players operation @a coins = .global coins