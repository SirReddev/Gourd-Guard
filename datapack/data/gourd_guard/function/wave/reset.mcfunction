# Manual Full Reset: Reset all data, stop sounds, clear screen titles & posteffects
function gourd_guard:wave/reset_data

# Stop Sounds & Clear Screen Titles
title @a clear
title @a reset
posteffect remove @a gourd_guard:fade_black
stopsound @a record gourd_guard:game.over
stopsound @a record gourd_guard:game.won
stopsound @a record gourd_guard:hud.timer10s

tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"All waves, active mobs, candies, timers, and Base HP (1000) have been reset!","color":"green"}]
