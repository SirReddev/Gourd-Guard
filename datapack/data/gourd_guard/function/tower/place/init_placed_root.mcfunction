tag @s add gg_tower_placed
scoreboard players operation @s gg.tower_id = #new_tid gg.tower_id
scoreboard players operation @s gg.tower_type = #spawn_type gg.tower_type
scoreboard players set @s gg.tower_lvl 1

# Set default sell value per tower type (Firework Cannon = 10 Candy)
execute if score @s gg.tower_type matches 1 run scoreboard players set @s gg.tower_sell 10

# Update the text_display passenger with LVL:1, Name, [MOVE], and [SELL:10]
function gourd_guard:tower/placed/update_text

# Summon the two clickable interaction hitboxes for [MOVE] and [SELL]
summon minecraft:interaction ~ ~3.0 ~ {width:0.55f,height:0.35f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_move","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..4] run function gourd_guard:tower/place/init_btn

summon minecraft:interaction ~ ~3.0 ~ {width:0.65f,height:0.35f,response:1b,Tags:["gg_tower_btn","gg_tower_btn_sell","gg_tower_btn_new"]}
execute as @n[type=interaction,tag=gg_tower_btn_new,distance=..4] run function gourd_guard:tower/place/init_btn
