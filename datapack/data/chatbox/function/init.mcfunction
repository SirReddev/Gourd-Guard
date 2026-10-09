function generic:init
function chatbox:bossbar/init

# Initialize multiplayer session objective & clear sessions
scoreboard objectives add chatbox.session dummy
function chatbox:session/s1/release
function chatbox:session/s2/release
function chatbox:session/s3/release
function chatbox:session/s4/release
scoreboard players set @a chatbox.session 0

scoreboard players set #chatbox.bossbar.flag loy.value 0
scoreboard players set #chatbox.current.line loy.value 0
scoreboard players set #chatbox.sound.timer loy.value 0
scoreboard players set #chatbox.vignette.flag loy.value 1
function chatbox:style/0

# Initialize sneak detection objectives for Shift-to-Advance dialogs
scoreboard objectives add chatbox.sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add chatbox.sneak_cd dummy
scoreboard objectives add chatbox.was_sneaking dummy
scoreboard players set @a chatbox.was_sneaking 0
scoreboard players set @a chatbox.sneak_cd 0
scoreboard players set @a chatbox.sneak 0

# Shop selection objectives & storage
scoreboard objectives add chatbox.selected_slot dummy
scoreboard objectives add chatbox.prev_slot dummy
scoreboard objectives add chatbox.shop_items dummy
scoreboard objectives add chatbox.shop_icon_timer dummy
scoreboard objectives add chatbox.shop_icon_frame dummy
scoreboard objectives add chatbox.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add chatbox.sprint minecraft.custom:minecraft.sprint_one_cm

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

data modify storage chatbox:shop Active set value 0b
data modify storage chatbox:shop Items set value []
data modify storage chatbox:shop SelectedSlot set value 0

scoreboard objectives add chatbox.selection_items dummy
data modify storage chatbox:selection Active set value 0b
data modify storage chatbox:selection Items set value []
data modify storage chatbox:selection SelectedSlot set value 0
