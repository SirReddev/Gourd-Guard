# Check if player has at least $(CostCount) on objective $(CostScore)
scoreboard players set #chatbox.can_afford loy.value 0
$execute if score @s $(CostScore) matches $(CostCount).. run scoreboard players set #chatbox.can_afford loy.value 1
