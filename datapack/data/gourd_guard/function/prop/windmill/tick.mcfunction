# gourd_guard:prop/windmill/tick
# Continuous sound loop every 4.0s (80 ticks = 1 animation cycle)
execute if entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run scoreboard players add #windmill_spin gg.timer 1
execute if score #windmill_spin gg.timer matches 80.. run function gourd_guard:prop/windmill/play_spin_sound