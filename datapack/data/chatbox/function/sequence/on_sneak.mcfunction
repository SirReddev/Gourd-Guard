# Handles player Shift / Sneak input during dialogue
scoreboard players set #chatbox.sneak.handled loy.value 0

# 0. If shop UI is active, delegate Shift to shop purchase handler
execute if data storage chatbox:shop {Active:1b} run function chatbox:shop/on_sneak
execute if data storage chatbox:shop {Active:1b} run scoreboard players set #chatbox.sneak.handled loy.value 1

# 1. If currently paused at a page break (current.line >= 3 and Buffer has characters for next page): turn page
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 if score #chatbox.current.line loy.value matches 3.. if data storage chatbox:main Buffer[0] run function chatbox:sequence/turn_page

# 2. If currently typing (Buffer has characters), fast-forward current page
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 if data storage chatbox:main Buffer[0] run function chatbox:sequence/fast_forward

# 3. If in sequence mode and done typing: advance to next part
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 if data storage chatbox:main {SequenceActive:1b} run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.35 0.95
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 if data storage chatbox:main {SequenceActive:1b} run function chatbox:sequence/next_part
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 if data storage chatbox:main {SequenceActive:1b} run scoreboard players set #chatbox.sneak.handled loy.value 1

# 4. If single-page mode (not sequence) and done typing: close dialogue (unless shop opened)
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.35 0.9
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} run function chatbox:bossbar/display/off
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} run function chatbox:session/release
execute if score #chatbox.sneak.handled loy.value matches 0 if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:main {SequenceActive:1b} run scoreboard players set #chatbox.sneak.handled loy.value 1

# Set 4-tick debounce cooldown on the player so holding shift does not skip multiple pages
scoreboard players set @s chatbox.sneak_cd 4
