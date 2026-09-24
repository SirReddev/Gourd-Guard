# Style 1: Cinematic / Narration Dialogue (Black box, no avatar)

# Leading whitespace length before text on each line
scoreboard players set #chatbox.pre.length loy.value 16
# Sum of leading whitespace and maximum text content length per line
scoreboard players set #chatbox.content.length loy.value 240
# Total length including leading whitespace, text content, and trailing whitespace
scoreboard players set #chatbox.max.length loy.value 240
# Default tick interval between characters (0 = instant, 1 = normal, 2 = slower)
scoreboard players set #chatbox.text.interval loy.value 1

# Sound ID (negative number means no sound, 1 = sans, 2 = niko)
scoreboard players set #chatbox.sound.id loy.value -1
# Sound interval (ticks between playing sound effect)
scoreboard players set #chatbox.sound.interval loy.value 1

# Background width in font pixels
scoreboard players set #chatbox.background.length loy.value 256
# Background texture component
data modify storage chatbox:main Background set value '{"text":"\\ue010","font": "custom:chatbox/background","color":"#FBFBFB"}'

# Character avatar disabled for style 1
scoreboard players set #chatbox.character.flag loy.value 0
scoreboard players set #chatbox.character.length loy.value 0
scoreboard players set #chatbox.character.duration loy.value 1
scoreboard players set #chatbox.character.offset loy.value 0
data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']

# End indicator icon enabled flag (1 = enabled)
scoreboard players set #chatbox.icon.flag loy.value 1
scoreboard players set #chatbox.icon.length loy.value 80
scoreboard players set #chatbox.icon.duration loy.value 8
scoreboard players set #chatbox.icon.offset loy.value 88
data modify storage chatbox:main Icon set value ['{"text":"\\ue010","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue010","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue011","font": "custom:chatbox/icon","color":"#FBFBFB"}']

function chatbox:manage/frame/character/stop
function chatbox:manage/frame/icon/disable
function chatbox:manage/instant/method/rerange
