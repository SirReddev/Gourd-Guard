scoreboard players remove .global wave_mobs 1
execute if score .global wave_mobs matches ..-1 run scoreboard players set .global wave_mobs 0
function gourd_guard:hud/wave/tick
