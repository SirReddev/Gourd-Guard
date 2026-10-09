# gourd_guard:hud/fetch_player_name
# Synchronously extract username from player head

loot replace entity @s enderchest.0 loot gourd_guard:player_head
data modify storage gourd_guard:hud macro.player set from entity @s EnderItems[{Slot:0b}].components."minecraft:profile".name
execute unless data storage gourd_guard:hud macro.player run data modify storage gourd_guard:hud macro.player set from entity @s EnderItems[{Slot:0b}].components."minecraft:profile"
execute unless data storage gourd_guard:hud macro.player run data modify storage gourd_guard:hud macro.player set from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
execute unless data storage gourd_guard:hud macro.player run data modify storage gourd_guard:hud macro.player set from entity @s EnderItems[{Slot:0b}].tag.SkullOwner
item replace entity @s enderchest.0 with air

# Fallback if in offline/unauthenticated dev test
execute unless data storage gourd_guard:hud macro.player run data modify storage gourd_guard:hud macro.player set value "Sir_Reddev"
