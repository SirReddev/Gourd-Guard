# Executed as a preview hologram root entity (@s)
# Check if any online player who is currently holding a tower item owns this preview
scoreboard players operation #check_pid gg.tower_pid = @s gg.tower_pid
scoreboard players set #has_owner math 0
execute as @a[scores={gg.tower_hold=1..}] if score @s gg.tower_pid = #check_pid gg.tower_pid run scoreboard players set #has_owner math 1

# If no player is holding the item for this preview, immediately remove the preview hologram!
execute if score #has_owner math matches 0 run function gourd_guard:tower/preview/remove_single
