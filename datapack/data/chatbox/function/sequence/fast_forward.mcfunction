# Instantly finishes typing the current page and marks sneak as handled
scoreboard players set #chatbox.sneak.handled loy.value 1
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1.0
data modify storage chatbox:main InstantBuffer set from storage chatbox:main Buffer
data modify storage chatbox:main Buffer set value []
function chatbox:manage/instant/do

# If fast-forward paused at a page break (current.line >= 3), restore remaining InstantBuffer back into Buffer
execute if data storage chatbox:main InstantBuffer[0] run data modify storage chatbox:main Buffer set from storage chatbox:main InstantBuffer
execute if data storage chatbox:main InstantBuffer[0] run data modify storage chatbox:main InstantBuffer set value []

function chatbox:manage/frame/character/stop
function chatbox:manage/frame/icon/play
