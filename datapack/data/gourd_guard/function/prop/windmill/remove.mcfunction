# gourd_guard:prop/windmill/remove
# Removes the nearest Windmill prop within 16 blocks
execute if entity @s[tag=aj.gourdguard_prop_windmill.root] run function aj:gourdguard_prop_windmill/remove/this
execute unless entity @s[tag=aj.gourdguard_prop_windmill.root] as @e[type=item_display,tag=aj.gourdguard_prop_windmill.root,distance=..16,limit=1,sort=nearest] run function aj:gourdguard_prop_windmill/remove/this

# Stop sound if no more windmills exist
execute unless entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run stopsound @a ambient gourd_guard:prop.windmill.spin
execute unless entity @e[type=item_display,tag=aj.gourdguard_prop_windmill.root] run scoreboard players set #windmill_spin gg.timer 0