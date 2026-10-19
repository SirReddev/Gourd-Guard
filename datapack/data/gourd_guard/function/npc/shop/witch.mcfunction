# gourd_guard:npc/shop/witch
# Potion & status effect towers shop for Alchemilla the Witch

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Cauldron Damage",Price:"30 Candy",CostScore:"coins",CostCount:30,Action:"function gourd_guard:item/cauldron_damage",Icon:"\ue202",SpaceAfterName:"\uf105\uf103\uf100",SpaceAfterPrice:"\uf101"}]

data modify storage chatbox:shop Title set value '[{"text":"  Alchemilla: Potion Spire Shop  |  (1)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
