# gourd_guard:prop/waterwheel/remove_all
# Removes all Waterwheel props in loaded chunks
function aj:gourdguard_prop_waterwheel/remove/all
stopsound @a ambient gourd_guard:prop.waterwheel.spin
scoreboard players set #waterwheel_spin gg.timer 0