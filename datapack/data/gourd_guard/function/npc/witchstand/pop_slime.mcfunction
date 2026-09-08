# gourd_guard:npc/witchstand/pop_slime
scoreboard players set #witch_slime gg.timer 0

# Green slime droplet bouncing right out of the center of the cauldron liquid
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s positioned ^-0.35 ^0.95 ^1.10 run particle block{block_state:"minecraft:slime_block"} ~ ~ ~ 0.04 0.22 0.04 0.08 4 normal