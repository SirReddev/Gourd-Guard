# Ensure player's currency score is initialized and synced
$execute unless score @s $(CostScore) matches 0.. if entity @a[scores={coins=0..}] run scoreboard players operation @s $(CostScore) = @r[scores={coins=0..}] $(CostScore)
$execute unless score @s $(CostScore) matches 0.. run scoreboard players set @s $(CostScore) 0

# Check if player has at least $(CostCount) on objective $(CostScore)
scoreboard players set #chatbox.can_afford loy.value 0
$execute if score @s $(CostScore) matches $(CostCount).. run scoreboard players set #chatbox.can_afford loy.value 1
