# gourd_guard:npc/shop/witch
# Potion & status effect towers shop for Alchemilla the Witch

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Cauldron Damage",Price:"25 Candy",CostScore:"coins",CostCount:25,Action:"function gourd_guard:item/cauldron_damage",Icon:"\ue202",SpaceAfterName:"\uf105\uf103\uf100",SpaceAfterPrice:"\uf101"},{Slot:1,Name:"Cauldron Poison",Price:"35 Candy",CostScore:"coins",CostCount:35,Action:"function gourd_guard:item/cauldron_poison",Icon:"\ue202",SpaceAfterName:"\uf105\uf103\uf102",SpaceAfterPrice:"\uf101"},{Slot:2,Name:"Cauldron Slowness",Price:"30 Candy",CostScore:"coins",CostCount:30,Action:"function gourd_guard:item/cauldron_slowness",Icon:"\ue202",SpaceAfterName:"\uf105",SpaceAfterPrice:"\uf101"},{Slot:3,Name:"Magic Altar",Price:"45 Candy",CostScore:"coins",CostCount:45,Action:"function gourd_guard:item/magic_altar",Icon:"\ue202",SpaceAfterName:"\uf106\uf102\uf101",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Alchemilla: Potion Spire Shop  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
