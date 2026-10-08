# Cutscene System - Reset
# Resets cutscene state and cleans up entities

scoreboard players set .global cs.state 0

# Remove camera & Peeves entities
kill @e[tag=gg_cutscene_cam]
kill @e[tag=peeves_mount]
kill @e[tag=aj.gourdguard_npc_ghost.entity]
kill @e[tag=gg_peeves_interaction]

# Remove post-effects
posteffect remove @a gourd_guard:cutscene_fade

# Restore players from spectator if needed
spectate @s @a[gamemode=spectator]
gamemode adventure @a[gamemode=spectator]
