scoreboard objectives add gg.timer dummy

# Clean up legacy first-interaction objectives if they exist
scoreboard objectives remove gg.talked_witch
scoreboard objectives remove gg.talked_archer
scoreboard objectives remove gg.talked_blacksmith
scoreboard objectives remove gg.talked_gravedigger

# Gourd Guard Datapack Initialized
function gourd_guard:item_glow/setup_teams
function gourd_guard:hud/setup