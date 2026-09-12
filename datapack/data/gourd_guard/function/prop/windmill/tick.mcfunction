# gourd_guard:prop/windmill/tick
# 1. Player zone tracking: Instant sound playback when stepping within 15 blocks
execute as @a[tag=!in_windmill_zone] at @s if entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root,distance=..15] run function gourd_guard:prop/windmill/player_enter
execute as @a[tag=in_windmill_zone] at @s unless entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root,distance=..16] run tag @s remove in_windmill_zone

# 2. Continuous 8s loop for players currently inside the zone
execute if entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run scoreboard players add #windmill_spin gg.timer 1
execute if score #windmill_spin gg.timer matches 160.. run function gourd_guard:prop/windmill/play_spin_sound