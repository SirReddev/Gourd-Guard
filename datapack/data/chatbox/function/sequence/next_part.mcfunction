# Loads and begins typing the next dialogue part from chatbox:main Sequence
execute if data storage chatbox:main Sequence[0] run return run function chatbox:sequence/play_part
function chatbox:sequence/end
