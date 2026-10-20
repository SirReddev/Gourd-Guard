# gourd_guard:pumpkin/set_on
# Switches all Gourd Guard Pumpkin models to the 'on' variant

scoreboard players set #pumpkin_hit gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_on"
tag @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] add gg_variant_on
tag @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] remove gg_variant_default
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/on/apply
