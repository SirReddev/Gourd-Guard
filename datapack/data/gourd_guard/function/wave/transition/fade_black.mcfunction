# Add native posteffect fade transition (15t fade in, 25t black hold, 15t fade out)
posteffect add @a gourd_guard:fade_black

# Set tick-driven cleanup timer and backup schedule after 55-tick transition ends
scoreboard players set .wave fade_timer 60
schedule function gourd_guard:wave/transition/clear 60t
