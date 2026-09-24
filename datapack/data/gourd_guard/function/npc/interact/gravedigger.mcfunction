# gourd_guard:npc/interact/gravedigger
# First time plays dialogue (which chains into shop), subsequent clicks open shop directly

execute unless score @s gg.talked_gravedigger matches 1.. run function gourd_guard:npc/dialogue/gravedigger
execute if score @s gg.talked_gravedigger matches 1.. run function gourd_guard:npc/shop/gravedigger
scoreboard players set @s gg.talked_gravedigger 1
