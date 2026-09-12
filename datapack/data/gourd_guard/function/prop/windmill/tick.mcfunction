# gourd_guard:prop/windmill/tick
# Continuous 8s loop (160 ticks = 2 animation cycles) played at windmill position
execute if entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run scoreboard players add #windmill_spin gg.timer 1
execute if score #windmill_spin gg.timer matches 160.. run function gourd_guard:prop/windmill/play_spin_sound