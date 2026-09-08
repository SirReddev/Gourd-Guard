# gourd_guard:npc/witchstand/tick
# Periodic green slime bounce out of the cauldron
scoreboard players add #witch_slime gg.timer 1
execute if score #witch_slime gg.timer matches 45.. run function gourd_guard:npc/witchstand/pop_slime

# Cauldron stirring sound loop (~6.85s / 137 ticks)
execute if entity @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] run scoreboard players add #witch_stir gg.timer 1
execute if score #witch_stir gg.timer matches 137.. run function gourd_guard:npc/witchstand/play_stir_sound