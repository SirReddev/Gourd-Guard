# Executed as & at player holding a tower item
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid
scoreboard players operation #cur_type gg.tower_type = @s gg.tower_hold
scoreboard players set @s gg.tower_valid 0

# Ensure this player has an active preview hologram of the matching tower type
tag @e[type=item_display,tag=gg_tower_preview] remove gg_my_preview
execute as @e[type=item_display,tag=gg_tower_preview] if score @s gg.tower_pid = #cur_pid gg.tower_pid run tag @s add gg_my_preview

# If existing preview is for a different tower type, remove it first
execute as @e[type=item_display,tag=gg_my_preview] unless score @s gg.tower_type = #cur_type gg.tower_type run function gourd_guard:tower/preview/remove_single
execute unless entity @e[type=item_display,tag=gg_my_preview] run function gourd_guard:tower/preview/spawn

# Raycast from player eye position along view vector (up to 6.5 blocks, step 0.25)
scoreboard players set #ray_steps math 26
scoreboard players set #ray_hit math 0
execute anchored eyes positioned ^ ^ ^0.25 run function gourd_guard:tower/preview/raycast_step

# If raycast didn't hit a solid surface, place preview floating 3.5 blocks in front of player
execute if score #ray_hit math matches 0 anchored eyes positioned ^ ^ ^3.5 run function gourd_guard:tower/preview/move_invalid
