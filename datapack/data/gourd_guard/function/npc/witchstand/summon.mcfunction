# gourd_guard:npc/witchstand/summon
# Summons the Witchstand NPC model, locks vertical pitch to 0, and starts the idle animation.

execute rotated ~ 0 run function aj:gourdguard_npc_witchstand/summon {args:{animation:"idle",start_animation:true}}