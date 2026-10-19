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

# 1. Tag all active players (excluding gourd_test builders) as viewers (fallback to @p if all tagged gourd_test)
tag @a[tag=!gourd_test] add cs_viewer
execute unless entity @a[tag=cs_viewer] run tag @p add cs_viewer
tag @a[tag=cs_viewer] remove gourd_test

# 2. Put viewers into Adventure mode
gamemode adventure @a[tag=cs_viewer]



# 3. Add black fade post-effect transition (0t..15t fade to black, 15t..40t solid black, 40t..55t fade back to clear)
posteffect add @a[tag=cs_viewer] gourd_guard:cutscene_fade

# 4. Reset cutscene state & stop game timer during black fade transition
scoreboard players set .wave state 0
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1
scoreboard players set .global timer_active 0
scoreboard players set .global timer_min 0
scoreboard players set .global timer_sec 0
scoreboard players set .global timer_ticks 0

# 5. At 15t (screen is solid black), execute setup: teleports player to start spot and spawns Peeves
schedule function gourd_guard:cutscene/setup 15t

# 6. At 50t (screen fade back is complete), cleanly clear post-effect so shader is inactive
schedule function gourd_guard:cutscene/clear_posteffect 50t

# 7. At 55t (screen is clear and no shader active), begin Dialogue 1
schedule function gourd_guard:cutscene/dialogue_1 55t
