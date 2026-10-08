# Reset Game State and Clean View after Victory Transition
function gourd_guard:wave/reset

# Optional Teleport to lobby
function gourd_guard:wave/transition/teleport_lobby

# Clear visual effects & titles
title @a clear
title @a reset
effect clear @a minecraft:darkness
effect clear @a minecraft:blindness
tellraw @a [{"text":"[Wave System] ","color":"green"},{"text":"Victory recorded! Ready for next playthrough!","color":"gold"}]
