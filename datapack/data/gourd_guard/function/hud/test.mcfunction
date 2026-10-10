# gourd_guard:hud/test
# Immediately displays the intermission HUD with the timer extension tab for testing

scoreboard players set @s hud_toggle 1
scoreboard players set .wave state 2
scoreboard players set .wave timer_min 0
scoreboard players set .wave timer_sec 15
scoreboard players set .wave timer_ticks 0
scoreboard players set .global wave 1
scoreboard players set .global wave_mobs 0

tellraw @s [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Testing Intermission HUD (Timer Tab, 0:15). Type ","color":"yellow"},{"text":"/function gourd_guard:hud/test_stop","color":"aqua","underlined":true,"clickEvent":{"action":"run_command","value":"/function gourd_guard:hud/test_stop"}},{"text":" to stop.","color":"yellow"}]
