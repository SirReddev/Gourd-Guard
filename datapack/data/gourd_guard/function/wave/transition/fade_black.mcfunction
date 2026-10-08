# 1. Hide HUD actionbar during screen fade
scoreboard players set .hud hidden 1
title @a actionbar ""

# 2. Smooth Screen Fading transition (Screen-fading texturepack)
title @a times 15 30 15
title @a title ""

# 3. Auto-clear and unpause HUD after 60 ticks (3.0s)
schedule function gourd_guard:wave/transition/clear 60t
