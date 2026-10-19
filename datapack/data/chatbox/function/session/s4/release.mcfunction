# Clear bossbar names
bossbar set chatbox:s4_frame name ""
bossbar set chatbox:s4_line_0 name ""
bossbar set chatbox:s4_line_1 name ""
bossbar set chatbox:s4_line_2 name ""

bossbar set chatbox:s4_shop_0 name ""
bossbar set chatbox:s4_shop_1 name ""
bossbar set chatbox:s4_shop_2 name ""
bossbar set chatbox:s4_shop_3 name ""
bossbar set chatbox:s4_shop_4 name ""
bossbar set chatbox:s4_shop_5 name ""
bossbar set chatbox:s4_shop_6 name ""
bossbar set chatbox:s4_shop_7 name ""
bossbar set chatbox:s4_shop_8 name ""

# Detach players
bossbar set chatbox:s4_frame players
bossbar set chatbox:s4_line_0 players
bossbar set chatbox:s4_line_1 players
bossbar set chatbox:s4_line_2 players

bossbar set chatbox:s4_shop_0 players
bossbar set chatbox:s4_shop_1 players
bossbar set chatbox:s4_shop_2 players
bossbar set chatbox:s4_shop_3 players
bossbar set chatbox:s4_shop_4 players
bossbar set chatbox:s4_shop_5 players
bossbar set chatbox:s4_shop_6 players
bossbar set chatbox:s4_shop_7 players
bossbar set chatbox:s4_shop_8 players

# Clear session storage
data modify storage chatbox:s4_main Buffer set value []
data modify storage chatbox:s4_main HistoryBuffer set value []
data modify storage chatbox:s4_main Sequence set value []
data modify storage chatbox:s4_main SequenceActive set value 0b
data modify storage chatbox:s4_main SequenceOnEnd set value ""
data modify storage chatbox:s4_main CurrentPart set value {}
data modify storage chatbox:s4_main CurrentText set value '{"text":""}'
data modify storage chatbox:s4_main CurrentCombine set value '{"text":""}'
data modify storage chatbox:s4_main CurrentFrameCombine set value '{"text":""}'
data modify storage chatbox:s4_main CurrentFrameIcon set value '{"text":""}'
data modify storage chatbox:s4_main CurrentIcon set value '{"text":""}'
data modify storage chatbox:s4_main PreviousFormat set value '{"text":"","bold":false,"color":"#FBFBFB"}'
data modify storage chatbox:s4_main Background set value '{"text":"\\ue000","font": "custom:chatbox/background","color":"#FBFBFB"}'
data modify storage chatbox:s4_main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
data modify storage chatbox:s4_main Icon set value ['{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue001","font": "custom:chatbox/icon","color":"#FBFBFB"}']
data modify storage chatbox:s4_main IconBuffer set value []

data modify storage chatbox:s4_shop Active set value 0b
data modify storage chatbox:s4_shop Items set value []
data modify storage chatbox:s4_shop Title set value '{"text":"SHOP"}'
data modify storage chatbox:s4_shop SelectedSlot set value 0

data modify storage chatbox:s4_selection Active set value 0b
data modify storage chatbox:s4_selection Items set value []
data modify storage chatbox:s4_selection Title set value '{"text":"SELECT"}'
data modify storage chatbox:s4_selection SelectedSlot set value 0

scoreboard players set @a[scores={chatbox.session=4}] chatbox.session 0
scoreboard players set #chatbox.s4.busy loy.value 0
scoreboard players set #chatbox.s4.bossbar.flag loy.value 0
scoreboard players set #chatbox.s4.current.line loy.value 0
scoreboard players set #chatbox.s4.text.length loy.value 0
scoreboard players set #chatbox.s4.text.timer loy.value 0
scoreboard players set #chatbox.s4.character.timer loy.value 0
scoreboard players set #chatbox.s4.icon.timer loy.value 0
scoreboard players set #chatbox.s4.frame.reflash.flag loy.value 0
scoreboard players set #chatbox.s4.sound.timer loy.value 0
scoreboard players set #chatbox.s4.vignette.flag loy.value 1

# Default Style 0 parameters for session 4
scoreboard players set #chatbox.s4.pre.length loy.value 80
scoreboard players set #chatbox.s4.content.length loy.value 220
scoreboard players set #chatbox.s4.max.length loy.value 220
scoreboard players set #chatbox.s4.text.interval loy.value 0
scoreboard players set #chatbox.s4.sound.id loy.value 0
scoreboard players set #chatbox.s4.sound.interval loy.value 1
scoreboard players set #chatbox.s4.background.length loy.value 236
scoreboard players set #chatbox.s4.character.flag loy.value 1
scoreboard players set #chatbox.s4.character.length loy.value 64
scoreboard players set #chatbox.s4.character.duration loy.value 1
scoreboard players set #chatbox.s4.character.offset loy.value 6
scoreboard players set #chatbox.s4.icon.flag loy.value 1
scoreboard players set #chatbox.s4.icon.length loy.value 86
scoreboard players set #chatbox.s4.icon.duration loy.value 8
scoreboard players set #chatbox.s4.icon.offset loy.value 75
