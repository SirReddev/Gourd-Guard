# gourd_guard:npc/interact/ensure_hitboxes
# Reset interval check timer
scoreboard players set #npc_check gg.timer 0

# Auto-spawn interaction hitbox for any existing NPC stand missing one
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] at @s unless entity @e[type=interaction,tag=gg_witch_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_witch_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root] at @s unless entity @e[type=interaction,tag=gg_blacksmith_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_blacksmith_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root] at @s unless entity @e[type=interaction,tag=gg_archer_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_archer_interaction"]}
execute as @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root] at @s unless entity @e[type=interaction,tag=gg_gravedigger_interaction,distance=..2.5] run summon minecraft:interaction ~ ~ ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_gravedigger_interaction"]}
execute unless score .global cs.state matches 1..3 as @e[type=item_display,tag=peeves_ghost_root] at @s unless entity @e[type=interaction,tag=gg_peeves_interaction,distance=..2.5] run summon minecraft:interaction ~ ~-0.5 ~ {width:2.0f,height:2.0f,response:1b,Tags:["gg_npc_interaction","gg_peeves_interaction"]}

# Maintain NPC glowing throughout grace period (before waves begin)
execute if score .global cs.state matches 4 unless score .wave state matches 1.. run function gourd_guard:npc/glow/on
