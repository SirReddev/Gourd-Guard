# gourd_guard:npc/glow/on
# Enables glowing outlines for all village shop NPCs & Peeves during grace period

# 1. Witch (Alchemilla - Magenta / Purple)
team join team_magenta @e[type=item_display,tag=aj.gourdguard_npc_witchstand.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

# 2. Blacksmith (Ferrus - Gold / Orange)
team join team_gold @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

# 3. Archer (Robin - Lime / Green)
team join team_lime @e[type=item_display,tag=aj.gourdguard_npc_archerstand.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

# 4. Gravedigger (Mort - Cyan / Blue)
team join team_cyan @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

# 5. Peeves (Ghost Guide - Aqua)
team join team_aqua @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco]
execute as @e[type=item_display,tag=aj.gourdguard_npc_ghost.entity,tag=!gg_npc_deco] run data modify entity @s Glowing set value 1b

