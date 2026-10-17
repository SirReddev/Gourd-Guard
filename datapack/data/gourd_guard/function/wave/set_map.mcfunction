# Set Active Map
# Usage: /function gourd_guard:wave/set_map {map:1}
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
$scoreboard players set .global map $(map)
scoreboard players set .global wave 1
function gourd_guard:hud/wave/tick
tellraw @a [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Active Map set to Map ","color":"green"},{"score":{"name":".global","objective":"map"},"color":"gold","bold":true},{"text":". Wave reset to 1.","color":"green"}]
