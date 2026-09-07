# Initialize Wave HUD scoreboard objectives
scoreboard objectives add wave dummy
scoreboard objectives add wave_mobs dummy
scoreboard objectives add wave_hud_toggle dummy

# Initialize default values
execute unless score .global wave matches 1.. run scoreboard players set .global wave 1
execute unless score .global wave_mobs matches 0.. run scoreboard players set .global wave_mobs 10
execute unless score .global wave_hud_toggle matches 0..1 run scoreboard players set .global wave_hud_toggle 1

# Run initial tick to populate storage
function gourd_guard:hud/wave/tick
