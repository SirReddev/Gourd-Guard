# gourd_guard:prop/windmill/player_enter
# Triggers immediately when a player enters the 15-block radius
tag @s add in_windmill_zone
execute as @e[type=item_display,tag=aj.gourdguard_prop_windmill.root,distance=..15,limit=1,sort=nearest] at @s run playsound gourd_guard:prop.windmill.spin ambient @p ~ ~ ~ 0.25 1 0.0