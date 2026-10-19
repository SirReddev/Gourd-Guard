# Checks whether @s can afford the item described in storage chatbox:shop Temp
# Sets score #chatbox.can_afford loy.value to 1 (yes) or 0 (no)
scoreboard players set #chatbox.can_afford loy.value 1
execute if data storage chatbox:shop Temp.CostItem run function chatbox:shop/check/cost_item with storage chatbox:shop Temp
execute if data storage chatbox:shop Temp.CostScore run function chatbox:shop/check/cost_score with storage chatbox:shop Temp
