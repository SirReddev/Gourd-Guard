# Full Reset of Wave System, Mobs, Base HP, Timers, Candy, and HUD
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy

# 1. Stop Wave System
scoreboard players set .wave state 0
scoreboard players set .wave spawn_timer 0
scoreboard players set .wave spawn_done 0

# 2. Reset Wave Number & Active Mobs
execute unless score .global map matches 1..5 run scoreboard players set .global map 1
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

# 6. Reset Candy / Coins & Clear Dropped Candies
function gourd_guard:hud/reset_candy
kill @e[tag=gg_candy]
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".candy run kill @s

# 7. Stop Sounds, Clear Screen Titles & Effects
title @a clear
title @a reset
effect clear @a minecraft:darkness
effect clear @a minecraft:blindness
stopsound @a record gourd_guard:game.over
stopsound @a record gourd_guard:game.won
stopsound @a record gourd_guard:hud.timer10s

playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1.0 1.0 1
tellraw @a [{"text":"[Wave System] ","color":"dark_green"},{"text":"All waves, active mobs, candies, timers, and Base HP (1000) have been reset!","color":"green"}]
