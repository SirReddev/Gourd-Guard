# Test Standalone Shop UI with 4 items
# Placeholder candy score setup (can set with /scoreboard players set @s chatbox.candy 50)
scoreboard objectives add chatbox.candy dummy "Candy"

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Iron Sword",Price:"10 Candy",CostScore:"chatbox.candy",CostCount:10,Icon:"\ue200",SpaceAfterName:"\ue005\ue004\ue002\ue001",SpaceAfterPrice:"\ue002",Action:"give @s iron_sword 1"},{Slot:1,Name:"Wooden Shield",Price:"5 Candy",CostScore:"chatbox.candy",CostCount:5,Icon:"\ue201",SpaceAfterName:"\ue005\ue003\ue000",SpaceAfterPrice:"\ue003\ue001",Action:"give @s shield 1"},{Slot:2,Name:"Healing Potion",Price:"3 Candy",CostScore:"chatbox.candy",CostCount:3,Icon:"\ue202",SpaceAfterName:"\ue005\ue003\ue000",SpaceAfterPrice:"\ue003\ue001",Action:"give @s potion[potion_contents={potion:\"minecraft:healing\"}] 1"},{Slot:3,Name:"Fresh Bread x5",Price:"1 Candy",CostScore:"chatbox.candy",CostCount:1,Icon:"\ue203",SpaceAfterName:"\ue004\ue003\ue002\ue001",SpaceAfterPrice:"\ue003\ue001",Action:"give @s bread 5"}]
data modify storage chatbox:shop Title set value '[{"text":"  Blacksmith Shop  |  Hotbar (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
