# Closes the Selection UI and releases the session
execute if score @s chatbox.session matches 1 run data modify storage chatbox:selection Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:selection Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:selection Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:selection Session set value "s4"

function chatbox:selection/close_bossbars with storage chatbox:selection

data modify storage chatbox:selection Active set value 0b
data modify storage chatbox:selection Items set value []

playsound minecraft:ui.toast.out master @s ~ ~ ~ 0.35 1.05
function chatbox:session/release\n