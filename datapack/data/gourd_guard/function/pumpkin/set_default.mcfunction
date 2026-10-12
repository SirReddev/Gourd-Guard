# gourd_guard:pumpkin/set_default
# Switches all Gourd Guard Pumpkin models back to the 'default' variant

scoreboard players set #pumpkin_hit gg.timer 0
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/default/apply
