# gourd_guard:pumpkin/summon
# Summons the Gourd Guard Pumpkin objective model, locks vertical pitch to 0, and plays idle animation.

execute unless score .wave state matches 1..2 rotated ~ 0 run function aj:gourdguard_pumpkin/summon {args:{variant:"default",animation:"idle",start_animation:true}}
execute if score .wave state matches 1..2 rotated ~ 0 run function aj:gourdguard_pumpkin/summon {args:{variant:"on",animation:"idle",start_animation:true}}

# Stabilize text display: set vertical billboard and disable interpolation jitter
execute as @e[type=text_display,tag=aj.gourdguard_pumpkin.node.text_display,distance=..5] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
execute as @e[type=text_display,tag=aj.gourdguard_pumpkin.node.text_display,distance=..5] run tag @s add gg_pumpkin_text_stabilized
