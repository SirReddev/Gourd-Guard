# 1. Hide HUD actionbar during screen fade
scoreboard players set .hud hidden 1
title @a actionbar ""

# 2. Add native posteffect fade transition (smooth to black and back to normal)
posteffect add @a gourd_guard:fade_black

# 3. Schedule posteffect cleanup and unpause HUD after 65 ticks (3.25s)
schedule function gourd_guard:wave/transition/clear 65t
