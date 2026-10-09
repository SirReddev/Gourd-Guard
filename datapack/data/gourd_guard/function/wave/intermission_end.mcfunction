# Intermission ended naturally or skipped
stopsound @a record gourd_guard:hud.timer10s
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0
scoreboard players add .global wave 1
function gourd_guard:wave/start
