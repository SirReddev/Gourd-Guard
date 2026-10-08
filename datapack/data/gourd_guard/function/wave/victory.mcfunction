# Victory - All 40 Waves Cleared!
scoreboard players set .wave state 3
scoreboard players set .global timer_active 0

# Stop timer audio
stopsound @a record gourd_guard:hud.timer10s

# Clean remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# Play custom Victory sound effect
playsound gourd_guard:game.won record @a ~ ~ ~ 1.0 1.0 1

# Display brief Victory title
title @a times 5 55 15
title @a title {"text":"VICTORY!","color":"gold","bold":true}
title @a subtitle {"text":"YOU DEFENDED THE GOURD FROM ALL 40 WAVES!","color":"yellow","bold":true}

# Spawn giant boss candy loot burst at players
execute as @a at @s run loot spawn ~ ~1 ~ loot gourd_guard:candy/boss
execute as @a at @s run loot spawn ~ ~1 ~ loot gourd_guard:candy/large

tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":" CONGRATULATIONS! You successfully completed all 40 Waves! The Pumpkin is saved!","color":"yellow"}]

# Schedule cinematic black fade (3 seconds / 60 ticks)
schedule function gourd_guard:wave/transition/fade_black 60t

# Schedule full playthrough reset while screen is black (6.5 seconds / 130 ticks)
schedule function gourd_guard:wave/transition/victory_reset 130t
