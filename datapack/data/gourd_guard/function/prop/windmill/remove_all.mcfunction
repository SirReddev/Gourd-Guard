# gourd_guard:prop/windmill/remove_all
# Removes all Windmill props in loaded chunks
function aj:gourdguard_prop_windmill/remove/all
stopsound @a ambient gourd_guard:prop.windmill.spin
scoreboard players set #windmill_spin gg.timer 0