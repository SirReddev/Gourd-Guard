# Cutscene System - Talk to Peeves at Sacred Pumpkin
# Called when player right-clicks Peeves' interaction hitbox

# If waves are currently running (state 1..3), offer to End game
execute if score .wave state matches 1..3 run data modify storage chatbox:selection Items set value [{Slot:0,Name:"End game",SpaceAfterName:"\uf107\uf105\uf103\uf102",Action:"function gourd_guard:cutscene/on_end_game"},{Slot:1,Name:"Wait, not ready yet",SpaceAfterName:"\uf107",Action:"function chatbox:selection/close"}]

# If waves are not running, offer to Start now
execute unless score .wave state matches 1..3 run data modify storage chatbox:selection Items set value [{Slot:0,Name:"Start now!",SpaceAfterName:"\uf107\uf105\uf103",Action:"function gourd_guard:cutscene/on_start_waves"},{Slot:1,Name:"Wait, not ready yet",SpaceAfterName:"\uf107",Action:"function chatbox:selection/close"}]

data modify storage chatbox:selection Title set value '[{"text":"  Peeves  |  Hotbar (1-2)  |  [Shift] Select  |  [Walk] Exit","color":"#FBFBFB"}]'

function chatbox:selection/open
