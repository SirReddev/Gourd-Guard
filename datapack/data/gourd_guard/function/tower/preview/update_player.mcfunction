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

# Ensure this player has a crosshair right-click interaction detector (works in Adventure, Survival, and Creative!)
tag @e[type=interaction,tag=gg_tower_place_btn] remove gg_my_place_btn
execute as @e[type=interaction,tag=gg_tower_place_btn] if score @s gg.tower_pid = #cur_pid gg.tower_pid run tag @s add gg_my_place_btn
execute unless entity @e[type=interaction,tag=gg_my_place_btn] run function gourd_guard:tower/preview/spawn_place_btn

# Position the right-click detector in front of the player's crosshair (unless aiming at a [MOVE] or [SELL] button)
scoreboard players set #aiming_ui math 0
execute anchored eyes positioned ^ ^ ^1.5 if entity @e[type=interaction,tag=gg_tower_btn,distance=..0.6] run scoreboard players set #aiming_ui math 1
execute anchored eyes positioned ^ ^ ^2.5 if entity @e[type=interaction,tag=gg_tower_btn,distance=..0.7] run scoreboard players set #aiming_ui math 1
execute anchored eyes positioned ^ ^ ^3.5 if entity @e[type=interaction,tag=gg_tower_btn,distance=..0.8] run scoreboard players set #aiming_ui math 1
execute anchored eyes positioned ^ ^ ^4.5 if entity @e[type=interaction,tag=gg_tower_btn,distance=..0.9] run scoreboard players set #aiming_ui math 1

execute if score #aiming_ui math matches 0 anchored eyes positioned ^ ^-0.35 ^1.5 as @e[type=interaction,tag=gg_my_place_btn] run tp @s ~ ~ ~
execute if score #aiming_ui math matches 1 as @e[type=interaction,tag=gg_my_place_btn] run tp @s ~ ~-100 ~

# Raycast from player eye position along view vector (up to 6.5 blocks, step 0.25)
scoreboard players set #ray_steps math 26
scoreboard players set #ray_hit math 0
execute anchored eyes positioned ^ ^ ^0.25 run function gourd_guard:tower/preview/raycast_step

# If raycast didn't hit a solid surface, place preview floating 3.5 blocks in front of player (invalid -> placeholder_fail)
execute if score #ray_hit math matches 0 anchored eyes positioned ^ ^ ^3.5 run function gourd_guard:tower/preview/move_invalid
