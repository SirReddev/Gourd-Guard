# gourd_guard:npc/witchstand/remove_all
# Removes all Witchstand NPC models in loaded chunks
function aj:gourdguard_npc_witchstand/remove/all
kill @e[type=interaction,tag=gg_witch_interaction]
stopsound @a neutral gourd_guard:npc.witchstand.stir
scoreboard players set #witch_stir gg.timer 0