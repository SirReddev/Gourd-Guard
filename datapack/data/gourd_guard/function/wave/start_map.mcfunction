# Start waves on a specific map
# Usage: /function gourd_guard:wave/start_map {map:1}
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
$scoreboard players set .global map $(map)
function gourd_guard:wave/start
