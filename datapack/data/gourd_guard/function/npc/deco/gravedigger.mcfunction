# gourd_guard:npc/deco/gravedigger
# Summons decorative Gravedigger (Mort) with digging animation, no dialogue/shop logic

execute at @s rotated ~ 0 run function aj:gourdguard_npc_gravediggerstand/summon {args:{animation:"digging",start_animation:true}}
execute as @e[type=text_display,tag=aj.gourdguard_npc_gravediggerstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
tag @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco
tag @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco_gravedigger
execute as @e[type=item_display,tag=gg_npc_deco_gravedigger,distance=..3] at @s as @e[type=!player,distance=..3] run tag @s add gg_npc_deco
execute as @e[type=interaction,tag=gg_npc_interaction,distance=..3] run kill @s
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned decorative Gravedigger.","color":"yellow"}]

