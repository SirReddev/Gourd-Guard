# gourd_guard:npc/interact/archer
# First time plays dialogue (which chains into shop), subsequent clicks open shop directly

execute unless score @s gg.talked_archer matches 1.. run function gourd_guard:npc/dialogue/archer
execute if score @s gg.talked_archer matches 1.. run function gourd_guard:npc/shop/archer
scoreboard players set @s gg.talked_archer 1
