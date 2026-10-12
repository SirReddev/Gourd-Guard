# gourd_guard:pumpkin/tick
# Ensures all Gourd Guard Pumpkins are always playing their idle animation, have stabilized name tags, and handles the brief hit flash timer.

# 1. Always keep idle animation playing on all pumpkin instances
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root,tag=!aj.gourdguard_pumpkin.animation.idle.playing] run function aj:gourdguard_pumpkin/animations/idle/play

# 2. Ensure text display billboard is stabilized
execute as @e[type=text_display,tag=aj.gourdguard_pumpkin.node.text_display,tag=!gg_pumpkin_text_stabilized] run data merge entity @s {billboard:"vertical",interpolation_duration:0,teleport_duration:0}
execute as @e[type=text_display,tag=aj.gourdguard_pumpkin.node.text_display,tag=!gg_pumpkin_text_stabilized] run tag @s add gg_pumpkin_text_stabilized

# 3. Handle hit flash countdown timer
execute if score #pumpkin_hit gg.timer matches 1 run function gourd_guard:pumpkin/hit_end
execute if score #pumpkin_hit gg.timer matches 2.. run scoreboard players remove #pumpkin_hit gg.timer 1

# 4. Keep all pumpkins in 'on' variant during active game (state 1..2) and 'default' otherwise (when not flashing hit)
execute unless score #pumpkin_hit gg.timer matches 1.. if score .wave state matches 1..2 as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] unless data entity @s {item:{components:{"minecraft:custom_model_data":{strings:["gourdguard_pumpkin_on"]}}}} run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_on"
execute unless score #pumpkin_hit gg.timer matches 1.. unless score .wave state matches 1..2 as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] unless data entity @s {item:{components:{"minecraft:custom_model_data":{strings:["gourdguard_pumpkin_default"]}}}} run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_default"
