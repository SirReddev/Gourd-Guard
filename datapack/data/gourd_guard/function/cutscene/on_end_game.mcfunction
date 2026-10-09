# Cutscene System - End Wave Game from Peeves
# Called when player confirms "End game" in Peeves dialogue while game is active

function chatbox:selection/close

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Stopping the waves and resetting the game!","color":"yellow"}]

# Run wave reset to stop mobs, timers, and waves
function gourd_guard:wave/reset

# Reset cutscene state so Peeves can be spoken with again to start
scoreboard players set .global cs.state 4
