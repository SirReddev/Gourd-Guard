# Gourd Guard Tower System - Main Tick Loop

# 1. Assign unique player IDs for multiplayer preview tracking
execute as @a unless score @s gg.tower_pid matches 1.. run function gourd_guard:tower/assign_pid

# 2. Check if players are holding a tower item (mainhand or offhand)
scoreboard players set @a gg.tower_hold 0
execute as @a if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run function gourd_guard:tower/player_hold_main
execute as @a[scores={gg.tower_hold=0}] if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run function gourd_guard:tower/player_hold_off

# 3. Update active raycast previews for players holding a tower item
execute as @a[scores={gg.tower_hold=1..}] at @s run function gourd_guard:tower/preview/update_player

# 4. Clean up preview holograms for players no longer holding a tower item
execute as @e[type=item_display,tag=gg_tower_preview] run function gourd_guard:tower/preview/check_owner

# 5. Handle right-click placement when a player places the tower armor_stand item
execute as @e[type=armor_stand,tag=gg_tower_spawn_item] at @s run function gourd_guard:tower/place/on_item_used

# 6. Keep placed tower MOVE & SELL click hitboxes aligned with their text_display billboard
execute as @e[type=item_display,tag=gg_tower_placed] at @s run function gourd_guard:tower/placed/tick_tower

# 7. Check for player clicks (right-click OR left-click) on [MOVE] and [SELL] interaction buttons
execute as @e[type=interaction,tag=gg_tower_btn] if data entity @s interaction at @s run function gourd_guard:tower/action/on_interact
execute as @e[type=interaction,tag=gg_tower_btn] if data entity @s attack at @s run function gourd_guard:tower/action/on_attack
