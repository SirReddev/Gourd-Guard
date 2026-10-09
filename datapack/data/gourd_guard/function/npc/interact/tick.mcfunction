# gourd_guard:npc/interact/tick
# Auto-ensures all NPC stands have active interaction hitboxes and handles right-click interactions

# Auto-spawn interaction hitbox for any existing NPC stand missing one
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s unless entity @e[type=interaction,tag=gg_witch_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_witch_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root] at @s unless entity @e[type=interaction,tag=gg_blacksmith_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_blacksmith_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root] at @s unless entity @e[type=interaction,tag=gg_archer_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_archer_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root] at @s unless entity @e[type=interaction,tag=gg_gravedigger_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_gravedigger_interaction"]}
execute as @e[type=item_display,tag=peeves_ghost_root] at @s unless entity @e[type=interaction,tag=gg_peeves_interaction,distance=..2.5] run summon minecraft:interaction ~ ~-0.5 ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_peeves_interaction"]}

# Keep Peeves hitbox aligned with Peeves root
execute as @e[type=interaction,tag=gg_peeves_interaction] at @e[type=item_display,tag=peeves_ghost_root,limit=1] run tp @s ~ ~-0.5 ~

# Checks for right-click player interaction on NPC interaction entities (executes as the interacting player at the hitbox)
execute as @e[type=minecraft:interaction,tag=gg_npc_interaction] if data entity @s interaction at @s as @p[distance=..5] run function gourd_guard:npc/interact/handle
