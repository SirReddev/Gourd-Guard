# gourd_guard:npc/gravediggerstand/dirt_splash
# Example helper to emit dirt particles at the gravedigger shovel locator

execute as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root] run function aj:gourdguard_npc_gravediggerstand/at_locator {name:"locator",command:"particle block{block_state:\"minecraft:coarse_dirt\"} ~ ~ ~ 0.08 0.15 0.08 0.08 6 normal"}