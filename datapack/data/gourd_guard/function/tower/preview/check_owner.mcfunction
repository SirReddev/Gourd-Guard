# Remove preview hologram if its owner left or is no longer holding a tower item
scoreboard players operation #check_pid gg.tower_pid = @s gg.tower_pid
execute unless entity @a[scores={gg.tower_pid=#check_pid,gg.tower_hold=1..}] run function gourd_guard:tower/preview/remove_single
