# gourd_guard:lobby/start_display/click
# Triggered when a player right-clicks the Start Game display interaction hitbox

data remove entity @s interaction
playsound minecraft:ui.button.click master @a ~ ~ ~ 1.0 1.0
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 0.8 1.2

# Check if game or cutscene is already running
execute if score .wave state matches 1..2 run tellraw @a[distance=..15] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"A game is already in progress!","color":"red"}]
execute if score .wave state matches 1..2 return 1

execute if score .global cs.state matches 1..3 run tellraw @a[distance=..15] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Intro cutscene is already in progress!","color":"red"}]
execute if score .global cs.state matches 1..3 return 1

# Start the game cutscene!
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Game starting! Launching intro cutscene...","color":"green","bold":true}]
function gourd_guard:cutscene/start
