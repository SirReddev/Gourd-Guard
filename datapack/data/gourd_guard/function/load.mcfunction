scoreboard objectives add gg.timer dummy

# Clean up legacy first-interaction objectives if they exist
scoreboard objectives remove gg.talked_witch
scoreboard objectives remove gg.talked_archer
scoreboard objectives remove gg.talked_blacksmith
scoreboard objectives remove gg.talked_gravedigger

# Gourd Guard Datapack Initialized
function gourd_guard:item_glow/setup_teams
function gourd_guard:hud/setup

# Wave System Objectives
scoreboard objectives add wave.state dummy
scoreboard objectives add wave.timer dummy
scoreboard objectives add wave.spawn_timer dummy
scoreboard objectives add wave.spawn_done dummy
execute unless score .global wave matches 1.. run scoreboard players set .global wave 1
execute unless score .wave state matches 0.. run scoreboard players set .wave state 0