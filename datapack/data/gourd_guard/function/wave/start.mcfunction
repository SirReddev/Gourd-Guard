# Start Current Wave
execute unless score .global wave matches 1..40 run scoreboard players set .global wave 1

# Set state to 1 (Active Wave)
scoreboard players set .wave state 1
scoreboard players set .wave spawn_timer 0
scoreboard players set .wave spawn_done 0

# Pause intermission timer
scoreboard players set .global timer_active 0
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0

# Refresh wave HUD
function gourd_guard:hud/wave/tick

tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"Wave ","color":"green"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":" has begun! Defend the Pumpkin!","color":"green"}]
