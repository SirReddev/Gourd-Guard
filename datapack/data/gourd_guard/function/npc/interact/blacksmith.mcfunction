# gourd_guard:npc/interact/blacksmith
# Only play introduction dialogue on player's first interaction; open shop directly on repeat visits
execute if score @s gg.talked_blacksmith matches 1 run return run function gourd_guard:npc/shop/blacksmith

scoreboard players set @s gg.talked_blacksmith 1
function gourd_guard:npc/dialogue/blacksmith
