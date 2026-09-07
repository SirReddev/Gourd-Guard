scoreboard players remove .global wave 1
execute if score .global wave matches ..0 run scoreboard players set .global wave 1
function gourd_guard:hud/wave/tick
