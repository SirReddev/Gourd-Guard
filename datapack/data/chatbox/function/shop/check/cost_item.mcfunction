# Check if player has at least $(CostCount) of $(CostItem)
$execute store result score #chatbox.has_currency loy.value run clear @s $(CostItem) 0
$execute if score #chatbox.has_currency loy.value matches $(CostCount).. run scoreboard players set #chatbox.can_afford loy.value 1
$execute unless score #chatbox.has_currency loy.value matches $(CostCount).. run scoreboard players set #chatbox.can_afford loy.value 0
