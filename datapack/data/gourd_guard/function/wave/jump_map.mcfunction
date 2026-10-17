# Jump to a specific wave on a specific map
# Usage: /function gourd_guard:wave/jump_map {map:1,wave:10}
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
$scoreboard players set .global map $(map)
$scoreboard players set .global wave $(wave)
function gourd_guard:hud/wave/tick
$tellraw @a [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Map $(map) Wave $(wave) starting...","color":"yellow"}]
function gourd_guard:wave/start
