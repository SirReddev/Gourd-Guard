# Pathfinding - Context-aware Sub-Split Option A (1A if editing Option 1, 2A if editing Option 2)
# Usage: /function gourd_guard:path/route/sub_option_1

scoreboard objectives add path.edit dummy
execute if score CurrentBranch path.edit matches 2 run return run function gourd_guard:path/route/option_2a
execute if score CurrentBranch path.edit matches 21..23 run return run function gourd_guard:path/route/option_2a
function gourd_guard:path/route/option_1a
