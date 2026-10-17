# gourd_guard:npc/interact/archer
# Only play introduction dialogue on player's first interaction; open shop directly on repeat visits
execute if score @s gg.talked_archer matches 1 run return run function gourd_guard:npc/shop/archer

scoreboard players set @s gg.talked_archer 1
function gourd_guard:npc/dialogue/archer
