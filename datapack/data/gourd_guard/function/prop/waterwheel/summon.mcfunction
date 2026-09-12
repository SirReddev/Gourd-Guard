# gourd_guard:prop/waterwheel/summon
# Summons the Waterwheel prop and starts the spinning wheel animation
execute rotated ~ 0 run function aj:gourdguard_prop_waterwheel/summon {args:{animation:"waterwheel_spin",start_animation:true}}

# Start sound immediately
function gourd_guard:prop/waterwheel/play_spin_sound