# Load session 4 state into working memory
data modify storage chatbox:main Buffer set from storage chatbox:s4_main Buffer
data modify storage chatbox:main HistoryBuffer set from storage chatbox:s4_main HistoryBuffer
data modify storage chatbox:main Sequence set from storage chatbox:s4_main Sequence
data modify storage chatbox:main SequenceActive set from storage chatbox:s4_main SequenceActive
data modify storage chatbox:main SequenceOnEnd set from storage chatbox:s4_main SequenceOnEnd
data modify storage chatbox:main CurrentPart set from storage chatbox:s4_main CurrentPart
data modify storage chatbox:main CurrentText set from storage chatbox:s4_main CurrentText
data modify storage chatbox:main CurrentCombine set from storage chatbox:s4_main CurrentCombine
data modify storage chatbox:main CurrentFrameCombine set from storage chatbox:s4_main CurrentFrameCombine
data modify storage chatbox:main CurrentFrameIcon set from storage chatbox:s4_main CurrentFrameIcon
data modify storage chatbox:main CurrentIcon set from storage chatbox:s4_main CurrentIcon
data modify storage chatbox:main PreviousFormat set from storage chatbox:s4_main PreviousFormat
data modify storage chatbox:main Background set from storage chatbox:s4_main Background
data modify storage chatbox:main Character set from storage chatbox:s4_main Character
data modify storage chatbox:main Icon set from storage chatbox:s4_main Icon
data modify storage chatbox:main IconBuffer set from storage chatbox:s4_main IconBuffer
data modify storage chatbox:main Session set value "s4"

data modify storage chatbox:shop Active set from storage chatbox:s4_shop Active
data modify storage chatbox:shop Items set from storage chatbox:s4_shop Items
data modify storage chatbox:shop Title set from storage chatbox:s4_shop Title
data modify storage chatbox:shop SelectedSlot set from storage chatbox:s4_shop SelectedSlot
data modify storage chatbox:shop Session set value "s4"

scoreboard players operation #chatbox.bossbar.flag loy.value = #chatbox.s4.bossbar.flag loy.value
scoreboard players operation #chatbox.current.line loy.value = #chatbox.s4.current.line loy.value
scoreboard players operation #chatbox.text.length loy.value = #chatbox.s4.text.length loy.value
scoreboard players operation #chatbox.text.timer loy.value = #chatbox.s4.text.timer loy.value
scoreboard players operation #chatbox.character.timer loy.value = #chatbox.s4.character.timer loy.value
scoreboard players operation #chatbox.icon.timer loy.value = #chatbox.s4.icon.timer loy.value
scoreboard players operation #chatbox.frame.reflash.flag loy.value = #chatbox.s4.frame.reflash.flag loy.value
scoreboard players operation #chatbox.sound.timer loy.value = #chatbox.s4.sound.timer loy.value
scoreboard players operation #chatbox.vignette.flag loy.value = #chatbox.s4.vignette.flag loy.value

# Style parameters
scoreboard players operation #chatbox.pre.length loy.value = #chatbox.s4.pre.length loy.value
scoreboard players operation #chatbox.content.length loy.value = #chatbox.s4.content.length loy.value
scoreboard players operation #chatbox.max.length loy.value = #chatbox.s4.max.length loy.value
scoreboard players operation #chatbox.text.interval loy.value = #chatbox.s4.text.interval loy.value
scoreboard players operation #chatbox.sound.id loy.value = #chatbox.s4.sound.id loy.value
scoreboard players operation #chatbox.sound.interval loy.value = #chatbox.s4.sound.interval loy.value
scoreboard players operation #chatbox.background.length loy.value = #chatbox.s4.background.length loy.value
scoreboard players operation #chatbox.character.flag loy.value = #chatbox.s4.character.flag loy.value
scoreboard players operation #chatbox.character.length loy.value = #chatbox.s4.character.length loy.value
scoreboard players operation #chatbox.character.duration loy.value = #chatbox.s4.character.duration loy.value
scoreboard players operation #chatbox.character.offset loy.value = #chatbox.s4.character.offset loy.value
scoreboard players operation #chatbox.icon.flag loy.value = #chatbox.s4.icon.flag loy.value
scoreboard players operation #chatbox.icon.length loy.value = #chatbox.s4.icon.length loy.value
scoreboard players operation #chatbox.icon.duration loy.value = #chatbox.s4.icon.duration loy.value
scoreboard players operation #chatbox.icon.offset loy.value = #chatbox.s4.icon.offset loy.value
