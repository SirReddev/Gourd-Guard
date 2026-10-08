# Add native posteffect fade transition (smooth to black and back to normal)
posteffect add @a gourd_guard:fade_black

# Schedule posteffect removal after transition finishes (65 ticks / 3.25s)
schedule function gourd_guard:wave/transition/clear 65t
