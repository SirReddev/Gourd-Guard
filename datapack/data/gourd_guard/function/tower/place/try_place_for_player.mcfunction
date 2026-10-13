# Executed as & at the player who right-clicked the tower armor_stand
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# If player's raycast preview is snapped to a valid, unoccupied 2x2 black_glazed_terracotta platform, place the tower!
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place

# Otherwise: Invalid block or occupied platform!
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 1 run function gourd_guard:tower/place/restore_firework_cannon
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"yellow"}]
