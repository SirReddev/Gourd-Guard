# gourd_guard:hud/init_player_head
# Generates a player head for @s using enderchest and mounts an invisible item_display holding it

loot replace entity @s enderchest.0 loot gourd_guard:player_head
execute at @s run kill @e[type=item_display,tag=gg_player_head,distance=..1]
execute at @s run summon item_display ~ ~ ~ {Tags:["gg_player_head"],view_range:0.0f}
ride @e[type=item_display,tag=gg_player_head,distance=..0.5,limit=1] mount @s
item replace entity @e[type=item_display,tag=gg_player_head,distance=..0.5,limit=1] contents from entity @s enderchest.0
item replace entity @s enderchest.0 with air
tag @s add gg_has_head
