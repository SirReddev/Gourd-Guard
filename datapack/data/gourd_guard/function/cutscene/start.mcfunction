# Cutscene System - Start Intro Cutscene
# Usage: /function gourd_guard:cutscene/start
# Spawns Peeves at Node 0 for the active map and transitions player to start spot

# Ensure objectives initialized
function gourd_guard:cutscene/init
function gourd_guard:lobby/stats/init

# Increment playthroughs counter if not already active
execute unless score #game_active gg_stats matches 1 run scoreboard players add #stats_plays gg_stats 1
scoreboard players set #game_active gg_stats 1
function gourd_guard:lobby/stats/update

# Default to map 1 if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# Clean any existing cutscene entities and reset candy before starting
function gourd_guard:cutscene/reset
function gourd_guard:hud/reset_candy
scoreboard objectives add gg_skip trigger

# 1. Tag all active players as viewers and remove gourd_test builder tag
tag @a remove gourd_test
tag @a add cs_viewer

# 2. Put viewers into Adventure mode & disable fall damage
gamemode adventure @a[gamemode=!creative]
gamerule fallDamage false

# 3. Add black fade post-effect transition (0t..15t fade to black, 15t..40t solid black, 40t..55t fade back to clear)
posteffect add @a[tag=cs_viewer] gourd_guard:cutscene_fade

# 4. Enable Adventure Mode Flight immediately from map start
function gourd_guard:fly/enable

# 5. Reset cutscene state & initialize tick timer (handled deterministically by cutscene/tick)
scoreboard players set .wave state 0
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1
scoreboard players set .global timer_active 0
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0

# 6. Fallback / direct schedule in case tick isn't running immediately
schedule function gourd_guard:cutscene/setup 15t
schedule function gourd_guard:cutscene/clear_posteffect 50t
schedule function gourd_guard:cutscene/dialogue_1 55t
