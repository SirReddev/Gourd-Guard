scoreboard players set .global timer_min 5
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 0
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Timer reset to 5:00 (Paused)","color":"gray"}]