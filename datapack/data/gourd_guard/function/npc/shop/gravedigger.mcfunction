# gourd_guard:npc/shop/gravedigger
# Utility items shop for Dante the Gravedigger

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Candy Magnet",Price:"15 Candy",CostScore:"coins",CostCount:15,Action:"function gourd_guard:item/magnet",Icon:"\ue200",SpaceAfterName:"\uf105\uf104\uf103\uf101",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Dante: Graveyard Supplies  |  (1)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
