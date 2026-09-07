scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 10
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1
playsound gourd_guard:hud.timer10s record @a ~ ~ ~ 1 1 1
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Started 10-Second Countdown!","color":"yellow"}]