tag @s add gg_tower_placed
scoreboard players operation @s gg.tower_id = #new_tid gg.tower_id
scoreboard players operation @s gg.tower_type = #spawn_type gg.tower_type
scoreboard players operation @s gg.tower_lvl = #spawn_lvl gg.tower_lvl
scoreboard players set @s gg.tower_cd 10

# Explicitly ensure default variant texture on all passenger bones
execute if score @s gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/variants/default/apply
execute if score @s gg.tower_type matches 1 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_firework_cannon"
execute if score @s gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/variants/default/apply
execute if score @s gg.tower_type matches 2 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_copper_golem_launcher"
execute if score @s gg.tower_type matches 2 on passengers if entity @s[type=text_display] run data merge entity @s {transformation:[1f,0f,0f,0.0031f,0f,1f,0f,2.4553f,0f,0f,1f,0.0236f,0f,0f,0f,1f]}
execute if score @s gg.tower_type matches 3 run function aj:gourdguard_tower_pillager_convoy/variants/default/apply
execute if score @s gg.tower_type matches 3 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_pillager_convoy"
execute if score @s gg.tower_type matches 4 run function aj:gourdguard_tower_cauldron_damage/variants/default/apply
execute if score @s gg.tower_type matches 4 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_cauldron_damage"
execute if score @s gg.tower_type matches 4 run function aj:gourdguard_tower_cauldron_damage/animations/idle/play
execute if score @s gg.tower_type matches 5 run function aj:gourdguard_tower_tesla_coil/variants/default/apply
execute if score @s gg.tower_type matches 5 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_tesla_coil"
execute if score @s gg.tower_type matches 6 run function aj:gourdguard_tower_cauldron_poison/variants/default/apply
execute if score @s gg.tower_type matches 6 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_cauldron_poison"
execute if score @s gg.tower_type matches 6 run function aj:gourdguard_tower_cauldron_poison/animations/idle/play
execute if score @s gg.tower_type matches 7 run function aj:gourdguard_tower_cauldron_slowness/variants/default/apply
execute if score @s gg.tower_type matches 7 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_cauldron_slowness"
execute if score @s gg.tower_type matches 7 run function aj:gourdguard_tower_cauldron_slowness/animations/idle/play
execute if score @s gg.tower_type matches 8 run function aj:gourdguard_tower_magic_altar/variants/default/apply
execute if score @s gg.tower_type matches 8 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_magic_altar"

execute if score @s gg.tower_type matches 9 run function aj:gourdguard_tower_scarecrow/variants/default/apply
execute if score @s gg.tower_type matches 9 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_scarecrow"
execute if score @s gg.tower_type matches 10 run function aj:gourdguard_tower_fortune_pillar/variants/default/apply
execute if score @s gg.tower_type matches 10 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_fortune_pillar"
execute if score @s gg.tower_type matches 11 run function aj:gourdguard_tower_ballista/variants/default/apply
execute if score @s gg.tower_type matches 11 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_ballista"

# Apply level-based combat stats (range, cooldown, damage, splash, sell value) and update text display
function gourd_guard:tower/placed/update_stats
execute on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f
execute on passengers if entity @s[type=text_display] run data merge entity @s {billboard:"vertical"}

# Summon separate interaction hitboxes over each action label.
execute if score @s gg.tower_type matches 1 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 2 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 3 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 4 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 5 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 6 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 7 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 8 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn
execute if score @s gg.tower_type matches 9 run summon minecraft:interaction ~-0.5 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 10 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 11 run summon minecraft:interaction ~-1.25 ~0.8 ~ {width:0.8f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn

execute if score @s gg.tower_type matches 1 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 2 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 3 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 4 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 5 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 6 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 7 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 8 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn
execute if score @s gg.tower_type matches 9 run summon minecraft:interaction ~0.5 ~1.0 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 10 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 11 run summon minecraft:interaction ~-0.3 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn

# Summon [UPGRADE] and [STATS] interaction buttons for all towers EXCEPT scarecrow (type 9)
execute if score @s gg.tower_type matches 1 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 2 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 3 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 4 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 5 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 6 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 7 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 8 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 10 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 11 run summon minecraft:interaction ~0.65 ~1.1 ~ {width:1.0f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_upgrade","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn

execute if score @s gg.tower_type matches 1 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 2 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 3 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 4 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 5 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 6 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 7 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 8 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 10 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute if score @s gg.tower_type matches 11 run summon minecraft:interaction ~1.65 ~0.9 ~ {width:0.9f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_stats","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..6] run function gourd_guard:tower/place/init_btn