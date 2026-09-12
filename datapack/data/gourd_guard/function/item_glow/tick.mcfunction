# Ensure color teams exist
execute unless score .init glow_init matches 1 run function gourd_guard:item_glow/setup_teams

# Fast 1-check evaluation of newly dropped items (0 cost when no new items dropped)
execute if entity @e[type=item,tag=!glow_checked] as @e[type=item,tag=!glow_checked] run function gourd_guard:item_glow/check_item