# gourd_guard:npc/shop/gravedigger
# Utility items shop for Dante the Gravedigger

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Cobblestone Barricade",Price:"5 Candy",CostScore:"coins",CostCount:5,Icon:"\ue200",SpaceAfterName:"\uf103\uf101",SpaceAfterPrice:"\uf102\uf101",Action:"tellraw @s [{\"text\":\"[Dante] \",\"color\":\"#AAAAAA\",\"bold\":true},{\"text\":\"Purchased Cobblestone Barricade! (Item placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:1,Name:"Upgrade Wrench",Price:"15 Candy",CostScore:"coins",CostCount:15,Icon:"\ue200",SpaceAfterName:"\uf105\uf100",SpaceAfterPrice:"",Action:"tellraw @s [{\"text\":\"[Dante] \",\"color\":\"#AAAAAA\",\"bold\":true},{\"text\":\"Purchased Upgrade Wrench! (Item placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:2,Name:"Lantern of Fortune",Price:"30 Candy",CostScore:"coins",CostCount:30,Icon:"\ue200",SpaceAfterName:"\uf104\uf102\uf101",SpaceAfterPrice:"",Action:"tellraw @s [{\"text\":\"[Dante] \",\"color\":\"#AAAAAA\",\"bold\":true},{\"text\":\"Purchased Lantern of Fortune! (Item placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:3,Name:"Soul Ward Totem",Price:"50 Candy",CostScore:"coins",CostCount:50,Icon:"\ue200",SpaceAfterName:"\uf104\uf103\uf102",SpaceAfterPrice:"",Action:"tellraw @s [{\"text\":\"[Dante] \",\"color\":\"#AAAAAA\",\"bold\":true},{\"text\":\"Purchased Soul Ward Totem! (Item placeholder)\",\"color\":\"#FBFBFB\"}]"}]

data modify storage chatbox:shop Title set value '[{"text":"  Dante: Graveyard Supplies  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
