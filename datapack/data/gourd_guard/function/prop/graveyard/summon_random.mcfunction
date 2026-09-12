# gourd_guard:prop/graveyard/summon_random
# Summons a random graveyard grave prop (1 to 11) at current position and rotation

execute store result score #rnd gg.calc run random value 1..11
execute if score #rnd gg.calc matches 1 run function gourd_guard:prop/graveyard/grave1/summon
execute if score #rnd gg.calc matches 2 run function gourd_guard:prop/graveyard/grave2/summon
execute if score #rnd gg.calc matches 3 run function gourd_guard:prop/graveyard/grave3/summon
execute if score #rnd gg.calc matches 4 run function gourd_guard:prop/graveyard/grave4/summon
execute if score #rnd gg.calc matches 5 run function gourd_guard:prop/graveyard/grave5/summon
execute if score #rnd gg.calc matches 6 run function gourd_guard:prop/graveyard/grave6/summon
execute if score #rnd gg.calc matches 7 run function gourd_guard:prop/graveyard/grave7/summon
execute if score #rnd gg.calc matches 8 run function gourd_guard:prop/graveyard/grave8/summon
execute if score #rnd gg.calc matches 9 run function gourd_guard:prop/graveyard/grave9/summon
execute if score #rnd gg.calc matches 10 run function gourd_guard:prop/graveyard/grave10/summon
execute if score #rnd gg.calc matches 11 run function gourd_guard:prop/graveyard/grave11/summon