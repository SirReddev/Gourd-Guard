# gourd_guard:npc/shop/blacksmith
# Heavy damage towers shop for Garrick the Blacksmith

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Firework Cannon",Price:"10 Candy",CostScore:"coins",CostCount:10,Action:"function gourd_guard:item/firework_cannon",Icon:"\ue200",SpaceAfterName:"\uf105\uf103\uf101",SpaceAfterPrice:"\uf101"},{Slot:1,Name:"Tesla Coil",Price:"35 Candy",CostScore:"coins",CostCount:35,Action:"function gourd_guard:item/tesla_coil",Icon:"\ue200",SpaceAfterName:"\uf106\uf103\uf102\uf100",SpaceAfterPrice:"\uf101"},{Slot:2,Name:"Fortune Pillar",Price:"60 Candy",CostScore:"coins",CostCount:60,Action:"function gourd_guard:item/fortune_pillar",Icon:"\ue200",SpaceAfterName:"\uf105\uf104\uf103",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Garrick: Heavy Artillery  |  (1-3)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
