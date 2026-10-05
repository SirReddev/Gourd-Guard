# Pathfinding System - Main Tick
#
# OPTIMIZATION STRATEGY:
#   • Movement  (tp forward)         → every tick   — O(mobs), very cheap
#   • Direction + node advance check → every 3 ticks — O(mobs × nodes), expensive
#
# Result: entity iteration reduced ~15x vs naive every-tick approach

# ── EVERY TICK: walk forward ────────────────────────────────────────────────
# Each mob simply advances in the direction it was last pointed toward.
# No entity lookups needed here — rotation was cached in the mob's own NBT.
execute as @e[tag=path_mob,scores={path.state=1..}] at @s \
    run function gourd_guard:path/mob/walk

# ── EVERY 3 TICKS: update facing + check node advance ───────────────────────
scoreboard players add #path_tick path.tick 1
execute if score #path_tick path.tick matches 3.. \
    run scoreboard players set #path_tick path.tick 0

execute if score #path_tick path.tick matches 0 \
    run execute as @e[tag=path_mob,scores={path.state=1..}] at @s \
    run function gourd_guard:path/mob/process
