# Initialize Objective Health Bar scoreboard objectives
scoreboard objectives add obj_hp dummy
scoreboard objectives add obj_max_hp dummy
scoreboard objectives add obj_step dummy
scoreboard objectives add obj_hud_toggle dummy
scoreboard objectives add obj_math dummy

# Initialize default values
execute unless score .objective obj_max_hp matches 1.. run scoreboard players set .objective obj_max_hp 1000
execute unless score .objective obj_hp matches 0.. run scoreboard players set .objective obj_hp 1000
execute unless score .global obj_hud_toggle matches 0..1 run scoreboard players set .global obj_hud_toggle 1

# Run initial tick to populate storage
function gourd_guard:hud/objective/tick
