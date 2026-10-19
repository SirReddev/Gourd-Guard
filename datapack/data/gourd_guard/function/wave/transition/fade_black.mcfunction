# Add native posteffect fade transition (2s fade in, 8s black hold, 2s fade out, exclude builders)
posteffect add @a[tag=!gourd_test] gourd_guard:fade_black

# Schedule cleanup after full 240-tick (12.0s) transition ends
schedule function gourd_guard:wave/transition/clear 245t
