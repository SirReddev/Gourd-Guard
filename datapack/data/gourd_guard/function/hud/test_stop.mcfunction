# gourd_guard:hud/test_stop
# Stops the HUD test and returns HUD to idle

scoreboard players set .wave state 0
scoreboard players set .wave timer_min 0
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0

tellraw @s [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"HUD Test ended.","color":"gray"}]
