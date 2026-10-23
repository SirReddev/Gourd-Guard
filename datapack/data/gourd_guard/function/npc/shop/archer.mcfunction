# gourd_guard:npc/shop/archer
# Ranged defense towers shop for Captain Bolt the Archer

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Copper Golem Launcher",Price:"20 Candy",CostScore:"coins",CostCount:20,Action:"function gourd_guard:item/copper_golem_launcher",Icon:"\ue200",SpaceAfterName:"\uf102\uf101\uf100",SpaceAfterPrice:"\uf101"},{Slot:1,Name:"Pillager Convoy",Price:"45 Candy",CostScore:"coins",CostCount:45,Action:"function gourd_guard:item/pillager_convoy",Icon:"\ue200",SpaceAfterName:"\uf105\uf103\uf102\uf101\uf100",SpaceAfterPrice:"\uf101"},{Slot:2,Name:"Ballista",Price:"30 Candy",CostScore:"coins",CostCount:30,Action:"function gourd_guard:item/ballista",Icon:"\ue200",SpaceAfterName:"\uf106\uf104\uf103\uf102",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Captain Bolt: Archery Arsenal  |  (1-3)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
