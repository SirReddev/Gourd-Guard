# Cutscene System - Start Intro Cutscene
# Usage: /function gourd_guard:cutscene/start
# Can be called from lobby button or admin command

# Ensure objectives initialized
function gourd_guard:cutscene/init

# Default to map 1 if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1

# Clean any existing cutscene entities before starting
function gourd_guard:cutscene/reset

# 1. Trigger smooth black fade post-effect transition
posteffect add @a gourd_guard:cutscene_fade

# 2. Hide HUD and set cutscene state (1 = Dialogue 1 Setup)
title @a actionbar {"text":""}
scoreboard players set .global cs.state 1

# 3. Schedule camera and Peeves setup behind black curtain (tick 15)
schedule function gourd_guard:cutscene/setup 15t
