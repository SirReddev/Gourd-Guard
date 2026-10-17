# gourd_guard:npc/deco/remove
# Removes the nearest decorative NPC within 6 blocks

execute as @e[type=item_display,tag=gg_npc_deco_witch,distance=..6,limit=1,sort=nearest] at @s run function aj:gourdguard_npc_witchstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_blacksmith,distance=..6,limit=1,sort=nearest] at @s run function aj:gourdguard_npc_blacksmithstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_archer,distance=..6,limit=1,sort=nearest] at @s run function aj:gourdguard_npc_archerstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_gravedigger,distance=..6,limit=1,sort=nearest] at @s run function aj:gourdguard_npc_gravediggerstand/remove/this
execute as @e[type=item_display,tag=gg_npc_deco_peeves,distance=..6,limit=1,sort=nearest] at @s run function aj:gourdguard_npc_ghost/remove/this
execute as @e[type=interaction,tag=gg_npc_interaction,distance=..6] run kill @s
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Removed nearest decorative NPC.","color":"yellow"}]


