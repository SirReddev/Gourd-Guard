# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Emit the slime particle directly at the exact locator position
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] run function aj:gourdguard_npc_witchstand/at_locator {name:"locator",command:"particle block{block_state:\"minecraft:slime_block\"} ~ ~ ~ 0.02 0.20 0.02 0.06 3 normal"}