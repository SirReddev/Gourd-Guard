# Cutscene System - Talk to Peeves at Sacred Pumpkin
# Called when player right-clicks Peeves' interaction hitbox

data modify storage chatbox:selection Items set value [{Slot:0,Name:"Start now!",SpaceAfterName:"\uf107\uf105\uf103\uf100",Action:"function gourd_guard:cutscene/on_start_waves"},{Slot:1,Name:"Wait, I'm not ready",SpaceAfterName:"\uf107\uf102\uf101\uf100",Action:"function chatbox:selection/close"}]
data modify storage chatbox:selection Title set value '[{"text":"  Peeves  |  Hotbar (1-2)  |  [Shift] Select  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:selection/open
