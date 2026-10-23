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
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 900
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 30
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 25

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 800
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 45
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 45

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 700
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 65
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 70

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 600
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 90
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 100

execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 500
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 125
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 3 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 140

# Type 4: Cauldron Damage
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 55
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 35
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 50
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 16

execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 48
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 50
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 75
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 26

execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 40
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 70
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 110
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 40

execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 32
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 100
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 160
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 60

execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 24
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 140
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 240
execute if score @s gg.tower_type matches 4 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 90

# Type 5: Tesla Coil
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 60
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 150
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 50
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 22

execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 50
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 220
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 75
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 38

execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 40
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 320
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 110
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 60

execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 30
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 460
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 160
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 90

execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 20
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 650
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 220
execute if score @s gg.tower_type matches 5 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 130

# Type 6: Cauldron Poison
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 50
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 50
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 25
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 23

execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 42
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 75
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 40
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 36

execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 35
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 110
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 60
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 55

execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 28
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 160
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 90
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 80

execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 20
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 240
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 130
execute if score @s gg.tower_type matches 6 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 120

# Type 7: Cauldron Slowness
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 45
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 20
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_slow_dur 100

execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 38
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 32
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_slow_dur 120

execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 32
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 50
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_slow_dur 140

execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 26
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 75
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_slow_dur 160

execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 18
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 110
execute if score @s gg.tower_type matches 7 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_slow_dur 200

# Type 8: Magic Altar
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 35
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 110
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 55
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 30

execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 30
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 165
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 85
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 48

execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 25
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 240
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 120
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 72

execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 20
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 350
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 175
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 105

execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 14
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 520
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 260
execute if score @s gg.tower_type matches 8 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 155

function gourd_guard:tower/placed/update_text

# Type 9: Scarecrow (single-use trap, no levels or combat CD)
execute if score @s gg.tower_type matches 9 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 9 run scoreboard players set @s gg.tower_dmg 500
execute if score @s gg.tower_type matches 9 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 9 run scoreboard players set @s gg.tower_sell 8

# Type 10: Fortune Pillar (passive, upgradeable 1-5)
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 20

execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 32

execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 50

execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 75

execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 9999
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 10 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 110

# Type 11: Ballista (damage tower, upgradeable 1-5)
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_max_cd 30
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_dmg 80
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 1 run scoreboard players set @s gg.tower_sell 18

execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_max_cd 25
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_dmg 120
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 2 run scoreboard players set @s gg.tower_sell 30

execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_max_cd 20
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_dmg 180
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 3 run scoreboard players set @s gg.tower_sell 48

execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_max_cd 16
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_dmg 260
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 4 run scoreboard players set @s gg.tower_sell 72

execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_max_cd 12
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_dmg 380
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_splash 0
execute if score @s gg.tower_type matches 11 if score @s gg.tower_lvl matches 5 run scoreboard players set @s gg.tower_sell 105
