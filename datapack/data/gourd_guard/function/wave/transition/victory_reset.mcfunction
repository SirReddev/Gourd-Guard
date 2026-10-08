# Reset Game State behind black screen curtain
function gourd_guard:wave/reset

# Optional Teleport to lobby
function gourd_guard:wave/transition/teleport_lobby

tellraw @a [{"text":"[Wave System] ","color":"green"},{"text":"Victory recorded! Ready for next playthrough!","color":"gold"}]
