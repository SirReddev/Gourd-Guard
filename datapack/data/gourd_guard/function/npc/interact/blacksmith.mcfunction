# gourd_guard:npc/interact/blacksmith
# First time plays dialogue (which chains into shop), subsequent clicks open shop directly

execute unless score @s gg.talked_blacksmith matches 1.. run function gourd_guard:npc/dialogue/blacksmith
execute if score @s gg.talked_blacksmith matches 1.. run function gourd_guard:npc/shop/blacksmith
scoreboard players set @s gg.talked_blacksmith 1
