# Full Reset of Wave System, Mobs, Base HP, Timers, and HUD

# 1. Stop Wave System
scoreboard players set .wave state 0
scoreboard players set .wave spawn_timer 0
scoreboard players set .wave spawn_done 0

# 2. Reset Wave Number & Active Mobs
scoreboard players set .global wave 1
scoreboard players set .global wave_mobs 0

# 3. Kill all active mobs on map
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# 4. Reset Objective Base Healthbar (1000 HP)
scoreboard players set .objective obj_max_hp 1000
scoreboard players set .objective obj_hp 1000
function gourd_guard:hud/objective/tick

# 5. Reset Timers & HUD
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 0
function gourd_guard:hud/wave/tick

# 6. Audio & Chat Notification
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1.0 1.0 1
title @a title {"text":"WAVES RESET","color":"yellow","bold":true}
title @a subtitle {"text":"Wave 1 ready. Base HP restored to 1000.","color":"gray"}
tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"All waves, active mobs, timers, and Base HP (1000) have been reset!","color":"green"}]
