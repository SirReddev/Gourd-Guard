# Pathfinding - Mob Reached End of Path
# Runs as the mob that has passed the last node on its route

# Stop this mob from continuing path logic
scoreboard players set @s path.state 0
tag @s remove path_mob

# Default action: announce and kill mob
tellraw @a [{"text":"[!] ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal!","color":"red","bold":true}]
kill @s
