# Keep the tower's sale value equal to its original shop price.
scoreboard players set #base_sell coins 0
execute if score @s gg.tower_type matches 1 run scoreboard players set #base_sell coins 10
execute if score @s gg.tower_type matches 2 run scoreboard players set #base_sell coins 20
execute if score @s gg.tower_type matches 3 run scoreboard players set #base_sell coins 45
execute if score @s gg.tower_type matches 4 run scoreboard players set #base_sell coins 25
execute if score @s gg.tower_type matches 5 run scoreboard players set #base_sell coins 35
execute if score @s gg.tower_type matches 6 run scoreboard players set #base_sell coins 35
execute if score @s gg.tower_type matches 7 run scoreboard players set #base_sell coins 30
execute if score @s gg.tower_type matches 8 run scoreboard players set #base_sell coins 45
execute if score @s gg.tower_type matches 9 run scoreboard players set #base_sell coins 80
execute if score @s gg.tower_type matches 10 run scoreboard players set #base_sell coins 60
execute if score @s gg.tower_type matches 11 run scoreboard players set #base_sell coins 30
