# gourd_guard:npc/interact/tick
# Auto-ensures all NPC stands have active interaction hitboxes and handles right-click interactions

# Periodic check: Ensure hitboxes exist once every 20 ticks (1.0s)
scoreboard players add #npc_check gg.timer 1
execute if score #npc_check gg.timer matches 20.. run function gourd_guard:npc/interact/ensure_hitboxes

# Keep Peeves hitbox aligned with Peeves root
execute as @e[type=interaction,tag=gg_peeves_interaction] at @e[type=item_display,tag=peeves_ghost_root,limit=1] run tp @s ~ ~-0.5 ~

# Checks for right-click player interaction on NPC interaction entities (executes as the interacting player at the hitbox)
execute as @e[type=minecraft:interaction,tag=gg_npc_interaction] if data entity @s interaction at @s as @p[distance=..5] run function gourd_guard:npc/interact/handle
