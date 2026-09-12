# gourd_guard:prop/waterwheel/play_spin_sound
scoreboard players set #waterwheel_spin gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_prop_waterwheel.root] at @s run playsound gourd_guard:prop.waterwheel.spin ambient @a ~ ~ ~ 0.9375 1 0.0