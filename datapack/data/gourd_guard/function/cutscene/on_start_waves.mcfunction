# Cutscene System - Start Map Waves from Peeves
# Called when player confirms "Start now!" in Peeves dialogue

function chatbox:shop/close
scoreboard players set .global cs.state 0

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Get ready, the first wave is approaching!","color":"yellow"}]

# Start wave 1 on current map
function gourd_guard:wave/start
