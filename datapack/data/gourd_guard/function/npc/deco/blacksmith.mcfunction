# gourd_guard:npc/deco/blacksmith
# Summons decorative Blacksmith (Ferrus) with smithing animation, no dialogue/shop logic

execute rotated ~ 0 run function aj:gourdguard_npc_blacksmithstand/summon {args:{animation:"smithing",start_animation:true}}
execute as @e[type=text_display,tag=aj.gourdguard_npc_blacksmithstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
tag @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco
tag @e[type=item_display,tag=aj.gourdguard_npc_blacksmithstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco_blacksmith
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned decorative Blacksmith.","color":"yellow"}]
