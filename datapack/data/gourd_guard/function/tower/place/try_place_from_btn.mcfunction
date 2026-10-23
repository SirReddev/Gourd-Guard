# Executed as & at the player who right-clicked while holding a tower item
scoreboard players operation #spawn_type gg.tower_type = @s gg.tower_hold
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# Ensure raycast and 2x2 platform validation are up to date on this exact tick
function gourd_guard:tower/preview/update_player

# If valid unoccupied 2x2 black_glazed_terracotta platform, consume 1 item and spawn the tower!
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place_btn

# Otherwise: Invalid block or occupied platform! (Item was never consumed because an interaction entity was clicked!)
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
execute if score #spawn_type gg.tower_type matches 9 run return run tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an unoccupied Dirt Path block!","color":"yellow"}]
tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"yellow"}]
