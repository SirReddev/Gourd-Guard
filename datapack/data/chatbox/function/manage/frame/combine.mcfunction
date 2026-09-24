data modify storage chatbox:main CurrentFrameCombine set from storage chatbox:main Background

execute unless score #chatbox.vignette.flag loy.value matches 0 run function chatbox:manage/frame/vignette/do
execute if score #chatbox.character.flag loy.value matches 1 run function chatbox:manage/frame/zzz/0
execute if score #chatbox.icon.flag loy.value matches 1 unless data storage chatbox:main Buffer[0] if data storage chatbox:main HistoryBuffer[0] run function chatbox:manage/frame/zzz/1
execute if score #chatbox.icon.flag loy.value matches 1 if score #chatbox.current.line loy.value matches 3.. if data storage chatbox:main HistoryBuffer[0] run function chatbox:manage/frame/zzz/1

function chatbox:bossbar/set/frame