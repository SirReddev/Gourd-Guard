# gourd_guard:npc/witchstand/tick
# Intermittent slime blob popping out of the cauldron and landing nearby

scoreboard players add #witch_slime aj.i 1
execute if score #witch_slime aj.i matches 16.. run function gourd_guard:npc/witchstand/pop_slime