# Executed as & at the clicked interaction button entity (right-click)
scoreboard players operation #btn_tid gg.tower_id = @s gg.tower_id
data remove entity @s interaction

execute if entity @s[tag=gg_tower_btn_move] as @p[distance=..6] run function gourd_guard:tower/action/do_move
execute if entity @s[tag=gg_tower_btn_sell] as @p[distance=..6] run function gourd_guard:tower/action/do_sell
