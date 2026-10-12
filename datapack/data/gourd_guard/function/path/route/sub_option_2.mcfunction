# Pathfinding - Context-aware Sub-Split Option B (1B if editing Option 1, 2B if editing Option 2)
# Usage: /function gourd_guard:path/route/sub_option_2

scoreboard objectives add path.edit dummy
execute if score CurrentBranch path.edit matches 2 run return run function gourd_guard:path/route/option_2b
execute if score CurrentBranch path.edit matches 21..23 run return run function gourd_guard:path/route/option_2b
function gourd_guard:path/route/option_1b
