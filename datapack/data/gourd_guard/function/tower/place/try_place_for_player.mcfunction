# Executed as the player who right-clicked the tower armor_stand (at the spawned armor_stand location)
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# Case A: Player's raycast preview is already snapped to a valid black_glazed_terracotta platform
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place

# Case B: The armor_stand itself landed directly on black_glazed_terracotta
execute if score #direct_terracotta math matches 1 run return run function gourd_guard:tower/place/confirm_place_direct

# Otherwise: Invalid block!
# In Creative mode, right-clicking did not consume the item from their slot, so leave it right where it is!
# In Survival/Adventure mode, restore the item directly into their active mainhand slot (or stack):
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 1 run function gourd_guard:tower/give/firework_cannon_mainhand
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"yellow"}]
