# gourd_guard:candy/tick_single
# 1. Collect if touching player body
execute if entity @p[distance=..1.2] run return run function gourd_guard:candy/collect

# 2. Magnetic pull: Pull smoothly into player body
execute if entity @p[distance=1.2..3.0] run function gourd_guard:candy/pull