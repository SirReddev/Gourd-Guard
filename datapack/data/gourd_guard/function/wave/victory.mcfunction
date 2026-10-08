# Victory - All 40 Waves Cleared!
scoreboard players set .wave state 3
scoreboard players set .global timer_active 0

# Clean remaining mobs
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# Massive celebration audio & title
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.0 1
title @a title {"text":"VICTORY!","color":"gold","bold":true}
title @a subtitle {"text":"YOU DEFENDED THE GOURD FROM ALL 40 WAVES!","color":"yellow","bold":true}

# Spawn giant boss candy loot burst at players
execute as @a at @s run loot spawn ~ ~1 ~ loot gourd_guard:candy/boss
execute as @a at @s run loot spawn ~ ~1 ~ loot gourd_guard:candy/large

tellraw @a [{"text":"[Wave System] ","color":"gold","bold":true},{"text":" CONGRATULATIONS! You successfully completed all 40 Waves! The Pumpkin is saved!","color":"yellow"}]
