# Victory - All 40 Waves Cleared!
scoreboard players set .wave state 3
scoreboard players set .global timer_active 0

# Stop timer audio & reset intermission timer
stopsound @a record gourd_guard:hud.timer10s
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0

# Clean remaining mobs & reset Pumpkin variant
kill @e[tag=path_mob]
kill @e[tag=gg_mob]
function gourd_guard:pumpkin/set_default

# 1. Play custom Victory sound effect & Title together
playsound gourd_guard:game.won record @a ~ ~ ~ 1.0 1.0 1

# Victory title displays above the screen fade
title @a times 10 200 20
title @a title {"text":"VICTORY!","color":"gold","bold":true}
title @a subtitle {"text":"YOU DEFENDED THE GOURD FROM ALL 40 WAVES!","color":"yellow","bold":true}

tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":" CONGRATULATIONS! You successfully completed all 40 Waves! The Pumpkin is saved!","color":"yellow"}]

# 2. Trigger screen transition at tick 10: 2s fade in to black, 8s black hold, 2s fade out
schedule function gourd_guard:wave/transition/fade_black 10t

# 3. Reset the game state during solid black hold (tick 80)
schedule function gourd_guard:wave/transition/victory_reset 80t
