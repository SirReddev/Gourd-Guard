# Deduct scoreboard score currency from global pool and sync across all players
$scoreboard players remove .global $(CostScore) $(CostCount)
$execute if score .global $(CostScore) matches ..-1 run scoreboard players set .global $(CostScore) 0
$scoreboard players operation @a $(CostScore) = .global $(CostScore)
