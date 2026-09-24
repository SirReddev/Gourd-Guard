# gourd_guard:npc/interact/witch
# First time plays dialogue (which chains into shop), subsequent clicks open shop directly

execute unless score @s gg.talked_witch matches 1.. run function gourd_guard:npc/dialogue/witch
execute if score @s gg.talked_witch matches 1.. run function gourd_guard:npc/shop/witch
scoreboard players set @s gg.talked_witch 1
