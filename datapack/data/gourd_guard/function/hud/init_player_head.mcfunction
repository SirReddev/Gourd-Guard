# gourd_guard:hud/init_player_head
# Generates player head in enderchest, mounts an invisible item_display holding it to @s

# 1. Clean up old displays/markers
execute at @s run kill @e[type=item_display,tag=gg_player_head,distance=..3]
execute at @s run kill @e[type=marker,tag=gg_player_head,distance=..3]

# 2. Generate head to resolve username
loot replace entity @s enderchest.0 loot gourd_guard:player_head

# 3. Summon invisible item_display at player
execute at @s run summon item_display ~ ~ ~ {Tags:["gg_player_head"],view_range:0.0f}

# 4. Copy player_head from enderchest into item_display contents
item replace entity @e[type=item_display,tag=gg_player_head,distance=..1,limit=1] contents from entity @s enderchest.0

# 5. Clear player enderchest slot 0
item replace entity @s enderchest.0 with air

# 6. Mount item_display onto player @s
ride @e[type=item_display,tag=gg_player_head,distance=..1,limit=1] mount @s

tag @s add gg_has_head
