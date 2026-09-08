# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# 1.21.4 block_state particle codec
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.25 ^1.05 ^1.20 run particle block{block_state:"minecraft:slime_block"} ~ ~ ~ 0.05 0.25 0.05 0.08 4 normal