# Leading whitespace length before text on each line
scoreboard players set #chatbox.pre.length loy.value 80
# Sum of leading whitespace and maximum text content length per line
scoreboard players set #chatbox.content.length loy.value 220
# Total length including leading whitespace, text content, and trailing whitespace
scoreboard players set #chatbox.max.length loy.value 220
# Default tick interval between characters (0 = faster/1 char per tick, 1 = normal, 2 = slower)
scoreboard players set #chatbox.text.interval loy.value 0

# Sound ID (negative number means no sound, 0 = sans blip)
scoreboard players set #chatbox.sound.id loy.value 0
# Sound interval (ticks between playing sound effect)
scoreboard players set #chatbox.sound.interval loy.value 1

# Background width in font pixels (236px texture)
scoreboard players set #chatbox.background.length loy.value 236
# Background texture component
data modify storage chatbox:main Background set value '{"text":"\\ue000","font": "custom:chatbox/background","color":"#FBFBFB"}'

# Character avatar enabled flag (1 = enabled, 0 = disabled)
scoreboard players set #chatbox.character.flag loy.value 1
# Character avatar display width (64px texture)
scoreboard players set #chatbox.character.length loy.value 64
# Character avatar animation duration per frame (in ticks)
scoreboard players set #chatbox.character.duration loy.value 1
# Character avatar horizontal offset relative to chatbox start position
scoreboard players set #chatbox.character.offset loy.value 6
# Character avatar static frame
data modify storage chatbox:main Character set value ['{"text":"\\ue000","font": "custom:chatbox/character","color":"#FBFBFB"}']

# End indicator icon enabled flag (1 = enabled, 0 = disabled)
scoreboard players set #chatbox.icon.flag loy.value 1
# End indicator icon display width (86px texture)
scoreboard players set #chatbox.icon.length loy.value 86
# End indicator icon animation duration per frame (in ticks)
scoreboard players set #chatbox.icon.duration loy.value 8
# End indicator icon horizontal offset relative to chatbox start position (centered: (236 - 86) / 2 = 75)
scoreboard players set #chatbox.icon.offset loy.value 75
# End indicator icon animation frames (idle, idle, pressed-down)
data modify storage chatbox:main Icon set value ['{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue000","font": "custom:chatbox/icon","color":"#FBFBFB"}','{"text":"\\ue001","font": "custom:chatbox/icon","color":"#FBFBFB"}']

function chatbox:manage/frame/character/stop
function chatbox:manage/frame/icon/disable
function chatbox:manage/instant/method/rerange
