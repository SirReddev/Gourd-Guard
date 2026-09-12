# gourd_guard:prop/waterwheel/tick
# Continuous sound loop every 6.0s (120 ticks = 1 animation cycle)
execute if entity @e[type=item_display,tag=aj.gourdguard_prop_waterwheel.root] run scoreboard players add #waterwheel_spin gg.timer 1
execute if score #waterwheel_spin gg.timer matches 120.. run function gourd_guard:prop/waterwheel/play_spin_sound