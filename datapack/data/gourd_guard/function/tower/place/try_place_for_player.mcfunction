# Executed as the player who right-clicked the tower armor_stand
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# Ensure the player is looking at a valid, unoccupied black_glazed_terracotta platform
# (Also allow if the armor_stand itself landed directly on black_glazed_terracotta and player's preview is active)
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place

# If invalid location, refund the item immediately and play bass error sound!
execute if score #spawn_type gg.tower_type matches 1 run function gourd_guard:tower/give/firework_cannon
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
title @s actionbar {"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"red"}
