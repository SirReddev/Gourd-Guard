# Pathfinding - Mob Reached End of Path (Goal reached)
# Runs as the mob that passed the last node on its route

# Stop mob from continuing path logic
scoreboard players set @s path.state 0
tag @s remove path_mob

# Deduct damage based on mob tier (Base has 1000 HP)
execute if entity @s[tag=gg_final_boss] run scoreboard players remove .objective obj_hp 250
execute if entity @s[tag=gg_boss,tag=!gg_final_boss] run scoreboard players remove .objective obj_hp 100
execute if entity @s[tag=gg_heavy,tag=!gg_boss] run scoreboard players remove .objective obj_hp 30
execute unless entity @s[tag=gg_boss,tag=gg_heavy,tag=gg_final_boss] run scoreboard players remove .objective obj_hp 10

# Play objective damage hit sound globally for ALL players on the server
execute as @a at @s run playsound gourd_guard:objective.hit hostile @s ~ ~ ~ 1 1

# Flash Pumpkin Objective to 'hit' variant briefly and refresh healthbar UI
function gourd_guard:pumpkin/hit
function gourd_guard:hud/objective/tick

# Announce in chat with remaining base health
execute if entity @s[tag=gg_final_boss] run tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" breached the base! Dealt ","color":"red"},{"text":"250 DMG","color":"dark_purple","bold":true},{"text":" to Base (HP: ","color":"gray"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]
execute if entity @s[tag=gg_boss,tag=!gg_final_boss] run tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal! Dealt ","color":"red"},{"text":"100 DMG","color":"gold","bold":true},{"text":" to Base (HP: ","color":"gray"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]
execute if entity @s[tag=gg_heavy,tag=!gg_boss] run tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal! Dealt ","color":"red"},{"text":"30 DMG","color":"yellow","bold":true},{"text":" to Base (HP: ","color":"gray"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]
execute unless entity @s[tag=gg_boss,tag=gg_heavy,tag=gg_final_boss] run tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal! Dealt ","color":"red"},{"text":"10 DMG","color":"yellow","bold":true},{"text":" to Base (HP: ","color":"gray"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]

# Trigger Game Over if Base HP reaches 0
execute if score .objective obj_hp matches ..0 run function gourd_guard:wave/game_over

# Teleport far into the void so no death particles, smoke, or item drops appear on the map
tp @s ~ -500 ~
kill @s
