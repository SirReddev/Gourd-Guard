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

# Defeat title displays above the screen fade
title @a times 10 110 20
title @a title {"text":"DEFEAT","color":"dark_red","bold":true}
title @a subtitle [{"text":"The Pumpkin Objective was destroyed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"GAME OVER! The base was overwhelmed on Wave ","color":"red"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":"!","color":"red"}]

# 2. Trigger screen transition immediately so the world fades to black behind the title!
schedule function gourd_guard:wave/transition/fade_black 10t

# 3. Reset the game state during solid black hold (tick 60)
schedule function gourd_guard:wave/transition/game_over_reset 60t
