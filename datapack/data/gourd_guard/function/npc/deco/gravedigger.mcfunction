# gourd_guard:npc/deco/gravedigger
# Summons decorative Gravedigger (Mort) with digging animation, no dialogue/shop logic

execute rotated ~ 0 run function aj:gourdguard_npc_gravediggerstand/summon {args:{animation:"digging",start_animation:true}}
execute as @e[type=text_display,tag=aj.gourdguard_npc_gravediggerstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
tag @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco
tag @e[type=item_display,tag=aj.gourdguard_npc_gravediggerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco_gravedigger
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned decorative Gravedigger.","color":"yellow"}]
