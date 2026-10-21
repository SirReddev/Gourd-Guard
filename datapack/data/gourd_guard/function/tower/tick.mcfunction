# Gourd Guard Tower System - Main Tick Loop

# 1. Assign unique player IDs for multiplayer preview tracking
execute as @a unless score @s gg.tower_pid matches 1.. run function gourd_guard:tower/assign_pid

# 2. Track wave mob progression so towers always target the FIRST mob in the wave
execute as @e[tag=gg_mob] run function gourd_guard:tower/combat/track_mob

# 3. Check if players are holding a tower item (mainhand or offhand)
scoreboard players set @a gg.tower_hold 0
execute as @a if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run function gourd_guard:tower/player_hold_main
execute as @a[scores={gg.tower_hold=0}] if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run function gourd_guard:tower/player_hold_off

# 4. Handle right-click placement (via crosshair interaction entity in ANY gamemode, or fallback armor_stand) FIRST!
execute as @e[type=interaction,tag=gg_tower_place_btn] if data entity @s interaction at @s run function gourd_guard:tower/place/on_click_place_btn
execute as @e[type=armor_stand,tag=gg_tower_spawn_item] at @s run function gourd_guard:tower/place/on_item_used

# 5. Update active raycast previews & crosshair click hitboxes for players holding a tower item
execute as @a[scores={gg.tower_hold=1..}] at @s run function gourd_guard:tower/preview/update_player

# 6. Clean up preview holograms and placement hitboxes for players no longer holding a tower item
execute as @e[type=item_display,tag=gg_tower_preview] run function gourd_guard:tower/preview/check_owner
execute as @e[type=interaction,tag=gg_tower_place_btn] run function gourd_guard:tower/preview/check_btn_owner

# 7. Clean up any stray/untagged tower models that are neither placed nor active previews
execute as @e[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_copper_golem_launcher.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_pillager_convoy.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_cauldron_damage.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_tesla_coil.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_cauldron_poison.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_cauldron_slowness.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single
execute as @e[type=item_display,tag=aj.gourdguard_tower_magic_altar.root,tag=!gg_tower_placed,tag=!gg_tower_preview] run function gourd_guard:tower/preview/remove_single

# 8. Tick placed towers (6-block text visibility, MOVE/SELL hitboxes, target acquisition & firework firing)
execute as @e[type=item_display,tag=gg_tower_placed] at @s run function gourd_guard:tower/placed/tick_tower

# 9. Tick active arcing projectiles
execute as @e[type=item_display,tag=gg_fw_proj] at @s run function gourd_guard:tower/combat/tick_projectile

# 9b. Tick active Pillager Convoys (collision detection against wave mobs & HP exchange)
execute as @e[tag=gg_convoy] at @s run function gourd_guard:tower/convoy/tick

# 9c. Clean up orphaned pillager riders (any rider whose ravager was killed)
execute if entity @e[type=pillager,tag=gg_convoy_rider] run tag @e[tag=gg_convoy_rider] add gg_orphan
execute if entity @e[type=pillager,tag=gg_convoy_rider] as @e[tag=gg_convoy] on passengers if entity @s[tag=gg_convoy_rider] run tag @s remove gg_orphan
execute if entity @e[type=pillager,tag=gg_orphan] run kill @e[type=pillager,tag=gg_orphan]
tag @e[tag=gg_orphan] remove gg_orphan

# 10. Check for player clicks (right-click OR left-click) on [MOVE] and [SELL] interaction buttons
execute as @e[type=interaction,tag=gg_tower_btn] if data entity @s interaction at @s run function gourd_guard:tower/action/on_interact
execute as @e[type=interaction,tag=gg_tower_btn] if data entity @s attack at @s run function gourd_guard:tower/action/on_attack
