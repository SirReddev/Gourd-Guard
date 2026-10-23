# Executed as & at the player who right-clicked the tower armor_stand
scoreboard players operation #cur_pid gg.tower_pid = @s gg.tower_pid

# If player's raycast preview is snapped to a valid, unoccupied 2x2 black_glazed_terracotta platform, place the tower!
execute if score @s gg.tower_valid matches 1 run return run function gourd_guard:tower/place/confirm_place

# Otherwise: Invalid block or occupied platform!
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 1 run function gourd_guard:tower/place/restore_firework_cannon with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 2 run function gourd_guard:tower/place/restore_copper_golem_launcher with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 3 run function gourd_guard:tower/place/restore_pillager_convoy with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 4 run function gourd_guard:tower/place/restore_cauldron_damage with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 5 run function gourd_guard:tower/place/restore_tesla_coil with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 6 run function gourd_guard:tower/place/restore_cauldron_poison with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 7 run function gourd_guard:tower/place/restore_cauldron_slowness with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 8 run function gourd_guard:tower/place/restore_magic_altar with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 9 run function gourd_guard:tower/place/restore_scarecrow with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 10 run function gourd_guard:tower/place/restore_fortune_pillar with storage gourd_guard:tower_restore
execute if entity @s[gamemode=!creative] if score #spawn_type gg.tower_type matches 11 run function gourd_guard:tower/place/restore_ballista with storage gourd_guard:tower_restore
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.7
execute if score #spawn_type gg.tower_type matches 9 run return run tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an unoccupied Dirt Path block!","color":"yellow"}]
tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Must be placed on an empty 2x2 Black Glazed Terracotta platform!","color":"yellow"}]
