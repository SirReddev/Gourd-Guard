# Cutscene System - Start Intro Cutscene
# Usage: /function gourd_guard:cutscene/start
# Only targets the executing player (@s)

# Ensure objectives initialized
function gourd_guard:cutscene/init

# Default to map 1 if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# Clean any existing cutscene entities before starting
function gourd_guard:cutscene/reset

# 1. Tag only the player who ran the start command as viewer
tag @a remove cs_viewer
tag @s add cs_viewer
execute unless entity @a[tag=cs_viewer] run tag @p add cs_viewer

# 2. Trigger smooth black fade post-effect transition for viewer
posteffect add @a[tag=cs_viewer] gourd_guard:cutscene_fade

# 3. Reset timer & set cutscene state (1 = Dialogue 1 Setup)
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1

# 4. Schedule camera and Peeves setup behind black curtain (tick 15)
schedule function gourd_guard:cutscene/setup 15t
