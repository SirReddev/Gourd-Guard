# Skip Intermission Timer or Start Wave
execute if score .wave state matches 2 run tellraw @a [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Intermission skipped!","color":"yellow"}]
execute if score .wave state matches 2 run return run function gourd_guard:wave/intermission_end
tellraw @s [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Cannot skip right now.","color":"red"}]
