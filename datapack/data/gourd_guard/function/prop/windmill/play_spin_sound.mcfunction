# gourd_guard:prop/windmill/play_spin_sound
# Plays spinning ambient sound at each active windmill
scoreboard players set #windmill_spin gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] at @s run playsound gourd_guard:prop.windmill.spin ambient @a[distance=..15] ~ ~ ~ 0.5 1