# Game Over - Pumpkin Objective Destroyed
scoreboard players set .wave state 4
scoreboard players set .global timer_active 0

# Stop timer audio
stopsound @a record gourd_guard:hud.timer10s

# Stop all remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# 1. Play custom Game Over sound effect & Title together
playsound gourd_guard:game.over record @a ~ ~ ~ 1.0 1.0 1

# Defeat title plays alongside the 7.5s sound effect
title @a times 5 140 10
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Pumpkin Objective was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"GAME OVER! The base was overwhelmed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

# 2. After the sound finishes (~7.5s / 155 ticks), trigger the Screen-fading transition
schedule function gourd_guard:wave/transition/fade_black 155t

# 3. Reset the game state during the Screen-fading transition (157 ticks)
schedule function gourd_guard:wave/transition/game_over_reset 157t
