# Starts playback of a multi-part dialogue sequence stored in chatbox:main Sequence
function chatbox:session/acquire
execute unless score @s chatbox.session matches 1..4 run return 0

# Set Session string tag based on player's assigned session
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

data modify storage chatbox:main SequenceActive set value 1b
function chatbox:sequence/next_part
function chatbox:bossbar/display/on
function chatbox:session/save
