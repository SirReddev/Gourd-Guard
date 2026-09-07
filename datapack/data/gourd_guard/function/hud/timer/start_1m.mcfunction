scoreboard players set .global timer_min 1
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Started 1-Minute Match Timer!","color":"yellow"}]