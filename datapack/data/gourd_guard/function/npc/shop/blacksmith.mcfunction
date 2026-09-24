# gourd_guard:npc/shop/blacksmith
# Damage & physical towers shop for Garrick the Blacksmith

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Anvil Cannon",Price:"15 Candy",CostScore:"coins",CostCount:15,Icon:"\ue200",SpaceAfterName:"\ue006\ue003",SpaceAfterPrice:"\ue002",Action:"tellraw @s [{\"text\":\"[Garrick] \",\"color\":\"#FFAA00\",\"bold\":true},{\"text\":\"Purchased Anvil Cannon! (Tower placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:1,Name:"Flaming Forge Spire",Price:"30 Candy",CostScore:"coins",CostCount:30,Icon:"\ue200",SpaceAfterName:"\ue003\ue003",SpaceAfterPrice:"\ue002",Action:"tellraw @s [{\"text\":\"[Garrick] \",\"color\":\"#FFAA00\",\"bold\":true},{\"text\":\"Purchased Flaming Forge Spire! (Tower placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:2,Name:"Cleaver Sentry",Price:"45 Candy",CostScore:"coins",CostCount:45,Icon:"\ue200",SpaceAfterName:"\ue005\ue003",SpaceAfterPrice:"\ue002",Action:"tellraw @s [{\"text\":\"[Garrick] \",\"color\":\"#FFAA00\",\"bold\":true},{\"text\":\"Purchased Cleaver Sentry! (Tower placeholder)\",\"color\":\"#FBFBFB\"}]"},{Slot:3,Name:"Molten Slag Mortar",Price:"65 Candy",CostScore:"coins",CostCount:65,Icon:"\ue200",SpaceAfterName:"\ue003\ue003",SpaceAfterPrice:"\ue002",Action:"tellraw @s [{\"text\":\"[Garrick] \",\"color\":\"#FFAA00\",\"bold\":true},{\"text\":\"Purchased Molten Slag Mortar! (Tower placeholder)\",\"color\":\"#FBFBFB\"}]"}]

data modify storage chatbox:shop Title set value '[{"text":"  Garrick's Forge  |  (1-4)  |  [Shift] Buy  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
