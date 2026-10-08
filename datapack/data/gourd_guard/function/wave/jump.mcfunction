# Jump to a specific wave on active map
# Usage: /function gourd_guard:wave/jump {wave:15}
$scoreboard players set .global wave $(wave)
function gourd_guard:hud/wave/tick
$tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"Wave set to $(wave). Starting...","color":"yellow"}]
function gourd_guard:wave/start
