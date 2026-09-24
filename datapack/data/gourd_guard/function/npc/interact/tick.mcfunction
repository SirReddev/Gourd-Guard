# gourd_guard:npc/interact/tick
# Checks for right-click player interaction on NPC interaction entities

execute as @e[type=minecraft:interaction,tag=gg_npc_interaction] if data entity @s interaction at @s on target run function gourd_guard:npc/interact/handle
