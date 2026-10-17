# Silent Data Reset: Mobs, Base HP, Timers, Candy, and Objectives
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy

# 1. Stop Wave System
execute unless score .wave state matches 3..4 run scoreboard players set .wave state 0
execute unless score .wave state matches 3..4 run function gourd_guard:fly/disable
scoreboard players set .wave spawn_timer 0
scoreboard players set .wave spawn_done 0

# 2. Reset Wave Number & Active Mobs
execute unless score .global map matches 1..5 run scoreboard players set .global map 1
scoreboard players set .global wave 1
scoreboard players set .global wave_mobs 0

# 3. Kill all active mobs on map
kill @e[tag=path_mob]
kill @e[tag=gg_mob]

# 4. Reset Objective Base Healthbar (1000 HP) & Pumpkin Variant
scoreboard players set .objective obj_max_hp 1000
scoreboard players set .objective obj_hp 1000
function gourd_guard:pumpkin/set_default
function gourd_guard:hud/objective/tick

# 5. Reset Timers & HUD
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0
scoreboard players set .global timer_active 0
scoreboard players set .wave timer_sec 0
scoreboard players set .wave timer_ticks 0
stopsound @a record gourd_guard:hud.timer10s
function gourd_guard:hud/wave/tick

# 6. Reset Candy / Coins, Clear Dropped Candies, Remove Placed Towers & Clear Player Inventories
function gourd_guard:hud/reset_candy
kill @e[tag=gg_candy]
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".candy run kill @s
function gourd_guard:tower/reset_all

# 7. Reset per-player NPC first-interaction states for new playthrough
scoreboard players reset * gg.talked_witch
scoreboard players reset * gg.talked_archer
scoreboard players reset * gg.talked_blacksmith
scoreboard players reset * gg.talked_gravedigger

# 8. Clean up posteffects and player tags
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black
tag @a remove gg_npc_deco

