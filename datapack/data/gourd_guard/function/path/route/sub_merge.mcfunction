# Pathfinding - Context-aware Sub-Merge (merge_1 if editing Option 1/1A/1B, merge_2 if editing Option 2/2A/2B)
# Usage: /function gourd_guard:path/route/sub_merge

scoreboard objectives add path.edit dummy
execute if score CurrentBranch path.edit matches 2 run return run function gourd_guard:path/route/merge_2
execute if score CurrentBranch path.edit matches 21..23 run return run function gourd_guard:path/route/merge_2
function gourd_guard:path/route/merge_1
