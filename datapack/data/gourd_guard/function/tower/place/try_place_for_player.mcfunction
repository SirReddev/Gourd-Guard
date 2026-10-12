# Executed as the player who right-clicked the tower armor_stand (at the spawned armor_stand location)
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# Case A: Player's raycast preview is already snapped to a valid black_glazed_terracotta platform
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place

# Case B: The armor_stand itself landed directly on black_glazed_terracotta
execute if score #direct_terracotta math matches 1 run return run function gourd_guard:tower/place/confirm_place_direct

# Otherwise: Invalid block! Refund the item only if the player wasn't in Creative mode (since Survival/Adventure consumed 1),
# or clear & re-give 1 so Creative players don't get duplicates!
execute if entity @s[gamemode=creative] run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] 1
execute if score #spawn_type gg.tower_type matches 1 run function gourd_guard:tower/give/firework_cannon
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"yellow"}]
