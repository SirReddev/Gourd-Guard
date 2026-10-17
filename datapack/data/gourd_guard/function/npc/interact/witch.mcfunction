# gourd_guard:npc/interact/witch
# Only play introduction dialogue on player's first interaction; open shop directly on repeat visits
execute if score @s gg.talked_witch matches 1 run return run function gourd_guard:npc/shop/witch

scoreboard players set @s gg.talked_witch 1
function gourd_guard:npc/dialogue/witch
