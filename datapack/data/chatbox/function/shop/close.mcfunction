# Closes the Shop & Selection UI for @s
execute if score @s chatbox.session matches 1 run data modify storage chatbox:shop Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:shop Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:shop Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:shop Session set value "s4"

data modify storage chatbox:shop Active set value 0b

# Hide and clear shop bossbars for this session
function chatbox:shop/close_bossbars with storage chatbox:shop

# Reset movement scores
scoreboard players set @s chatbox.open_grace 0
scoreboard players set @s chatbox.walk 0
scoreboard players set @s chatbox.sprint 0

# Play exit sound
playsound minecraft:ui.toast.out master @s ~ ~ ~ 0.35 0.95

# Release active session and reset SequenceActive flag
data modify storage chatbox:main SequenceActive set value 0b
function chatbox:session/release
