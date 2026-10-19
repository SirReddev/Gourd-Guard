execute if score @s gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/variants/placeholder/apply
execute if score @s gg.tower_type matches 1 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_firework_cannon_placeholder"
execute if score @s gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/variants/placeholder/apply
execute if score @s gg.tower_type matches 2 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_copper_golem_launcher_placeholder"
execute if score @s gg.tower_type matches 3 run function aj:gourdguard_tower_pillager_convoy/variants/placeholder/apply
execute if score @s gg.tower_type matches 3 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_pillager_convoy_placeholder"
execute if score @s gg.tower_type matches 4 run function aj:gourdguard_tower_cauldron_damage/variants/placeholder/apply
execute if score @s gg.tower_type matches 4 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_cauldron_damage_placeholder"
execute if score @s gg.tower_type matches 5 run function aj:gourdguard_tower_tesla_coil/variants/placeholder/apply
execute if score @s gg.tower_type matches 5 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_tesla_coil_placeholder"
execute on passengers if entity @s[type=text_display] run data modify entity @s text set value ""
execute on passengers if entity @s[type=text_display] run data modify entity @s background set value 0
