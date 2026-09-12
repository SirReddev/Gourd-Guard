# gourd_guard:prop/windmill/tick
# Plays windmill spin sound every 2 full animation cycles (160 ticks / 8.0s)
execute if entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run scoreboard players add #windmill_spin gg.timer 1
execute if score #windmill_spin gg.timer matches 160.. run function gourd_guard:prop/windmill/play_spin_sound