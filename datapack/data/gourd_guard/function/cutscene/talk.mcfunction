# Cutscene System - Talk to Peeves at Sacred Pumpkin
# Called when player right-clicks Peeves' interaction hitbox

# Do not allow talking to Peeves while cutscene is active
execute if score .global cs.state matches 1..3 run return 0

# If waiting for player to start waves (cs.state 4) OR waves not yet started, offer to Start now
execute if score .global cs.state matches 4 run data modify storage chatbox:selection Items set value [{Slot:0,Name:"Start now!",SpaceAfterName:"\uf107\uf105\uf103",Action:"function gourd_guard:cutscene/on_start_waves"},{Slot:1,Name:"Wait, not ready yet",SpaceAfterName:"\uf106\uf105\uf104\uf103\uf102",Action:"function chatbox:selection/close"}]
execute unless score .global cs.state matches 4 if score .wave state matches 1..2 run data modify storage chatbox:selection Items set value [{Slot:0,Name:"Back to Game.",SpaceAfterName:"\uf107\uf104\uf103",Action:"function chatbox:selection/close"},{Slot:1,Name:"End Game.",SpaceAfterName:"\uf107\uf105\uf103\uf101\uf100",Action:"function gourd_guard:cutscene/on_end_game"}]
execute unless score .global cs.state matches 4 unless score .wave state matches 1..2 run data modify storage chatbox:selection Items set value [{Slot:0,Name:"Start now!",SpaceAfterName:"\uf107\uf105\uf103",Action:"function gourd_guard:cutscene/on_start_waves"},{Slot:1,Name:"Wait, not ready yet",SpaceAfterName:"\uf106\uf105\uf104\uf103\uf102",Action:"function chatbox:selection/close"}]

data modify storage chatbox:selection Title set value '[{"text":"  Peeves  |  Hotbar (1-2)  |  [Shift] Select  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:selection/open
