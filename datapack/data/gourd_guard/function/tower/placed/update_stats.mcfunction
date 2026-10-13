# Executed as a placed tower root entity (@s)
execute unless score @s gg.tower_lvl matches 1..5 run scoreboard players set @s gg.tower_lvl 1

# Type 1: Firework Cannon
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 30
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 45
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 22
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 10

execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 26
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 65
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 32
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 18

execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 22
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 95
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 48
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 28

execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 18
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 140
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 70
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 42

execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 14
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 210
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 105
execute if score @s gg.tower_type matches 1 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 60

# Type 2: Copper Golem Launcher
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 40
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 60
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 30
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 15

execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 34
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 90
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 45
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 25

execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 28
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 135
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 65
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 40

execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 22
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 200
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 100
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 60

execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 16
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 300
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 150
execute if score @s gg.tower_type matches 2 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 85

# Type 3: Pillager Convoy
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 500
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 500
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 25

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 440
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 750
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 45

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 380
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 1100
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 70

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 320
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 1500
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 100

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 260
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 2000
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 140

function gourd_guard:tower/placed/update_text
