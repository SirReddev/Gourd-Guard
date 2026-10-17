# gourd_guard:npc/interact/handle
# Executed as the player (@s) at the location of the interaction entity (~ ~ ~)

# Clear interaction data on the hitbox so it doesn't queue up
execute as @e[type=minecraft:interaction,tag=gg_npc_interaction,distance=..2.5] run data remove entity @s interaction

# Prevent opening another dialogue/shop if player is currently in an active sequence, shop, or selection
execute if data storage chatbox:main {SequenceActive:1b} run return 0
execute if data storage chatbox:shop {Active:1b} run return 0
execute if data storage chatbox:selection {Active:1b} run return 0

# If player had a lingering session score without an active UI, release it cleanly
execute if score @s chatbox.session matches 1..4 run function chatbox:session/release

execute if entity @e[type=minecraft:interaction,tag=gg_witch_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/witch
execute if entity @e[type=minecraft:interaction,tag=gg_archer_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/archer
execute if entity @e[type=minecraft:interaction,tag=gg_blacksmith_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/blacksmith
execute if entity @e[type=minecraft:interaction,tag=gg_gravedigger_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/gravedigger
execute if entity @e[type=minecraft:interaction,tag=gg_peeves_interaction,distance=..2.5,limit=1] unless score .global cs.state matches 1..3 run function gourd_guard:cutscene/talk
