# gourd_guard:lobby/start_display/click
# Triggered when a player right-clicks the Start Game display interaction hitbox

data remove entity @s interaction
data remove entity @s attack

# Play click audio to nearby players
playsound minecraft:ui.button.click master @a[distance=..20] ~ ~ ~ 1.0 1.0
playsound minecraft:entity.experience_orb.pickup master @a[distance=..20] ~ ~ ~ 0.8 1.2

# If clicker had gourd_test builder tag, remove it so they are included in the game
execute as @p[distance=..8] run tag @s remove gourd_test

# Cleanly reset previous game data and stuck cutscenes before starting
function gourd_guard:wave/reset_data
execute if score .global cs.state matches 1..3 run function gourd_guard:cutscene/reset

# Set map to 1 explicitly
scoreboard players set .global map 1

# Start Map 1!
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Starting Map 1: Haunted Graveyard!","color":"green","bold":true}]
function gourd_guard:cutscene/start
