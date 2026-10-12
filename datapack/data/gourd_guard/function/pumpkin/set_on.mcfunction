# gourd_guard:pumpkin/set_on
# Switches all Gourd Guard Pumpkin models to the 'on' variant

scoreboard players set #pumpkin_hit gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/on/apply
