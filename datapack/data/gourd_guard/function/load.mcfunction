scoreboard objectives add gg.timer dummy
scoreboard objectives add gg.xp_pts dummy
scoreboard players set #player_buff_timer gg.timer 0

# Clean up legacy first-interaction objectives if they exist
scoreboard objectives remove gg.talked_witch
scoreboard objectives remove gg.talked_archer
scoreboard objectives remove gg.talked_blacksmith
scoreboard objectives remove gg.talked_gravedigger

# Gourd Guard Datapack Initialized
function gourd_guard:path/init
function gourd_guard:cutscene/init
function gourd_guard:item_glow/setup_teams
function gourd_guard:hud/setup
function gourd_guard:tower/init
function gourd_guard:fly/info

# Wave System Objectives
scoreboard objectives add map dummy
scoreboard objectives add wave dummy
scoreboard objectives add wave_mobs dummy
scoreboard objectives add state dummy
scoreboard objectives add spawn_timer dummy
scoreboard objectives add spawn_done dummy
scoreboard objectives add wave.state dummy
scoreboard objectives add wave.timer dummy
scoreboard objectives add wave.spawn_timer dummy
scoreboard objectives add wave.spawn_done dummy
scoreboard objectives add obj_hp dummy
scoreboard objectives add obj_max_hp dummy
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.option dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.state dummy
scoreboard objectives add path.cmp dummy

execute unless score .global map matches 1.. run scoreboard players set .global map 1
execute unless score .global wave matches 1.. run scoreboard players set .global wave 1
execute unless score .wave state matches 0.. run scoreboard players set .wave state 0

# Re-register existing Gourd Guard Pumpkins in Animated Java data_manager and sync variant with wave state
data modify storage animated_java:temp args set value {variant:'default', animation:'idle', frame: 0}
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] at @s run function aj:gourdguard_pumpkin/zzz/summon/as_root_entity
execute if score .wave state matches 1..2 run function gourd_guard:pumpkin/set_on
execute unless score .wave state matches 1..2 run function gourd_guard:pumpkin/set_default