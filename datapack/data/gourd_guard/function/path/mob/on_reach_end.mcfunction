# Pathfinding - Mob Reached End of Path
# Runs as the mob that has passed the last node on its route
# ============================================================
# CUSTOMIZE THIS for your tower defense damage/scoring logic!
# ============================================================

# Stop this mob from continuing path logic
scoreboard players set @s path.state 0
tag @s remove path_mob

# TODO: Replace with your tower defense base-damage logic
# e.g. scoreboard players add #base_hp gourd_guard -1
#      function gourd_guard:base/take_damage
tellraw @a [{"text":"☠ ","color":"dark_red"},{"selector":"@s"},{"text":" reached the goal!","color":"red","bold":true}]
kill @s
