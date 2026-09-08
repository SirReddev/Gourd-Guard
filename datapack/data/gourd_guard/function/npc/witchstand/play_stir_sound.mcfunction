# gourd_guard:npc/witchstand/play_stir_sound
scoreboard players set #witch_stir gg.timer 0

# Play stirring potion sound at the cauldron locator (close range ~5 blocks)
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] run function aj:gourdguard_npc_witchstand/at_locator {name:"locator",command:"playsound gourd_guard:npc.witchstand.stir neutral @a[distance=..5] ~ ~ ~ 0.35 1.0 0.0"}