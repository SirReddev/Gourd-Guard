scoreboard players set #chatbox.icon.timer loy.value 0
execute if score #chatbox.icon.flag loy.value matches 1 run function chatbox:manage/frame/icon/zzz/0
function chatbox:manage/frame/combine
scoreboard players set #chatbox.frame.reflash.flag loy.value 0