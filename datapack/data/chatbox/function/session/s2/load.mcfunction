# Load session 2 state into working memory
data modify storage chatbox:main Buffer set from storage chatbox:s2_main Buffer
data modify storage chatbox:main HistoryBuffer set from storage chatbox:s2_main HistoryBuffer
data modify storage chatbox:main Sequence set from storage chatbox:s2_main Sequence
data modify storage chatbox:main SequenceActive set from storage chatbox:s2_main SequenceActive
data modify storage chatbox:main SequenceOnEnd set from storage chatbox:s2_main SequenceOnEnd
data modify storage chatbox:main CurrentPart set from storage chatbox:s2_main CurrentPart
data modify storage chatbox:main CurrentText set from storage chatbox:s2_main CurrentText
data modify storage chatbox:main CurrentCombine set from storage chatbox:s2_main CurrentCombine
data modify storage chatbox:main CurrentFrameCombine set from storage chatbox:s2_main CurrentFrameCombine
data modify storage chatbox:main CurrentFrameIcon set from storage chatbox:s2_main CurrentFrameIcon
data modify storage chatbox:main CurrentIcon set from storage chatbox:s2_main CurrentIcon
data modify storage chatbox:main PreviousFormat set from storage chatbox:s2_main PreviousFormat
data modify storage chatbox:main Background set from storage chatbox:s2_main Background
data modify storage chatbox:main Character set from storage chatbox:s2_main Character
data modify storage chatbox:main Icon set from storage chatbox:s2_main Icon
data modify storage chatbox:main IconBuffer set from storage chatbox:s2_main IconBuffer
data modify storage chatbox:main Session set value "s2"

data modify storage chatbox:shop Active set from storage chatbox:s2_shop Active
data modify storage chatbox:shop Items set from storage chatbox:s2_shop Items
data modify storage chatbox:shop Title set from storage chatbox:s2_shop Title
data modify storage chatbox:shop SelectedSlot set from storage chatbox:s2_shop SelectedSlot
data modify storage chatbox:shop FooterRow set from storage chatbox:s2_shop FooterRow
data modify storage chatbox:shop Session set value "s2"

scoreboard players operation #chatbox.bossbar.flag loy.value = #chatbox.s2.bossbar.flag loy.value
scoreboard players operation #chatbox.current.line loy.value = #chatbox.s2.current.line loy.value
scoreboard players operation #chatbox.text.length loy.value = #chatbox.s2.text.length loy.value
scoreboard players operation #chatbox.text.timer loy.value = #chatbox.s2.text.timer loy.value
scoreboard players operation #chatbox.character.timer loy.value = #chatbox.s2.character.timer loy.value
scoreboard players operation #chatbox.icon.timer loy.value = #chatbox.s2.icon.timer loy.value
scoreboard players operation #chatbox.frame.reflash.flag loy.value = #chatbox.s2.frame.reflash.flag loy.value
scoreboard players operation #chatbox.sound.timer loy.value = #chatbox.s2.sound.timer loy.value
scoreboard players operation #chatbox.vignette.flag loy.value = #chatbox.s2.vignette.flag loy.value

# Style parameters
scoreboard players operation #chatbox.pre.length loy.value = #chatbox.s2.pre.length loy.value
scoreboard players operation #chatbox.content.length loy.value = #chatbox.s2.content.length loy.value
scoreboard players operation #chatbox.max.length loy.value = #chatbox.s2.max.length loy.value
scoreboard players operation #chatbox.text.interval loy.value = #chatbox.s2.text.interval loy.value
scoreboard players operation #chatbox.sound.id loy.value = #chatbox.s2.sound.id loy.value
scoreboard players operation #chatbox.sound.interval loy.value = #chatbox.s2.sound.interval loy.value
scoreboard players operation #chatbox.background.length loy.value = #chatbox.s2.background.length loy.value
scoreboard players operation #chatbox.character.flag loy.value = #chatbox.s2.character.flag loy.value
scoreboard players operation #chatbox.character.length loy.value = #chatbox.s2.character.length loy.value
scoreboard players operation #chatbox.character.duration loy.value = #chatbox.s2.character.duration loy.value
scoreboard players operation #chatbox.character.offset loy.value = #chatbox.s2.character.offset loy.value
scoreboard players operation #chatbox.icon.flag loy.value = #chatbox.s2.icon.flag loy.value
scoreboard players operation #chatbox.icon.length loy.value = #chatbox.s2.icon.length loy.value
scoreboard players operation #chatbox.icon.duration loy.value = #chatbox.s2.icon.duration loy.value
scoreboard players operation #chatbox.icon.offset loy.value = #chatbox.s2.icon.offset loy.value
