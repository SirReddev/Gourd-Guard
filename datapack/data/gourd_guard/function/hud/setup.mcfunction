scoreboard objectives add math dummy
scoreboard objectives add coins dummy
scoreboard objectives add coins_prev dummy
scoreboard objectives add coins_diff dummy
scoreboard objectives add coins_pop dummy
scoreboard objectives add coins_pop_type dummy
scoreboard objectives add timer_ticks dummy
scoreboard objectives add timer_sec dummy
scoreboard objectives add timer_min dummy
scoreboard objectives add timer_active dummy
scoreboard objectives add hud_toggle dummy

title @a times 0 100 0

# Initialize scores (Default: 0:00, paused until started)
execute unless score .global timer_min matches 0.. run scoreboard players set .global timer_min 0
execute unless score .global timer_sec matches 0.. run scoreboard players set .global timer_sec 0
execute unless score .global timer_ticks matches 0.. run scoreboard players set .global timer_ticks 0
execute unless score .global timer_active matches 0..1 run scoreboard players set .global timer_active 0

# Initialize Objective HUD
function gourd_guard:hud/objective/setup

# Initialize Wave HUD
function gourd_guard:hud/wave/setup

# Reset player head display bindings
tag @a remove gg_has_head
kill @e[type=item_display,tag=gg_player_head]
kill @e[type=marker,tag=gg_player_head]
data remove storage gourd_guard:hud macro.player