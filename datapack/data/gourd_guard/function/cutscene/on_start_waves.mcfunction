# Cutscene System - Start Map Waves from Peeves
# Called when player confirms "Start now!" in Peeves dialogue

function chatbox:selection/close
scoreboard players set .global cs.state 0

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Get ready, the first wave is approaching!","color":"yellow"}]

# Start game timer (counting up from 0:00)
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1

# Start wave 1 on current map
function gourd_guard:wave/start
