# Clear bossbar names
bossbar set chatbox:s2_frame name ""
bossbar set chatbox:s2_line_0 name ""
bossbar set chatbox:s2_line_1 name ""
bossbar set chatbox:s2_line_2 name ""

bossbar set chatbox:s2_shop_0 name ""
bossbar set chatbox:s2_shop_1 name ""
bossbar set chatbox:s2_shop_2 name ""
bossbar set chatbox:s2_shop_3 name ""
bossbar set chatbox:s2_shop_4 name ""
bossbar set chatbox:s2_shop_5 name ""
bossbar set chatbox:s2_shop_6 name ""
bossbar set chatbox:s2_shop_7 name ""
bossbar set chatbox:s2_shop_8 name ""

# Detach players
bossbar set chatbox:s2_frame players
bossbar set chatbox:s2_line_0 players
bossbar set chatbox:s2_line_1 players
bossbar set chatbox:s2_line_2 players

bossbar set chatbox:s2_shop_0 players
bossbar set chatbox:s2_shop_1 players
bossbar set chatbox:s2_shop_2 players
bossbar set chatbox:s2_shop_3 players
bossbar set chatbox:s2_shop_4 players
bossbar set chatbox:s2_shop_5 players
bossbar set chatbox:s2_shop_6 players
bossbar set chatbox:s2_shop_7 players
bossbar set chatbox:s2_shop_8 players

# Clear session storage
data modify storage chatbox:s2_main Buffer set value []
data modify storage chatbox:s2_main HistoryBuffer set value []
data modify storage chatbox:s2_main Sequence set value []
data modify storage chatbox:s2_main SequenceActive set value 0b
data modify storage chatbox:s2_main SequenceOnEnd set value ""
data modify storage chatbox:s2_main CurrentPart set value {}
data modify storage chatbox:s2_main CurrentText set value '{"text":""}'
data modify storage chatbox:s2_main CurrentCombine set value '{"text":""}'
data modify storage chatbox:s2_main CurrentFrameCombine set value '{"text":""}'
data modify storage chatbox:s2_main CurrentFrameIcon set value '{"text":""}'
data modify storage chatbox:s2_main CurrentIcon set value '{"text":""}'
data modify storage chatbox:s2_main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'
data modify storage chatbox:s2_main Background set value '{"text":"\\ue000","font": "custom:chatbox/background","color":"#FBFBFB"}'
data modify storage chatbox:s2_main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
data modify storage chatbox:s2_main Icon set value ['{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue001","font": "custom:chatbox/icon","color":"#FBFBFB"}']
data modify storage chatbox:s2_main IconBuffer set value []

data modify storage chatbox:s2_shop Active set value 0b
data modify storage chatbox:s2_shop Items set value []
data modify storage chatbox:s2_shop Title set value '{"text":"SHOP"}'
data modify storage chatbox:s2_shop SelectedSlot set value 0

data modify storage chatbox:s2_selection Active set value 0b
data modify storage chatbox:s2_selection Items set value []
data modify storage chatbox:s2_selection Title set value '{"text":"SELECT"}'
data modify storage chatbox:s2_selection SelectedSlot set value 0

scoreboard players set @a[scores={chatbox.session=2}] chatbox.session 0
scoreboard players set #chatbox.s2.busy loy.value 0
scoreboard players set #chatbox.s2.bossbar.flag loy.value 0
scoreboard players set #chatbox.s2.current.line loy.value 0
scoreboard players set #chatbox.s2.text.length loy.value 0
scoreboard players set #chatbox.s2.text.timer loy.value 0
scoreboard players set #chatbox.s2.character.timer loy.value 0
scoreboard players set #chatbox.s2.icon.timer loy.value 0
scoreboard players set #chatbox.s2.frame.reflash.flag loy.value 0
scoreboard players set #chatbox.s2.sound.timer loy.value 0
scoreboard players set #chatbox.s2.vignette.flag loy.value 1

# Default Style 0 parameters for session 2
scoreboard players set #chatbox.s2.pre.length loy.value 80
scoreboard players set #chatbox.s2.content.length loy.value 220
scoreboard players set #chatbox.s2.max.length loy.value 220
scoreboard players set #chatbox.s2.text.interval loy.value 0
scoreboard players set #chatbox.s2.sound.id loy.value 0
scoreboard players set #chatbox.s2.sound.interval loy.value 1
scoreboard players set #chatbox.s2.background.length loy.value 236
scoreboard players set #chatbox.s2.character.flag loy.value 1
scoreboard players set #chatbox.s2.character.length loy.value 64
scoreboard players set #chatbox.s2.character.duration loy.value 1
scoreboard players set #chatbox.s2.character.offset loy.value 6
scoreboard players set #chatbox.s2.icon.flag loy.value 1
scoreboard players set #chatbox.s2.icon.length loy.value 86
scoreboard players set #chatbox.s2.icon.duration loy.value 8
scoreboard players set #chatbox.s2.icon.offset loy.value 75
