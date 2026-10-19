# Add native posteffect fade transition (15t fade in, 25t black hold, 15t fade out)
posteffect add @a gourd_guard:fade_black

# Schedule cleanup after 55-tick (2.75s) transition ends
schedule function gourd_guard:wave/transition/clear 60t
