# gourd_guard:npc/deco/archer
# Summons decorative Archer (Robin) with idle animation, no dialogue/shop logic

execute at @s rotated ~ 0 run function aj:gourdguard_npc_archerstand/summon {args:{animation:"idle",start_animation:true}}
execute as @e[type=text_display,tag=aj.gourdguard_npc_archerstand.node.text_display,distance=..3] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
tag @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco
tag @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root,distance=..3,limit=1,sort=nearest] add gg_npc_deco_archer
execute as @e[type=item_display,tag=gg_npc_deco_archer,distance=..3] at @s as @e[type=!player,distance=..3] run tag @s add gg_npc_deco
execute as @e[type=interaction,tag=gg_npc_interaction,distance=..3] run kill @s
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned decorative Archer.","color":"yellow"}]

