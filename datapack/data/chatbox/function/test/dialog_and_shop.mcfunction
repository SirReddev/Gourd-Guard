# Test Dialogue Sequence leading into Shop UI
# Pre-load the shop items
scoreboard objectives add chatbox.candy dummy "Candy"
data modify storage chatbox:shop Items set value [{Slot:0,Name:"Iron Sword",Price:"10 Candy",CostScore:"chatbox.candy",CostCount:10,Icon:"\ue200",SpaceAfterName:"\ue005\ue004\ue002\ue001",SpaceAfterPrice:"\ue002",Action:"give @s iron_sword 1"},{Slot:1,Name:"Wooden Shield",Price:"5 Candy",CostScore:"chatbox.candy",CostCount:5,Icon:"\ue201",SpaceAfterName:"\ue005\ue003\ue000",SpaceAfterPrice:"\ue003\ue001",Action:"give @s shield 1"},{Slot:2,Name:"Healing Potion",Price:"3 Candy",CostScore:"chatbox.candy",CostCount:3,Icon:"\ue202",SpaceAfterName:"\ue005\ue003\ue000",SpaceAfterPrice:"\ue003\ue001",Action:"give @s potion[potion_contents={potion:\"minecraft:healing\"}] 1"}]
data modify storage chatbox:shop Title set value '[{"text":"  Blacksmith: Take your pick!  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

# Sequence with Shop chained at the end
data modify storage chatbox:main Sequence set value [{Style:0,Avatar:"0",Sound:0,Buffer:[{Char:"G",Length:6},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"e",Length:6},{Char:"t",Length:4},{Char:"i",Length:2},{Char:"n",Length:6},{Char:"g",Length:6},{Char:"s",Length:6},{Char:",",Length:2},{Char:" ",Length:4},{Char:"t",Length:4},{Char:"r",Length:6},{Char:"a",Length:6},{Char:"v",Length:6},{Char:"e",Length:6},{Char:"l",Length:3},{Char:"e",Length:6},{Char:"r",Length:6},{Char:"!",Length:2}]},{Style:0,Avatar:"0",Sound:0,Buffer:[{Char:"T",Length:6},{Char:"a",Length:6},{Char:"k",Length:5},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"a",Length:6},{Char:" ",Length:4},{Char:"l",Length:3},{Char:"o",Length:6},{Char:"o",Length:6},{Char:"k",Length:5},{Char:" ",Length:4},{Char:"a",Length:6},{Char:"t",Length:4},{Char:" ",Length:4},{Char:"m",Length:6},{Char:"y",Length:6},{Char:" ",Length:4},{Char:"w",Length:6},{Char:"a",Length:6},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"s",Length:6},{Char:".",Length:2}]}]

# When the dialogue completes, open the shop!
data modify storage chatbox:main SequenceOnEnd set value "function chatbox:shop/open"

function chatbox:sequence/start
