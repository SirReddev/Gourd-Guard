scoreboard players set .global timer_ticks 0

# Game Timer count up logic
scoreboard players add .global timer_sec 1
execute if score .global timer_sec matches 60.. run scoreboard players add .global timer_min 1
execute if score .global timer_sec matches 60.. run scoreboard players set .global timer_sec 0