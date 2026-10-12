tag @s add gg_tower_preview
tag @s add gg_my_preview
scoreboard players operation @s gg.tower_pid = #cur_pid gg.tower_pid
scoreboard players operation @s gg.tower_type = #cur_type gg.tower_type

# Hide text_display on preview hologram
execute on passengers if entity @s[type=text_display] run data modify entity @s text set value ""
execute on passengers if entity @s[type=text_display] run data modify entity @s background set value 0
