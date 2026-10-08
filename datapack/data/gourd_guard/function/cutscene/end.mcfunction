# Cutscene System - End Cutscene
# Called when Dialogue 2 completes

# 1. Trigger black fade transition
posteffect add @a gourd_guard:cutscene_fade

# 2. Schedule player restoration & spawn setup behind black curtain
schedule function gourd_guard:cutscene/finish_transition 15t
