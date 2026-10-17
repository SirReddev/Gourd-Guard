# Skip Intermission Timer or Start Wave
execute if score .wave state matches 2 run tellraw @a [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Intermission skipped!","color":"yellow"}]
execute if score .wave state matches 2 run return run function gourd_guard:wave/intermission_end
execute if score .wave state matches 0 run return run function gourd_guard:wave/start
tellraw @s [{"text":"[Gourd Guard] ","color":"dark_green"},{"text":"Wave is currently in progress. Cannot skip.","color":"red"}]
