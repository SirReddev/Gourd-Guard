# gourd_guard:npc/shop/blacksmith
# Heavy damage towers shop for Garrick the Blacksmith

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Anvil Cannon",Price:"15 Candy",CostScore:"coins",CostCount:15,Icon:"\ue200",SpaceAfterName:"\uf105\uf105\uf103\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:1,Name:"Flaming Forge Spire",Price:"30 Candy",CostScore:"coins",CostCount:30,Icon:"\ue200",SpaceAfterName:"\uf105\uf102\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:2,Name:"Cleaver Sentry",Price:"45 Candy",CostScore:"coins",CostCount:45,Icon:"\ue200",SpaceAfterName:"\uf105\uf104\uf103\uf101\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:3,Name:"Molten Slag Mortar",Price:"65 Candy",CostScore:"coins",CostCount:65,Icon:"\ue200",SpaceAfterName:"\uf105\uf103\uf101\uf100",SpaceAfterPrice:"\uf103\uf100"}]

data modify storage chatbox:shop Title set value '[{"text":"  Garrick: Heavy Artillery  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open


