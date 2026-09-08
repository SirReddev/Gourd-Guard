# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Green slime droplet popping straight out of the exact center of the cauldron brew
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.30 ^0.85 ^0.92 run particle block{block_state:"minecraft:slime_block"} ~ ~ ~ 0.02 0.20 0.02 0.06 3 normal