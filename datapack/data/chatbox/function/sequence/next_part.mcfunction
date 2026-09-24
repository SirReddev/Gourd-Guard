# Loads and begins typing the next dialogue part from chatbox:main Sequence
execute if data storage chatbox:main Sequence[0] run function chatbox:sequence/play_part
execute unless data storage chatbox:main Sequence[0] run function chatbox:sequence/end
