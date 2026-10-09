# Cutscene System - Start Intro Cutscene
# Usage: /function gourd_guard:cutscene/start
# Spawns Peeves at Node 0 for the active map and transitions player to start spot

# Ensure objectives initialized
function gourd_guard:cutscene/init

# Default to map 1 if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# Clean any existing cutscene entities before starting
function gourd_guard:cutscene/reset

# 1. Tag executing player as viewer
tag @a remove cs_viewer
tag @s add cs_viewer
execute unless entity @a[tag=cs_viewer] run tag @p add cs_viewer

# 2. Put viewer into Adventure mode
gamemode adventure @a[tag=cs_viewer]

# 3. Add black fade post-effect transition (0t..15t fade to black, 15t..40t solid black, 40t..55t fade back to clear)
posteffect add @a[tag=cs_viewer] gourd_guard:cutscene_fade

# 4. Reset timer & set cutscene state
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1

# 5. At 15t (screen is solid black), execute setup: teleports player to start spot and spawns Peeves
schedule function gourd_guard:cutscene/setup 15t

# 6. At 50t (screen fade back is complete), cleanly clear post-effect so shader is inactive
schedule function gourd_guard:cutscene/clear_posteffect 50t

# 7. At 55t (screen is clear and no shader active), begin Dialogue 1
schedule function gourd_guard:cutscene/dialogue_1 55t
