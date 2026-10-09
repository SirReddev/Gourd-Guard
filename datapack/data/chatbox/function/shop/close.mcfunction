# Closes the Shop & Selection UI for @s
data modify storage chatbox:shop Active set value 0b

# Hide and clear shop bossbars for this session
function chatbox:shop/close_bossbars with storage chatbox:shop

# Reset movement scores
scoreboard players set @s chatbox.open_grace 0
scoreboard players set @s chatbox.walk 0
scoreboard players set @s chatbox.sprint 0

# Play exit sound
playsound minecraft:ui.toast.out master @s ~ ~ ~ 0.35 0.95

# If not in sequence, release session
execute unless data storage chatbox:main {SequenceActive:1b} run function chatbox:session/release
