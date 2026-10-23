# Chat message sent when a player receives a tower defense item
execute if score @s gg.tower_tip matches 1.. run return 0
tellraw @s [{"text":"[Tower Tip] ","color":"gold","bold":true},{"text":"Right-click a platform to place. You can ","color":"gray"},{"text":"Right-Click the floating holograms","color":"yellow","bold":true},{"text":" above placed towers to ","color":"gray"},{"text":"[MOVE]","color":"green","bold":true},{"text":" or ","color":"gray"},{"text":"[SELL]","color":"red","bold":true},{"text":" them anytime!","color":"gray"}]
scoreboard players set @s gg.tower_tip 1
