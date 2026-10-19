# gourd_guard:player/join
# Executed as any player who joins the map for the first time

# 1. Tag player so this only runs once per player
tag @s add has_joined
tag @s add gg_joined

# 2. Teleport to initial start location for new players
execute in minecraft:overworld run tp @s 2270.45 -2.00 5.15 -178.95 -3.00

# 3. Set their spawnpoint here
execute in minecraft:overworld run spawnpoint @s 2270 -2 5 -178.95

# 4. Set Adventure mode (unless tagged gourd_test)
gamemode adventure @s[tag=!gourd_test]

# 5. Clear any lingering posteffects or accidental deco tags
posteffect remove @s gourd_guard:cutscene_fade
posteffect remove @s gourd_guard:fade_black
tag @s remove gg_npc_deco

# 6. Ensure core player scoreboard objectives exist
scoreboard objectives add gg_skip trigger
scoreboard objectives add coins dummy
scoreboard objectives add coins_prev dummy
scoreboard objectives add coins_diff dummy
scoreboard objectives add coins_pop dummy
scoreboard objectives add coins_pop_type dummy
scoreboard objectives add hud_toggle dummy
scoreboard objectives add fly_status dummy
scoreboard objectives add fly_hold dummy
scoreboard objectives add chatbox.session dummy
scoreboard objectives add chatbox.page dummy

# 7. Initialize player scores and triggers
scoreboard players enable @s gg_skip
execute unless score @s hud_toggle matches 0..1 run scoreboard players set @s hud_toggle 1
execute unless score @s coins matches 0.. run scoreboard players set @s coins 0
execute unless score @s coins_prev matches 0.. run scoreboard players set @s coins_prev 0
execute unless score @s coins_diff matches 0.. run scoreboard players set @s coins_diff 0
execute unless score @s coins_pop matches 0.. run scoreboard players set @s coins_pop 0
execute unless score @s coins_pop_type matches 0.. run scoreboard players set @s coins_pop_type 0
execute unless score @s fly_status matches 0.. run scoreboard players set @s fly_status 0
execute unless score @s fly_hold matches 0.. run scoreboard players set @s fly_hold 0
execute unless score @s chatbox.session matches 0.. run scoreboard players set @s chatbox.session 0
execute unless score @s chatbox.page matches 0.. run scoreboard players set @s chatbox.page 0

# 8. Ensure start display is centered for client
execute in minecraft:overworld as @e[type=text_display,tag=gg_start_display] run data merge entity @s {alignment:"center"}
