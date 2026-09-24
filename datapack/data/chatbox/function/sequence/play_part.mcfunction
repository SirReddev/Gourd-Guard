# Internal helper: initializes the current part's style and buffer
function chatbox:bossbar/clear/with_all

# Extract current part to prevent array-wide matching
data modify storage chatbox:main CurrentPart set from storage chatbox:main Sequence[0]

# Default to style 0
function chatbox:style/0

# Optional style selection per part (0, 1, 2)
execute if data storage chatbox:main CurrentPart{Style:0} run function chatbox:style/0
execute if data storage chatbox:main CurrentPart{Style:1} run function chatbox:style/1
execute if data storage chatbox:main CurrentPart{Style:2} run function chatbox:style/2

# Optional avatar selection per part (0 / template, or none)
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run scoreboard players set #chatbox.character.length loy.value 64
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run scoreboard players set #chatbox.character.offset loy.value 6
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run scoreboard players set #chatbox.character.flag loy.value 1
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run scoreboard players set #chatbox.pre.length loy.value 80

execute if data storage chatbox:main CurrentPart{Avatar:"template"} run data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"template"} run scoreboard players set #chatbox.character.length loy.value 64
execute if data storage chatbox:main CurrentPart{Avatar:"template"} run scoreboard players set #chatbox.character.offset loy.value 6
execute if data storage chatbox:main CurrentPart{Avatar:"template"} run scoreboard players set #chatbox.character.flag loy.value 1
execute if data storage chatbox:main CurrentPart{Avatar:"template"} run scoreboard players set #chatbox.pre.length loy.value 80

execute if data storage chatbox:main CurrentPart{Avatar:"none"} run scoreboard players set #chatbox.character.flag loy.value 0
execute if data storage chatbox:main CurrentPart{Avatar:"none"} run scoreboard players set #chatbox.pre.length loy.value 0

# Optional sound selection per part
execute if data storage chatbox:main CurrentPart{Sound:-1} run scoreboard players set #chatbox.sound.id loy.value -1
execute if data storage chatbox:main CurrentPart{Sound:0} run scoreboard players set #chatbox.sound.id loy.value 0
execute if data storage chatbox:main CurrentPart{Sound:1} run scoreboard players set #chatbox.sound.id loy.value 1
execute if data storage chatbox:main CurrentPart{Sound:2} run scoreboard players set #chatbox.sound.id loy.value 2

data modify storage chatbox:main Buffer set from storage chatbox:main CurrentPart.Buffer
data remove storage chatbox:main CurrentPart
data remove storage chatbox:main Sequence[0]
scoreboard players set #chatbox.text.timer loy.value 0

function chatbox:manage/frame/combine
scoreboard players set #chatbox.frame.reflash.flag loy.value 0


