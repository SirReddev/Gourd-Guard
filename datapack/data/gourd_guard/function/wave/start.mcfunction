# Start Current Wave on Active Map
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add wave_mobs dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
scoreboard objectives add wave.state dummy
scoreboard objectives add wave.timer dummy
scoreboard objectives add wave.spawn_timer dummy
scoreboard objectives add wave.spawn_done dummy
scoreboard objectives add timer dummy
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
scoreboard objectives add obj_hp dummy
scoreboard objectives add obj_max_hp dummy

execute unless score .global map matches 1..5 run scoreboard players set .global map 1
execute unless score .global wave matches 1..40 run scoreboard players set .global wave 1

# Set state to 1 (Active Wave)
scoreboard players set .wave state 1
scoreboard players set .wave spawn_timer 0
scoreboard players set .wave spawn_done 0

# Ensure game timer is active (counting up)
execute unless score .global timer_active matches 1 run scoreboard players set .global timer_min 0
execute unless score .global timer_active matches 1 run scoreboard players set .global timer_sec 0
execute unless score .global timer_active matches 1 run scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 1

# Reset and stop intermission timer
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0
stopsound @a record gourd_guard:hud.timer10s

# Switch Pumpkin Objective to 'on' variant
function gourd_guard:pumpkin/set_on

# Refresh wave HUD
function gourd_guard:hud/wave/tick

tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"Map ","color":"green"},{"score":{"name":".global","objective":"map"},"color":"aqua","bold":true},{"text":" Wave ","color":"green"},{"score":{"name":".global","objective":"wave"},"color":"gold","bold":true},{"text":" has begun! Defend the Pumpkin!","color":"green"}]
