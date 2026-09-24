scoreboard players set #chatbox.current.line loy.value 0
scoreboard players set #chatbox.text.length loy.value 0
scoreboard players set #chatbox.text.timer loy.value 0
scoreboard players set #chatbox.character.timer loy.value 0

data modify storage chatbox:main Buffer set value []
data modify storage chatbox:main HistoryBuffer set value []
data modify storage chatbox:main CurrentText set value '{"text":""}'
data modify storage chatbox:main CurrentCombine set value '{"text":""}'
data modify storage chatbox:main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'

execute unless data storage chatbox:main Session run data modify storage chatbox:main Session set value "s1"
function chatbox:bossbar/clear/line_macro with storage chatbox:main

function chatbox:manage/frame/icon/disable
function chatbox:manage/frame/combine
scoreboard players set #chatbox.frame.reflash.flag loy.value 0