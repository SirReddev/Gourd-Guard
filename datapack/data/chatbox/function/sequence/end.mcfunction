# Completes the dialogue sequence
data modify storage chatbox:main SequenceActive set value 0b
data modify storage chatbox:main Sequence set value []

# If a sequence completion callback is registered (e.g. open shop), execute it!
execute if data storage chatbox:main SequenceOnEnd run function chatbox:sequence/on_end with storage chatbox:main
execute if data storage chatbox:main SequenceOnEnd run data remove storage chatbox:main SequenceOnEnd

# If shop was not opened by callback, hide chatbox and release session
execute unless data storage chatbox:shop {Active:1b} run function chatbox:bossbar/display/off
execute unless data storage chatbox:shop {Active:1b} run function chatbox:bossbar/clear/with_all
execute unless data storage chatbox:shop {Active:1b} run function chatbox:session/release
