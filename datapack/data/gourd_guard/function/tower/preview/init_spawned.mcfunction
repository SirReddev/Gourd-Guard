tag @s add gg_tower_preview
tag @s add gg_my_preview
scoreboard players operation @s gg.tower_pid = #cur_pid gg.tower_pid
scoreboard players operation @s gg.tower_type = #cur_type gg.tower_type

function gourd_guard:tower/preview/set_variant_fail
