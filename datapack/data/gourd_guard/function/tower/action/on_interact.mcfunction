# Executed as & at the clicked interaction button entity (right-click)
scoreboard players operation #btn_tid gg.tower_id = @s gg.tower_id

tag @e[type=player,tag=gg_clicked_player] remove gg_clicked_player
execute on target run tag @s add gg_clicked_player
execute unless entity @a[tag=gg_clicked_player] as @p[distance=..6] run tag @s add gg_clicked_player

execute if entity @s[tag=gg_tower_btn_move] as @a[tag=gg_clicked_player,limit=1] run function gourd_guard:tower/action/do_move
execute if entity @s[tag=gg_tower_btn_sell] as @a[tag=gg_clicked_player,limit=1] run function gourd_guard:tower/action/do_sell

tag @a[tag=gg_clicked_player] remove gg_clicked_player
data remove entity @s interaction
