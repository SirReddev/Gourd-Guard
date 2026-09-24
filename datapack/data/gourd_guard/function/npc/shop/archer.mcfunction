# gourd_guard:npc/shop/archer
# Ranged defense towers shop for Captain Bolt the Archer

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Crossbow Sentry",Price:"10 Candy",CostScore:"coins",CostCount:10,Icon:"\ue200",SpaceAfterName:"\uf105\uf103",SpaceAfterPrice:"\uf101"},{Slot:1,Name:"Sniper Ballista",Price:"25 Candy",CostScore:"coins",CostCount:25,Icon:"\ue200",SpaceAfterName:"\uf105\uf104\uf103",SpaceAfterPrice:"\uf101"},{Slot:2,Name:"Multi-Shot Turret",Price:"40 Candy",CostScore:"coins",CostCount:40,Icon:"\ue200",SpaceAfterName:"\uf105\uf103",SpaceAfterPrice:"\uf101"},{Slot:3,Name:"Piercing Volley Tower",Price:"60 Candy",CostScore:"coins",CostCount:60,Icon:"\ue200",SpaceAfterName:"\uf104\uf102",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Captain Bolt: Archery Arsenal  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open



