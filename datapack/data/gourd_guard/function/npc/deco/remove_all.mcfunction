# gourd_guard:npc/deco/remove_all
# Removes all decorative NPCs in the world

execute as @e[type=item_display,tag=gg_npc_deco] at @s as @e[type=interaction,tag=gg_npc_interaction,distance=..3] run kill @s
execute as @e[type=item_display,tag=gg_npc_deco_witch] at @s run function aj:gourdguard_npc_witchstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_blacksmith] at @s run function aj:gourdguard_npc_blacksmithstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_archer] at @s run function aj:gourdguard_npc_archerstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_gravedigger] at @s run function aj:gourdguard_npc_gravediggerstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_peeves] at @s run function aj:gourdguard_npc_ghost/remove/this
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Removed all decorative NPCs!","color":"green","bold":true}]

