# gourd_guard:pumpkin/set_default
# Switches all Gourd Guard Pumpkin models to the 'default' variant

scoreboard players set #pumpkin_hit gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_default"
tag @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] add gg_variant_default
tag @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] remove gg_variant_on
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/default/apply
