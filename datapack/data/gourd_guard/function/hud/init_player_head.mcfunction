# gourd_guard:hud/init_player_head
# Creates an invisible item_display riding the player that stores their profile name

execute at @s run kill @e[type=item_display,tag=gg_player_head,distance=..2]
execute at @s run summon item_display ~ ~ ~ {Tags:["gg_player_head"],view_range:0.0f}
loot replace entity @e[type=item_display,tag=gg_player_head,distance=..1,limit=1] container.0 loot gourd_guard:player_head
ride @e[type=item_display,tag=gg_player_head,distance=..1,limit=1] mount @s
tag @s add gg_has_head
