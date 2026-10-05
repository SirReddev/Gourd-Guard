# Pathfinding - Mob Reached End of Path (Goal reached)
# Runs as the mob that passed the last node on its route

# Stop mob from continuing path logic
scoreboard players set @s path.state 0
tag @s remove path_mob

# Deduct 10 damage from base healthbar objective
scoreboard players remove .objective obj_hp 10

# Play objective damage hit sound globally for ALL players on the server
execute as @a at @s run playsound gourd_guard:objective.hit hostile @s ~ ~ ~ 1 1

# Refresh the healthbar UI
function gourd_guard:hud/objective/tick

# Announce in chat with remaining base health
tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal! Dealt ","color":"red"},{"text":"10 DMG","color":"yellow","bold":true},{"text":" to Base (HP: ","color":"gray"},{"score":{"name":".objective","objective":"obj_hp"},"color":"green","bold":true},{"text":")","color":"gray"}]

# Teleport far into the void so no death particles, smoke, or item drops appear on the map
tp @s ~ -500 ~
kill @s
