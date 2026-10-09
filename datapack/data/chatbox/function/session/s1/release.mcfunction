# Clear bossbar names
bossbar set chatbox:s1_frame name ""
bossbar set chatbox:s1_line_0 name ""
bossbar set chatbox:s1_line_1 name ""
bossbar set chatbox:s1_line_2 name ""

bossbar set chatbox:s1_shop_0 name ""
bossbar set chatbox:s1_shop_1 name ""
bossbar set chatbox:s1_shop_2 name ""
bossbar set chatbox:s1_shop_3 name ""
bossbar set chatbox:s1_shop_4 name ""
bossbar set chatbox:s1_shop_5 name ""
bossbar set chatbox:s1_shop_6 name ""
bossbar set chatbox:s1_shop_7 name ""
bossbar set chatbox:s1_shop_8 name ""

# Detach players
bossbar set chatbox:s1_frame players
bossbar set chatbox:s1_line_0 players
bossbar set chatbox:s1_line_1 players
bossbar set chatbox:s1_line_2 players

bossbar set chatbox:s1_shop_0 players
bossbar set chatbox:s1_shop_1 players
bossbar set chatbox:s1_shop_2 players
bossbar set chatbox:s1_shop_3 players
bossbar set chatbox:s1_shop_4 players
bossbar set chatbox:s1_shop_5 players
bossbar set chatbox:s1_shop_6 players
bossbar set chatbox:s1_shop_7 players
bossbar set chatbox:s1_shop_8 players

# Clear session storage
data modify storage chatbox:s1_main Buffer set value []
data modify storage chatbox:s1_main HistoryBuffer set value []
data modify storage chatbox:s1_main Sequence set value []
data modify storage chatbox:s1_main SequenceActive set value 0b
data modify storage chatbox:s1_main SequenceOnEnd set value ""
data modify storage chatbox:s1_main CurrentPart set value {}
data modify storage chatbox:s1_main CurrentText set value '{"text":""}'
data modify storage chatbox:s1_main CurrentCombine set value '{"text":""}'
data modify storage chatbox:s1_main CurrentFrameCombine set value '{"text":""}'
data modify storage chatbox:s1_main CurrentFrameIcon set value '{"text":""}'
data modify storage chatbox:s1_main CurrentIcon set value '{"text":""}'
data modify storage chatbox:s1_main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'
data modify storage chatbox:s1_main Background set value '{"text":"\\ue000","font": "custom:chatbox/background","color":"#FBFBFB"}'
data modify storage chatbox:s1_main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
data modify storage chatbox:s1_main Icon set value ['{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue001","font": "custom:chatbox/icon","color":"#FBFBFB"}']
data modify storage chatbox:s1_main IconBuffer set value []

data modify storage chatbox:s1_shop Active set value 0b
data modify storage chatbox:s1_shop Items set value []
data modify storage chatbox:s1_shop Title set value '{"text":"SHOP"}'
data modify storage chatbox:s1_shop SelectedSlot set value 0

data modify storage chatbox:s1_selection Active set value 0b
data modify storage chatbox:s1_selection Items set value []
data modify storage chatbox:s1_selection Title set value '{"text":"SELECT"}'
data modify storage chatbox:s1_selection SelectedSlot set value 0

scoreboard players set #chatbox.s1.busy loy.value 0
scoreboard players set #chatbox.s1.bossbar.flag loy.value 0
scoreboard players set #chatbox.s1.current.line loy.value 0
scoreboard players set #chatbox.s1.text.length loy.value 0
scoreboard players set #chatbox.s1.text.timer loy.value 0
scoreboard players set #chatbox.s1.character.timer loy.value 0
scoreboard players set #chatbox.s1.icon.timer loy.value 0
scoreboard players set #chatbox.s1.frame.reflash.flag loy.value 0
scoreboard players set #chatbox.s1.sound.timer loy.value 0
scoreboard players set #chatbox.s1.vignette.flag loy.value 1

# Default Style 0 parameters for session 1
scoreboard players set #chatbox.s1.pre.length loy.value 80
scoreboard players set #chatbox.s1.content.length loy.value 220
scoreboard players set #chatbox.s1.max.length loy.value 220
scoreboard players set #chatbox.s1.text.interval loy.value 0
scoreboard players set #chatbox.s1.sound.id loy.value 0
scoreboard players set #chatbox.s1.sound.interval loy.value 1
scoreboard players set #chatbox.s1.background.length loy.value 236
scoreboard players set #chatbox.s1.character.flag loy.value 1
scoreboard players set #chatbox.s1.character.length loy.value 64
scoreboard players set #chatbox.s1.character.duration loy.value 1
scoreboard players set #chatbox.s1.character.offset loy.value 6
scoreboard players set #chatbox.s1.icon.flag loy.value 1
scoreboard players set #chatbox.s1.icon.length loy.value 86
scoreboard players set #chatbox.s1.icon.duration loy.value 8
scoreboard players set #chatbox.s1.icon.offset loy.value 75
