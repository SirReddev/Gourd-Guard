# gourd_guard:npc/interact/handle
# Executed as the player (@s) at the location of the interaction entity (~ ~ ~)

# Clear interaction data on the hitbox so it doesn't queue up
execute as @e[type=minecraft:interaction,tag=gg_npc_interaction,distance=..2.5] run data remove entity @s interaction

# Lock NPC interactions until Peeves has completed his final dialogue line
execute if score .global cs.state matches 1..3 run tellraw @s [{"text":"[Peeves] ","color":"aqua"},{"text":"Peeves is speaking! Listen to him first.","color":"gold"}]
execute if score .global cs.state matches 1..3 run return 0

# If this player already has an open session, close it cleanly first so they can switch NPCs or re-open
execute if score @s chatbox.session matches 1..4 run function chatbox:session/release

execute if entity @e[type=minecraft:interaction,tag=gg_witch_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/witch
execute if entity @e[type=minecraft:interaction,tag=gg_archer_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/archer
execute if entity @e[type=minecraft:interaction,tag=gg_blacksmith_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/blacksmith
execute if entity @e[type=minecraft:interaction,tag=gg_gravedigger_interaction,distance=..2.5,limit=1] run function gourd_guard:npc/interact/gravedigger
execute if entity @e[type=minecraft:interaction,tag=gg_peeves_interaction,distance=..2.5,limit=1] unless score .global cs.state matches 1..3 run function gourd_guard:cutscene/talk
