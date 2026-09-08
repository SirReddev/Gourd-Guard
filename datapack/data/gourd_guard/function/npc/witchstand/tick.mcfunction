# gourd_guard:npc/witchstand/tick
# Periodic green slime bounce out of the cauldron

scoreboard players add #witch_slime gg.timer 1
execute if score #witch_slime gg.timer matches 45.. run function gourd_guard:npc/witchstand/pop_slime