# gourd_guard:npc/interact/handle
# Executed as the player (@s) at the location of the interaction entity (~ ~ ~)

execute if entity @e[type=minecraft:interaction,tag=gg_witch_interaction,distance=..1.5,limit=1] run function gourd_guard:npc/interact/witch
execute if entity @e[type=minecraft:interaction,tag=gg_archer_interaction,distance=..1.5,limit=1] run function gourd_guard:npc/interact/archer
execute if entity @e[type=minecraft:interaction,tag=gg_blacksmith_interaction,distance=..1.5,limit=1] run function gourd_guard:npc/interact/blacksmith
execute if entity @e[type=minecraft:interaction,tag=gg_gravedigger_interaction,distance=..1.5,limit=1] run function gourd_guard:npc/interact/gravedigger

# Clear the interaction tag so it can be clicked again
execute as @e[type=minecraft:interaction,tag=gg_npc_interaction,distance=..1.5] run data remove entity @s interaction
