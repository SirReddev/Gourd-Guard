# Save working memory back to session 3 state
scoreboard players operation #chatbox.s3.bossbar.flag loy.value = #chatbox.bossbar.flag loy.value
scoreboard players operation #chatbox.s3.current.line loy.value = #chatbox.current.line loy.value
scoreboard players operation #chatbox.s3.text.length loy.value = #chatbox.text.length loy.value
scoreboard players operation #chatbox.s3.text.timer loy.value = #chatbox.text.timer loy.value
scoreboard players operation #chatbox.s3.character.timer loy.value = #chatbox.character.timer loy.value
scoreboard players operation #chatbox.s3.icon.timer loy.value = #chatbox.icon.timer loy.value
scoreboard players operation #chatbox.s3.frame.reflash.flag loy.value = #chatbox.frame.reflash.flag loy.value
scoreboard players operation #chatbox.s3.sound.timer loy.value = #chatbox.sound.timer loy.value
scoreboard players operation #chatbox.s3.vignette.flag loy.value = #chatbox.vignette.flag loy.value

# Style parameters
scoreboard players operation #chatbox.s3.pre.length loy.value = #chatbox.pre.length loy.value
scoreboard players operation #chatbox.s3.content.length loy.value = #chatbox.content.length loy.value
scoreboard players operation #chatbox.s3.max.length loy.value = #chatbox.max.length loy.value
scoreboard players operation #chatbox.s3.text.interval loy.value = #chatbox.text.interval loy.value
scoreboard players operation #chatbox.s3.sound.id loy.value = #chatbox.sound.id loy.value
scoreboard players operation #chatbox.s3.sound.interval loy.value = #chatbox.sound.interval loy.value
scoreboard players operation #chatbox.s3.background.length loy.value = #chatbox.background.length loy.value
scoreboard players operation #chatbox.s3.character.flag loy.value = #chatbox.character.flag loy.value
scoreboard players operation #chatbox.s3.character.length loy.value = #chatbox.character.length loy.value
scoreboard players operation #chatbox.s3.character.duration loy.value = #chatbox.character.duration loy.value
scoreboard players operation #chatbox.s3.character.offset loy.value = #chatbox.character.offset loy.value
scoreboard players operation #chatbox.s3.icon.flag loy.value = #chatbox.icon.flag loy.value
scoreboard players operation #chatbox.s3.icon.length loy.value = #chatbox.icon.length loy.value
scoreboard players operation #chatbox.s3.icon.duration loy.value = #chatbox.icon.duration loy.value
scoreboard players operation #chatbox.s3.icon.offset loy.value = #chatbox.icon.offset loy.value

data modify storage chatbox:s3_main Buffer set from storage chatbox:main Buffer
data modify storage chatbox:s3_main HistoryBuffer set from storage chatbox:main HistoryBuffer
data modify storage chatbox:s3_main Sequence set from storage chatbox:main Sequence
data modify storage chatbox:s3_main SequenceActive set from storage chatbox:main SequenceActive
data modify storage chatbox:s3_main SequenceOnEnd set from storage chatbox:main SequenceOnEnd
data modify storage chatbox:s3_main CurrentPart set from storage chatbox:main CurrentPart
data modify storage chatbox:s3_main CurrentText set from storage chatbox:main CurrentText
data modify storage chatbox:s3_main CurrentCombine set from storage chatbox:main CurrentCombine
data modify storage chatbox:s3_main CurrentFrameCombine set from storage chatbox:main CurrentFrameCombine
data modify storage chatbox:s3_main CurrentFrameIcon set from storage chatbox:main CurrentFrameIcon
data modify storage chatbox:s3_main CurrentIcon set from storage chatbox:main CurrentIcon
data modify storage chatbox:s3_main PreviousFormat set from storage chatbox:main PreviousFormat
data modify storage chatbox:s3_main Background set from storage chatbox:main Background
data modify storage chatbox:s3_main Character set from storage chatbox:main Character
data modify storage chatbox:s3_main Icon set from storage chatbox:main Icon
data modify storage chatbox:s3_main IconBuffer set from storage chatbox:main IconBuffer

data modify storage chatbox:s3_shop Active set from storage chatbox:shop Active
data modify storage chatbox:s3_shop Items set from storage chatbox:shop Items
data modify storage chatbox:s3_shop Title set from storage chatbox:shop Title
data modify storage chatbox:s3_shop SelectedSlot set from storage chatbox:shop SelectedSlot
data modify storage chatbox:s3_shop FooterRow set from storage chatbox:shop FooterRow

data modify storage chatbox:s3_selection Active set from storage chatbox:selection Active
data modify storage chatbox:s3_selection Items set from storage chatbox:selection Items
data modify storage chatbox:s3_selection Title set from storage chatbox:selection Title
data modify storage chatbox:s3_selection SelectedSlot set from storage chatbox:selection SelectedSlot
data modify storage chatbox:s3_selection FooterRow set from storage chatbox:selection FooterRow
