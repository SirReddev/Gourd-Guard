# Executed as & at the crosshair placement interaction entity when right-clicked
scoreboard players operation #click_pid gg.tower_pid = @s gg.tower_pid
data remove entity @s interaction

execute as @a[scores={gg.tower_hold=1..}] if score @s gg.tower_pid = #click_pid gg.tower_pid at @s run function gourd_guard:tower/place/try_place_from_btn
