# gourd_guard:npc/blacksmithstand/spark
# Example helper to emit sparks / lava particles at the blacksmith locator

execute as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root] run function aj:gourdguard_npc_blacksmithstand/at_locator {name:"locator",command:"particle lava ~ ~ ~ 0.05 0.05 0.05 0.02 4 normal"}