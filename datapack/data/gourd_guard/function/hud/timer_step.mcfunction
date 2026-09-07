scoreboard players set .global timer_ticks 0

# Countdown logic
execute if score .global timer_sec matches 1.. run scoreboard players remove .global timer_sec 1
execute unless score .global timer_sec matches 1.. if score .global timer_min matches 1.. run function gourd_guard:hud/timer_minute_down

# Trigger 10-second countdown audio
execute if score .global timer_min matches 0 if score .global timer_sec matches 10 run playsound gourd_guard:hud.timer10s record @a ~ ~ ~ 1 1 1