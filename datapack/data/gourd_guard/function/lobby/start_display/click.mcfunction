# gourd_guard:lobby/start_display/click
# Triggered when a player right-clicks the Start Game display interaction hitbox

data remove entity @s interaction
data remove entity @s attack

# Play click audio to nearby players
playsound minecraft:ui.button.click master @a[distance=..20] ~ ~ ~ 1.0 1.0
playsound minecraft:entity.experience_orb.pickup master @a[distance=..20] ~ ~ ~ 0.8 1.2

# Remove gourd_test builder tag so all players are included in the game
tag @a remove gourd_test

# If a previous game was active or cutscene was stuck, reset cleanly first
execute if score .wave state matches 1..4 run function gourd_guard:wave/reset_data
execute if score .global cs.state matches 1..4 run function gourd_guard:cutscene/reset

# Set map to 1 explicitly
scoreboard players set .global map 1

# Announce starting game
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Starting game…","color":"yellow"}]

# Start Map 1!
function gourd_guard:cutscene/start
