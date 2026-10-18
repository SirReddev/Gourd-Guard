# Remove posteffect transition
posteffect remove @a gourd_guard:fade_black
posteffect remove @a gourd_guard:cutscene_fade
tag @a remove gg_npc_deco

# Transition finished: return to state 0 (Lobby / Idle)
scoreboard players set .wave state 0
scoreboard players set #game_active gg_stats 0
scoreboard players set .global cs.state 0

# Guarantee any player still in map is teleported to lobby
execute in minecraft:overworld run tp @a[x=2350..3200] 2270.47 -2.00 5.34 181.2 -6.90
execute in minecraft:overworld run spawnpoint @a 2270 -2 5 181.2

# Disable Adventure Mode Flight after the fade & strip elytra
function gourd_guard:fly/disable
item replace entity @a armor.chest with air
clear @a minecraft:elytra
scoreboard players set @a chatbox.session 0
scoreboard players set @a fly_hold 0

# Announce reset complete when returning to normal screen
tellraw @a [{"text":"[Gourd Guard] ","color":"green"},{"text":"Game reset. Ready for next playthrough!","color":"gray"}]
