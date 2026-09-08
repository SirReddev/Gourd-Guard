# gourd_guard:npc/witchstand/summon
# Summons the Witchstand NPC model, locks vertical pitch to 0, and starts the idle animation.

# Mark existing root entities to uniquely isolate the new spawn
tag @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root] add gourdguard.old_witch

# Summon witchstand with vertical pitch locked to 0
execute rotated ~ 0 run function aj:gourdguard_npc_witchstand/summon

# Initialize the newly spawned instance
execute as @e[type=item_display,tag=aj.gourdguard_npc_witchstand.root,tag=!gourdguard.old_witch,limit=1,sort=nearest] at @s run function gourd_guard:npc/witchstand/init_instance

# Clean up marker tag
tag @e[type=item_display,tag=gourdguard.old_witch] remove gourdguard.old_witch