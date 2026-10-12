# Gourd Guard Tower System - Scoreboard & Storage Initialization
scoreboard objectives add gg.tower_pid dummy
scoreboard objectives add gg.tower_next_pid dummy
scoreboard objectives add gg.tower_id dummy
scoreboard objectives add gg.tower_next_id dummy
scoreboard objectives add gg.tower_type dummy
scoreboard objectives add gg.tower_lvl dummy
scoreboard objectives add gg.tower_sell dummy
scoreboard objectives add gg.tower_valid dummy
scoreboard objectives add gg.tower_hold dummy

execute unless score #next gg.tower_next_pid matches 1.. run scoreboard players set #next gg.tower_next_pid 1
execute unless score #next gg.tower_next_id matches 1.. run scoreboard players set #next gg.tower_next_id 1

# Clean up any leftover preview holograms on reload
execute as @e[type=item_display,tag=gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_placed] run function gourd_guard:tower/preview/remove_single
