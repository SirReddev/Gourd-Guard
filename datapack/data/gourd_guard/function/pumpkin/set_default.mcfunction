# gourd_guard:pumpkin/set_default
# Switches all Gourd Guard Pumpkin models back to the 'default' variant

scoreboard players set #pumpkin_hit gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_default"
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/default/apply
