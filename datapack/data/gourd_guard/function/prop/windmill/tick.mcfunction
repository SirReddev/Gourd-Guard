# gourd_guard:prop/windmill/tick
# Continuous sound loop perfectly synced to windmill spinning animation (80 ticks / 4.0s)
execute as @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] at @s if score @s aj.animation_gourdguard_prop_windmill_spin.frame matches 0 run playsound gourd_guard:prop.windmill.spin ambient @a ~ ~ ~ 0.9375 1 0.0