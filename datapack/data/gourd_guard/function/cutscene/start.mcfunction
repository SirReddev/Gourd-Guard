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

# 3. Add black fade post-effect transition
posteffect add @a[tag=cs_viewer] gourd_guard:cutscene_fade

# 4. Teleport player to start place (set via /function gourd_guard:cutscene/node/set_start)
scoreboard players operation TargetMap cs.cmp = .global map
tag @e[tag=cs_player_start] remove cs_target_start
execute as @e[tag=cs_player_start] if score @s cs.map = TargetMap cs.cmp run tag @s add cs_target_start
execute if entity @e[tag=cs_target_start] as @a[tag=cs_viewer] at @e[tag=cs_target_start,limit=1] run tp @s ~ ~ ~ ~ ~

# 5. Reset timer & set cutscene state (1 = Dialogue 1)
scoreboard players set .global cs.timer 0
scoreboard players set .global cs.state 1

# 6. Setup and spawn Peeves at Node 0
function gourd_guard:cutscene/setup

# 7. Fallback teleport if cs_player_start wasn't set (positions player facing Peeves)
execute unless entity @e[tag=cs_target_start] if entity @e[tag=cs_start_npc] as @a[tag=cs_viewer] at @e[tag=cs_start_npc,limit=1] positioned ^ ^ ^-3 rotated ~ 0 run tp @s ~ ~ ~ ~ 0

# 8. Clear black fade transition after screen fade completes (15 ticks)
schedule function gourd_guard:cutscene/clear_posteffect 15t
