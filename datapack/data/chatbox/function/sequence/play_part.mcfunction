# Internal helper: initializes the current part's style and buffer
function chatbox:bossbar/clear/with_all

# Extract current part to prevent array-wide matching
data modify storage chatbox:main CurrentPart set from storage chatbox:main Sequence[0]

# Default to style 0 (Wooden Dialogue Box)
function chatbox:style/0

# Avatar selection: Witch / Alchemilla (\ue000)
execute if data storage chatbox:main CurrentPart{Avatar:"witch"} run data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"alchemilla"} run data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"0"} run data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']

# Avatar selection: Captain Bolt / Archer (\ue001)
execute if data storage chatbox:main CurrentPart{Avatar:"archer"} run data modify storage chatbox:main Character set value ['{"text":"\\ue001","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"captain_bolt"} run data modify storage chatbox:main Character set value ['{"text":"\\ue001","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"bolt"} run data modify storage chatbox:main Character set value ['{"text":"\\ue001","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"1"} run data modify storage chatbox:main Character set value ['{"text":"\\ue001","font": "custom:chatbox/character","color":"#FBFBFB"}']

# Avatar selection: Garrick / Blacksmith (\ue002)
execute if data storage chatbox:main CurrentPart{Avatar:"blacksmith"} run data modify storage chatbox:main Character set value ['{"text":"\\ue002","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"garrick"} run data modify storage chatbox:main Character set value ['{"text":"\\ue002","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"2"} run data modify storage chatbox:main Character set value ['{"text":"\\ue002","font": "custom:chatbox/character","color":"#FBFBFB"}']

# Avatar selection: Dante / Gravedigger (\ue003)
execute if data storage chatbox:main CurrentPart{Avatar:"gravedigger"} run data modify storage chatbox:main Character set value ['{"text":"\\ue003","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"dante"} run data modify storage chatbox:main Character set value ['{"text":"\\ue003","font": "custom:chatbox/character","color":"#FBFBFB"}']
execute if data storage chatbox:main CurrentPart{Avatar:"3"} run data modify storage chatbox:main Character set value ['{"text":"\\ue003","font": "custom:chatbox/character","color":"#FBFBFB"}']

# Disable avatar if "none"
execute if data storage chatbox:main CurrentPart{Avatar:"none"} run scoreboard players set #chatbox.character.flag loy.value 0
execute if data storage chatbox:main CurrentPart{Avatar:"none"} run scoreboard players set #chatbox.pre.length loy.value 16

# Optional sound selection per part
execute if data storage chatbox:main CurrentPart{Sound:-1} run scoreboard players set #chatbox.sound.id loy.value -1
execute if data storage chatbox:main CurrentPart{Sound:0} run scoreboard players set #chatbox.sound.id loy.value 0
execute if data storage chatbox:main CurrentPart{Sound:1} run scoreboard players set #chatbox.sound.id loy.value 1
execute if data storage chatbox:main CurrentPart{Sound:2} run scoreboard players set #chatbox.sound.id loy.value 2
execute if data storage chatbox:main CurrentPart{Sound:3} run scoreboard players set #chatbox.sound.id loy.value 3

data modify storage chatbox:main Buffer set from storage chatbox:main CurrentPart.Buffer
data remove storage chatbox:main CurrentPart
data remove storage chatbox:main Sequence[0]
scoreboard players set #chatbox.text.timer loy.value 0

# Refresh character avatar frame with newly set Avatar
function chatbox:manage/frame/character/stop

function chatbox:manage/frame/combine
scoreboard players set #chatbox.frame.reflash.flag loy.value 0
