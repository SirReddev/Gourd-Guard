# gourd_guard:pumpkin/hit
# Briefly flashes all Gourd Guard Pumpkin models to the 'hit' variant (1 tick / 0.05s)

scoreboard players set #pumpkin_hit gg.timer 2
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.bone] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "gourdguard_pumpkin_hit"
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] run function aj:gourdguard_pumpkin/variants/hit/apply
