# gourd_guard:hud/init_player_head
# Generates player head in enderchest, extracts player name, and mounts a data marker to @s

# 1. Clean up old displays/markers
execute at @s run kill @e[type=item_display,tag=gg_player_head,distance=..2]
execute at @s run kill @e[type=marker,tag=gg_player_head,distance=..2]

# 2. Generate head to resolve username
loot replace entity @s enderchest.0 loot gourd_guard:player_head

# 3. Extract profile name into temp storage
data remove storage gourd_guard:hud macro.temp_name
data modify storage gourd_guard:hud macro.temp_name set from entity @s EnderItems[{Slot:0b}].components."minecraft:profile".name
execute unless data storage gourd_guard:hud macro.temp_name run data modify storage gourd_guard:hud macro.temp_name set from entity @s EnderItems[{Slot:0b}].components."minecraft:profile"
execute unless data storage gourd_guard:hud macro.temp_name run data modify storage gourd_guard:hud macro.temp_name set from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
execute unless data storage gourd_guard:hud macro.temp_name run data modify storage gourd_guard:hud macro.temp_name set from entity @s EnderItems[{Slot:0b}].tag.SkullOwner

# 4. Clear enderchest slot 0
item replace entity @s enderchest.0 with air

# 5. Summon data marker, save name into it, and mount to @s
execute at @s run summon marker ~ ~ ~ {Tags:["gg_player_head"]}
data modify entity @e[type=marker,tag=gg_player_head,distance=..1,limit=1] data.name set from storage gourd_guard:hud macro.temp_name
ride @e[type=marker,tag=gg_player_head,distance=..1,limit=1] mount @s

tag @s add gg_has_head
