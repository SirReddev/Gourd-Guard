# gourd_guard:npc/shop/blacksmith
# Heavy damage towers shop for Garrick the Blacksmith

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Firework Cannon",Price:"15 Candy",CostScore:"coins",CostCount:15,Action:"function gourd_guard:item/firework_cannon",Icon:"\ue200",SpaceAfterName:"\uf105\uf103\uf101",SpaceAfterPrice:"\uf101"},{Slot:1,Name:"Tesla Coil",Price:"35 Candy",CostScore:"coins",CostCount:35,Action:"function gourd_guard:item/tesla_coil",Icon:"\ue200",SpaceAfterName:"\uf106\uf103\uf102\uf100",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Garrick: Heavy Artillery  |  (1-2)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open



