# Victory - All 40 Waves Cleared!
scoreboard players set .wave state 3
scoreboard players set .global timer_active 0

# Stop timer audio
stopsound @a record gourd_guard:hud.timer10s

# Clean remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# 1. Play custom Victory sound effect & Title together (No beacon or extra toast sounds)
playsound gourd_guard:game.won record @a ~ ~ ~ 1.0 1.0 1

# Victory title plays alongside the 13s sound effect
title @a times 5 245 15
title @a title {"text":"VICTORY!","color":"gold","bold":true}
title @a subtitle {"text":"YOU DEFENDED THE GOURD FROM ALL 40 WAVES!","color":"yellow","bold":true}

tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":" CONGRATULATIONS! You successfully completed all 40 Waves! The Pumpkin is saved!","color":"yellow"}]

# 2. After the sound finishes (~13s / 265 ticks), trigger the Screen-fading transition
schedule function gourd_guard:wave/transition/fade_black 265t

# 3. Reset the game state during the Screen-fading transition (290 ticks)
schedule function gourd_guard:wave/transition/victory_reset 290t
