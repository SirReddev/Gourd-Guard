tag @s add gg_tower_placed
scoreboard players operation @s gg.tower_id = #new_tid gg.tower_id
scoreboard players operation @s gg.tower_type = #spawn_type gg.tower_type
scoreboard players set @s gg.tower_lvl 1
scoreboard players set @s gg.tower_cd 10

# Explicitly ensure default variant texture on all passenger bones
execute if score @s gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/variants/default/apply
execute if score @s gg.tower_type matches 1 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_firework_cannon"
execute if score @s gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/variants/default/apply
execute if score @s gg.tower_type matches 2 on passengers if entity @s[type=item_display] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_tower_copper_golem_launcher"

# Apply level-based combat stats (range, cooldown, damage, splash, sell value) and update text display
function gourd_guard:tower/placed/update_stats
execute on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f

# Summon the two clickable interaction hitboxes for [MOVE] and [SELL]
summon minecraft:interaction ~ ~3.0 ~ {width:0.6f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..4] run function gourd_guard:tower/place/init_btn

summon minecraft:interaction ~ ~3.0 ~ {width:0.7f,height:0.4f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..4] run function gourd_guard:tower/place/init_btn
