# gourd_guard:pumpkin/hit_end
# Restores the pumpkin variant after the brief hit flash expires

scoreboard players set #pumpkin_hit gg.timer 0
execute if score .wave state matches 1..2 as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/on/apply
execute unless score .wave state matches 1..2 as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/default/apply
