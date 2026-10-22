scoreboard objectives add gg.timer dummy
scoreboard objectives add gg.xp_pts dummy
scoreboard players set #player_buff_timer gg.timer 0

# Ensure per-player first-interaction objectives exist
scoreboard objectives add gg.talked_witch dummy
scoreboard objectives add gg.talked_archer dummy
scoreboard objectives add gg.talked_blacksmith dummy
scoreboard objectives add gg.talked_gravedigger dummy

# Platform particle objectives
scoreboard objectives add math dummy

# Global World Spawn for New Players
setworldspawn 2270 -2 5 -178.95

# Clear lingering posteffects on reload
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black

# Remove accidental NPC deco tag from players
tag @a remove gg_npc_deco

# Force normal difficulty so summoned hostile wave mobs never despawn
difficulty normal
gamerule doFireTick false

# Permanently forceload Lobby and Map 1 chunk areas so markers are always loaded from anywhere
forceload add 2200 -120 2320 50
forceload add 2350 -200 2650 200

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

# Initialize Leaderboard & Statistics Tracking
scoreboard objectives add gg_skip trigger
scoreboard players enable @a gg_skip
function gourd_guard:lobby/leaderboard/init
function gourd_guard:lobby/stats/init
execute unless score .global wave matches 1.. run scoreboard players set .global wave 1
execute unless score .wave state matches 0.. run scoreboard players set .wave state 0

# Ensure all lobby text displays use vertical billboard rotation
execute as @e[type=text_display,tag=gg_start_display] run data modify entity @s billboard set value "vertical"
execute as @e[type=text_display,tag=gg_start_display] run data modify entity @s alignment set value "center"
execute as @e[type=text_display,tag=gg_start_icon] run data modify entity @s text set value {text:"\uE304",color:"white",font:"minecraft:default"}
execute as @e[type=text_display,tag=gg_start_btn] run data modify entity @s text set value {text:"\uE302",color:"white",font:"minecraft:default"}
execute as @e[type=text_display,tag=gg_leaderboard_display] run data modify entity @s billboard set value "vertical"
execute as @e[type=text_display,tag=gg_stats_display] run data modify entity @s billboard set value "vertical"

# Living mob health tracking (updated automatically by engine)
scoreboard objectives add gg_hp health
scoreboard objectives add gg.slow_timer dummy
scoreboard objectives add gg.slow_dur dummy
scoreboard objectives add gg.slow_val dummy
scoreboard objectives add gg.fw_slow_dur dummy
scoreboard objectives add gg.last_hp dummy
scoreboard objectives add gg.convoy_dmg dummy
scoreboard objectives add gg.ram_cd dummy
scoreboard objectives add mob_hp_tick dummy
scoreboard objectives add intermission_timer dummy
scoreboard objectives add reset_timer dummy
scoreboard objectives add fade_timer dummy
scoreboard objectives add fly_active dummy
scoreboard objectives add gg_temp dummy

# Remove legacy slowness tags from existing mobs on reload
tag @e[tag=gg_slowed] remove gg_slowed

# Clear any lingering dialogue / shop frame bossbars (vignette fix)
bossbar set chatbox:s1_frame name ""
bossbar set chatbox:s2_frame name ""
bossbar set chatbox:s3_frame name ""
bossbar set chatbox:s4_frame name ""
bossbar set chatbox:s1_frame players
bossbar set chatbox:s2_frame players
bossbar set chatbox:s3_frame players
bossbar set chatbox:s4_frame players

# Re-register existing Gourd Guard Pumpkins in Animated Java data_manager and sync variant with wave state
data modify storage animated_java:temp args set value {variant:'default', animation:'idle', frame: 0}
execute as @e[type=item_display,tag=aj.gourdguard_pumpkin.root] at @s run function aj:gourdguard_pumpkin/zzz/summon/as_root_entity
execute if score .wave state matches 1..2 run function gourd_guard:pumpkin/set_on
execute unless score .wave state matches 1..2 run function gourd_guard:pumpkin/set_default

# Refresh Lobby Leaderboard text displays
function gourd_guard:lobby/leaderboard/update

# Initialize command storage containers for macro execution
data merge storage gourd_guard:tower {macro:{dmg:45,splash:20,lvl:1,sell:20,map:1,hp:400f}}
data merge storage gourd_guard:mob {hp:100}
