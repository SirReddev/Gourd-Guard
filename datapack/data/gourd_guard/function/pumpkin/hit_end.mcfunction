# gourd_guard:pumpkin/hit_end
# Restores the pumpkin variant after the brief hit flash expires

scoreboard players set #pumpkin_hit gg.timer 0
execute if score .wave state matches 1..2 run function gourd_guard:pumpkin/set_on
execute unless score .wave state matches 1..2 run function gourd_guard:pumpkin/set_default
