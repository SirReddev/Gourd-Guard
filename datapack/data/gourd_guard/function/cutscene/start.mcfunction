# Cutscene System - Start Intro Cutscene
# Usage: /function gourd_guard:cutscene/start
# Spawns Peeves at Node 0 for the active map

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

# 2. Reset timer & set cutscene state (1 = Dialogue 1)
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1

# 3. Setup and spawn Peeves at Node 0
function gourd_guard:cutscene/setup
