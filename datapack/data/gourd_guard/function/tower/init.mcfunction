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

# Combat & Projectile Objectives
scoreboard objectives add gg.tower_cd dummy
scoreboard objectives add gg.tower_max_cd dummy
scoreboard objectives add gg.tower_dmg dummy
scoreboard objectives add gg.tower_splash dummy
scoreboard objectives add gg.mob_id dummy
scoreboard objectives add gg.mob_next_id dummy
scoreboard objectives add gg.mob_node_prev dummy
scoreboard objectives add gg.mob_sub dummy
scoreboard objectives add gg.mob_prog dummy
scoreboard objectives add gg.fw_tid dummy
scoreboard objectives add gg.fw_step dummy
scoreboard objectives add gg.fw_dmg dummy
scoreboard objectives add gg.fw_splash dummy
scoreboard objectives add gg.fw_bx dummy
scoreboard objectives add gg.fw_by dummy
scoreboard objectives add gg.fw_bz dummy
scoreboard objectives add gg.fw_tx dummy
scoreboard objectives add gg.fw_ty dummy
scoreboard objectives add gg.fw_tz dummy

execute unless score #next gg.tower_next_pid matches 1.. run scoreboard players set #next gg.tower_next_pid 1
execute unless score #next gg.tower_next_id matches 1.. run scoreboard players set #next gg.tower_next_id 1
execute unless score #next gg.mob_next_id matches 1.. run scoreboard players set #next gg.mob_next_id 1

# Clean up any leftover preview holograms on reload
execute as @e[type=item_display,tag=gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_placed] run function gourd_guard:tower/preview/remove_single
