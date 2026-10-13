# 1. Initialize newly dropped candies (prevent hotbar pickup, never despawn & set black glow)
execute as @e[type=item,tag=!gg_candy_init] if data entity @s Item.components."minecraft:custom_data".candy run function gourd_guard:candy/init
tag @e[type=item,tag=!gg_candy_init] add gg_candy_init

# Early exit if no active candy items exist in the world
execute unless entity @e[type=item,tag=gg_candy] run return 0

# 2. Detect players holding or wearing the Candy Magnet (mainhand, offhand, or head)
tag @a remove gg_holding_magnet
execute as @a if items entity @s weapon.mainhand *[minecraft:custom_data~{gg_magnet:1b}] run tag @s add gg_holding_magnet
execute as @a if items entity @s weapon.offhand *[minecraft:custom_data~{gg_magnet:1b}] run tag @s add gg_holding_magnet
execute as @a if items entity @s armor.head *[minecraft:custom_data~{gg_magnet:1b}] run tag @s add gg_holding_magnet
execute as @a if items entity @s weapon.mainhand *[minecraft:item_model="gourd_guard:magnet"] run tag @s add gg_holding_magnet
execute as @a if items entity @s weapon.offhand *[minecraft:item_model="gourd_guard:magnet"] run tag @s add gg_holding_magnet
execute as @a if items entity @s armor.head *[minecraft:item_model="gourd_guard:magnet"] run tag @s add gg_holding_magnet

# 3. Collect candies when hitting player body (<= 1.2 blocks from player)
execute as @e[type=item,tag=gg_candy] at @s if entity @p[distance=..1.2] run function gourd_guard:candy/collect

# 4. Magnetic pull:
#    - Default: Pull smoothly into any player within 3.0 blocks
#    - Holding Candy Magnet: Pull all dropped candy within 50.0 blocks towards the magnet holder
tag @e[type=item,tag=gg_candy] remove gg_being_pulled
execute as @e[type=item,tag=gg_candy] at @s if entity @p[distance=1.2..3.0] run function gourd_guard:candy/pull
execute as @e[type=item,tag=gg_candy,tag=!gg_being_pulled] at @s if entity @p[tag=gg_holding_magnet,distance=1.2..50.0] run function gourd_guard:candy/pull_magnet

# Restore gravity if a mid-air candy is no longer being pulled by a magnet
execute as @e[type=item,tag=gg_candy,tag=gg_magnet_pulled,tag=!gg_being_pulled] run data merge entity @s {NoGravity: 0b}
tag @e[type=item,tag=gg_candy,tag=gg_magnet_pulled,tag=!gg_being_pulled] remove gg_magnet_pulled