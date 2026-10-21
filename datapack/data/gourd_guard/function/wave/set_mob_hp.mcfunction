# Cache last HP score and trigger macro to display above mob head
scoreboard players operation @s gg.last_hp = #cur_hp gg.calc
execute store result storage gourd_guard:mob hp int 1 run scoreboard players get #cur_hp gg.calc
function gourd_guard:wave/apply_mob_hp with storage gourd_guard:mob
