# Completely resets all ChatBox state, ensures generic scores & bossbars exist, and stops active sequences
function generic:init
function chatbox:bossbar/init

# Release all 4 sessions and reset player tracking
function chatbox:session/s1/release
function chatbox:session/s2/release
function chatbox:session/s3/release
function chatbox:session/s4/release
scoreboard players set @a chatbox.session 0

scoreboard players set #chatbox.bossbar.flag loy.value 0
scoreboard players set #chatbox.current.line loy.value 0
scoreboard players set #chatbox.text.length loy.value 0
scoreboard players set #chatbox.text.timer loy.value 0
scoreboard players set #chatbox.character.timer loy.value 0
scoreboard players set #chatbox.icon.timer loy.value 0
scoreboard players set #chatbox.frame.reflash.flag loy.value 0
scoreboard players set #chatbox.sneak.handled loy.value 0
scoreboard players set #chatbox.sound.timer loy.value 0
scoreboard players set #chatbox.vignette.flag loy.value 1

scoreboard players set @a chatbox.sneak 0
scoreboard players set @a chatbox.sneak_cd 0
scoreboard players set @a chatbox.was_sneaking 0

data modify storage chatbox:main Sequence set value []
data modify storage chatbox:main SequenceActive set value 0b
data modify storage chatbox:main Buffer set value []
data modify storage chatbox:main HistoryBuffer set value []
data modify storage chatbox:main InstantBuffer set value []
data modify storage chatbox:main IconBuffer set value []
data modify storage chatbox:main CurrentText set value '{"text":""}'
data modify storage chatbox:main CurrentCombine set value '{"text":""}'
data modify storage chatbox:main CurrentFrameCombine set value '{"text":""}'
data modify storage chatbox:main CurrentFrameIcon set value '{"text":""}'
data modify storage chatbox:main CurrentIcon set value '{"text":""}'
data modify storage chatbox:main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'

data modify storage chatbox:shop Active set value 0b
data modify storage chatbox:shop Items set value []
data modify storage chatbox:shop SelectedSlot set value 0

data modify storage chatbox:selection Active set value 0b
data modify storage chatbox:selection Items set value []
data modify storage chatbox:selection SelectedSlot set value 0
