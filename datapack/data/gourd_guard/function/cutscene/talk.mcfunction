# Cutscene System - Talk to Peeves at Sacred Pumpkin
# Called when player right-clicks Peeves' interaction hitbox

data modify storage chatbox:shop Items set value [{Slot:0,Name:"Start now!",Price:"Ready",Icon:"\ue200",SpaceAfterName:"\uf105\uf104\uf102\uf101",SpaceAfterPrice:"\uf102\uf100",Action:"function gourd_guard:cutscene/on_start_waves"},{Slot:1,Name:"Wait, I'm not ready",Price:"Cancel",Icon:"\ue201",SpaceAfterName:"\uf105\uf103\uf100",SpaceAfterPrice:"\uf103",Action:"function chatbox:shop/close"}]
data modify storage chatbox:shop Title set value '[{"text":"  Peeves  |  Hotbar (1-2)  |  [Shift] Select  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:shop/open
