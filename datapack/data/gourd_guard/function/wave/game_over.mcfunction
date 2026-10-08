# Game Over - Pumpkin Objective Destroyed
scoreboard players set .wave state 4
scoreboard players set .global timer_active 0

# Stop timer audio
stopsound @a record gourd_guard:hud.timer10s

# Stop all remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# Play custom Game Over sound effect
playsound gourd_guard:game.over record @a ~ ~ ~ 1.0 1.0 1

# Display brief Defeat title
title @a times 5 45 15
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Pumpkin Objective was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"GAME OVER! The base was overwhelmed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":". Resetting for next game...","color":"gray"}]

# Schedule cinematic black fade (2 seconds / 40 ticks)
schedule function gourd_guard:wave/transition/fade_black 40t

# Schedule full playthrough reset while screen is black (4.5 seconds / 90 ticks)
schedule function gourd_guard:wave/transition/game_over_reset 90t
