# Intermission Tick Loop
scoreboard players enable @a gg_skip
scoreboard players add .wave timer_ticks 1
execute if score .wave timer_ticks matches 20.. run function gourd_guard:wave/intermission_step
