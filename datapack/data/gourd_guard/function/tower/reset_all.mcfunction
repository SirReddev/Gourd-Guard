# Remove all placed towers, preview holograms, interaction hitboxes, active projectiles, and clear all players' inventories
execute as @e[type=item_display,tag=gg_tower_placed] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root] run function gourd_guard:tower/preview/remove_single
kill @e[type=interaction,tag=gg_tower_btn]
kill @e[type=interaction,tag=gg_tower_place_btn]
kill @e[type=item_display,tag=gg_fw_proj]
kill @e[type=marker,tag=gg_fw_helper]

# Clear players' inventories (excluding gourd_test builders) and reset tower hold/valid states
clear @a[tag=!gourd_test]
scoreboard players set @a gg.tower_hold 0
scoreboard players set @a gg.tower_valid 0
