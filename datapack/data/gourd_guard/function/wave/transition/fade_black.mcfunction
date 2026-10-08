# Add native posteffect fade transition (smooth to black and back to normal)
posteffect add @a gourd_guard:fade_black

# Schedule cleanup after 120-tick (6.0s) transition completes
schedule function gourd_guard:wave/transition/clear 125t
