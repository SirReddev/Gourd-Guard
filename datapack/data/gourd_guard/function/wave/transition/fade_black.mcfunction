# Screen Fading transition (Screen-fading texturepack)
# 15 ticks fade-in (0.75s), 30 ticks hold black (1.5s), 15 ticks fade-out (0.75s)
title @a times 15 30 15
title @a title ""

# Auto-clear at 60 ticks (3.0s) to guarantee screen NEVER gets stuck on black
schedule function gourd_guard:wave/transition/clear 60t
