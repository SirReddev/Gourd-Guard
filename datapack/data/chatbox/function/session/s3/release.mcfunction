# Clear bossbar names
bossbar set chatbox:s3_frame name ""
bossbar set chatbox:s3_line_0 name ""
bossbar set chatbox:s3_line_1 name ""
bossbar set chatbox:s3_line_2 name ""

bossbar set chatbox:s3_shop_0 name ""
bossbar set chatbox:s3_shop_1 name ""
bossbar set chatbox:s3_shop_2 name ""
bossbar set chatbox:s3_shop_3 name ""
bossbar set chatbox:s3_shop_4 name ""
bossbar set chatbox:s3_shop_5 name ""
bossbar set chatbox:s3_shop_6 name ""
bossbar set chatbox:s3_shop_7 name ""
bossbar set chatbox:s3_shop_8 name ""

# Detach players
bossbar set chatbox:s3_frame players
bossbar set chatbox:s3_line_0 players
bossbar set chatbox:s3_line_1 players
bossbar set chatbox:s3_line_2 players

bossbar set chatbox:s3_shop_0 players
bossbar set chatbox:s3_shop_1 players
bossbar set chatbox:s3_shop_2 players
bossbar set chatbox:s3_shop_3 players
bossbar set chatbox:s3_shop_4 players
bossbar set chatbox:s3_shop_5 players
bossbar set chatbox:s3_shop_6 players
bossbar set chatbox:s3_shop_7 players
bossbar set chatbox:s3_shop_8 players

# Clear session storage
data modify storage chatbox:s3_main Buffer set value []
data modify storage chatbox:s3_main HistoryBuffer set value []
data modify storage chatbox:s3_main Sequence set value []
data modify storage chatbox:s3_main SequenceActive set value 0b
data modify storage chatbox:s3_main SequenceOnEnd set value ""
data modify storage chatbox:s3_main CurrentPart set value {}
data modify storage chatbox:s3_main CurrentText set value '{"text":""}'
data modify storage chatbox:s3_main CurrentCombine set value '{"text":""}'
data modify storage chatbox:s3_main CurrentFrameCombine set value '{"text":""}'
data modify storage chatbox:s3_main CurrentFrameIcon set value '{"text":""}'
data modify storage chatbox:s3_main CurrentIcon set value '{"text":""}'
data modify storage chatbox:s3_main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'
data modify storage chatbox:s3_main Background set value '{"text":"\\ue000","font": "custom:chatbox/background","color":"#FBFBFB"}'
data modify storage chatbox:s3_main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
data modify storage chatbox:s3_main Icon set value ['{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue001","font": "custom:chatbox/icon","color":"#FBFBFB"}']
data modify storage chatbox:s3_main IconBuffer set value []

data modify storage chatbox:s3_shop Active set value 0b
data modify storage chatbox:s3_shop Items set value []
data modify storage chatbox:s3_shop Title set value '{"text":"SHOP"}'
data modify storage chatbox:s3_shop SelectedSlot set value 0

data modify storage chatbox:s3_selection Active set value 0b
data modify storage chatbox:s3_selection Items set value []
data modify storage chatbox:s3_selection Title set value '{"text":"SELECT"}'
data modify storage chatbox:s3_selection SelectedSlot set value 0

scoreboard players set #chatbox.s3.busy loy.value 0
scoreboard players set #chatbox.s3.bossbar.flag loy.value 0
scoreboard players set #chatbox.s3.current.line loy.value 0
scoreboard players set #chatbox.s3.text.length loy.value 0
scoreboard players set #chatbox.s3.text.timer loy.value 0
scoreboard players set #chatbox.s3.character.timer loy.value 0
scoreboard players set #chatbox.s3.icon.timer loy.value 0
scoreboard players set #chatbox.s3.frame.reflash.flag loy.value 0
scoreboard players set #chatbox.s3.sound.timer loy.value 0
scoreboard players set #chatbox.s3.vignette.flag loy.value 1

# Default Style 0 parameters for session 3
scoreboard players set #chatbox.s3.pre.length loy.value 80
scoreboard players set #chatbox.s3.content.length loy.value 220
scoreboard players set #chatbox.s3.max.length loy.value 220
scoreboard players set #chatbox.s3.text.interval loy.value 1
scoreboard players set #chatbox.s3.sound.id loy.value -1
scoreboard players set #chatbox.s3.sound.interval loy.value 1
scoreboard players set #chatbox.s3.background.length loy.value 236
scoreboard players set #chatbox.s3.character.flag loy.value 1
scoreboard players set #chatbox.s3.character.length loy.value 64
scoreboard players set #chatbox.s3.character.duration loy.value 1
scoreboard players set #chatbox.s3.character.offset loy.value 5
scoreboard players set #chatbox.s3.icon.flag loy.value 1
scoreboard players set #chatbox.s3.icon.length loy.value 80
scoreboard players set #chatbox.s3.icon.duration loy.value 8
scoreboard players set #chatbox.s3.icon.offset loy.value 78
