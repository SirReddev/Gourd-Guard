# gourd_guard:npc/witchstand/tick
# Frequent popping slime bubbles shooting out of the potion & cauldron

scoreboard players add #witch_slime gg.timer 1
execute if score #witch_slime gg.timer matches 6.. run function gourd_guard:npc/witchstand/pop_slime