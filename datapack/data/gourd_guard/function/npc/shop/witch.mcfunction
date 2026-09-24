# gourd_guard:npc/shop/witch
# Potion & status effect towers shop for Alchemilla the Witch

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Slowness Mist Spire",Price:"15 Candy",CostScore:"coins",CostCount:15,Icon:"\ue202",SpaceAfterName:"\uf105\uf102\uf101\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:1,Name:"Poison Cauldron Tower",Price:"25 Candy",CostScore:"coins",CostCount:25,Icon:"\ue202",SpaceAfterName:"\uf104\uf102\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:2,Name:"Weakness Hex Obelisk",Price:"35 Candy",CostScore:"coins",CostCount:35,Icon:"\ue202",SpaceAfterName:"\uf104\uf103\uf102\uf100",SpaceAfterPrice:"\uf103\uf100"},{Slot:3,Name:"Splash Bomb Turret",Price:"50 Candy",CostScore:"coins",CostCount:50,Icon:"\ue202",SpaceAfterName:"\uf105\uf102\uf100",SpaceAfterPrice:"\uf103\uf100"}]

data modify storage chatbox:shop Title set value '[{"text":"  Alchemilla: Potion Spire Shop  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open


