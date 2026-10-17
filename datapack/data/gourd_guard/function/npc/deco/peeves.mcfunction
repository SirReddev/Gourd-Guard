# gourd_guard:npc/deco/peeves
# Summons decorative Peeves Ghost with idle animation, no dialogue/cutscene logic

execute at @s positioned ~ ~0.6 ~ rotated ~ 0 run function aj:gourdguard_npc_ghost/summon {args:{animation:"idle",start_animation:true}}
execute as @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..3,limit=1,sort=nearest] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive
execute as @e[tag=aj.gourdguard_npc_ghost.entity,distance=..4] run data modify entity @s Invulnerable set value 1b
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco
tag @e[type=item_display,tag=aj.gourdguard_npc_ghost.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco_peeves
execute as @e[type=item_display,tag=gg_npc_deco_peeves,distance=..3] at @s as @e[type=!player,distance=..3] run tag @s add gg_npc_deco
execute as @e[type=interaction,tag=gg_npc_interaction,distance=..3] run kill @s
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned decorative Peeves.","color":"yellow"}]

