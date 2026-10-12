# gourd_guard:pumpkin/hit
# Briefly flashes all Gourd Guard Pumpkin models to the 'hit' variant (5 ticks / 0.25s)

scoreboard players set #pumpkin_hit gg.timer 5
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/hit/apply
