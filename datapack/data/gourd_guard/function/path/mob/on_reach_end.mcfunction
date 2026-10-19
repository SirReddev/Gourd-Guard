# Pathfinding - Mob Reached End of Path (Goal reached)
# Runs as the mob that passed the last node on its route

# Pillager Convoys defend the objective; they safely despawn at the pumpkin without damaging it!
execute if entity @s[tag=gg_convoy] run return run function gourd_guard:tower/convoy/on_reach_end

# Stop mob from continuing path logic
scoreboard players set @s path.state 0
tag @s remove path_mob

# Deduct damage equal to the mob's remaining HP (Base has 1000 HP)
execute store result score #mob_dmg obj_hp run data get entity @s Health 1
execute if score #mob_dmg obj_hp matches ..0 run scoreboard players set #mob_dmg obj_hp 1
scoreboard players operation .objective obj_hp -= #mob_dmg obj_hp
execute if score .objective obj_hp matches ..0 run scoreboard players set .objective obj_hp 0

# Play objective damage hit sound globally for ALL players on the server
execute as @a at @s run playsound gourd_guard:objective.hit hostile @s ~ ~ ~ 1 1

# Flash Pumpkin Objective to 'hit' variant briefly and refresh healthbar UI
function gourd_guard:pumpkin/hit
function gourd_guard:hud/objective/tick

# Announce in chat with exact HP damage dealt and remaining base health
tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the gourd! Dealt ","color":"red"},{"score":{"name":"#mob_dmg","objective":"obj_hp"},"color":"gold","bold":true},{"text":" damage to the gourd (HP: ","color":"red"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]

# Trigger Game Over if Base HP reaches 0
execute if score .objective obj_hp matches ..0 run function gourd_guard:wave/game_over

# Teleport far into the void so no death particles, smoke, or item drops appear on the map
tp @s ~ -500 ~
kill @s
