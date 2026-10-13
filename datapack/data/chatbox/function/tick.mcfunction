# Execute session ticks for active player sessions (limit=1 so shared cutscene sessions only tick once per game tick)
execute as @a[scores={chatbox.session=1},limit=1] at @s run function chatbox:session/s1/tick
execute as @a[scores={chatbox.session=2},limit=1] at @s run function chatbox:session/s2/tick
execute as @a[scores={chatbox.session=3},limit=1] at @s run function chatbox:session/s3/tick
execute as @a[scores={chatbox.session=4},limit=1] at @s run function chatbox:session/s4/tick

# Auto-cleanup orphaned sessions if player disconnected
execute if score #chatbox.s1.busy loy.value matches 1 unless entity @a[scores={chatbox.session=1}] run function chatbox:session/s1/release
execute if score #chatbox.s2.busy loy.value matches 1 unless entity @a[scores={chatbox.session=2}] run function chatbox:session/s2/release
execute if score #chatbox.s3.busy loy.value matches 1 unless entity @a[scores={chatbox.session=3}] run function chatbox:session/s3/release
execute if score #chatbox.s4.busy loy.value matches 1 unless entity @a[scores={chatbox.session=4}] run function chatbox:session/s4/release

# Decrement sneak debounce cooldown timer
execute as @a[scores={chatbox.sneak_cd=1..}] run scoreboard players remove @s chatbox.sneak_cd 1

# Detect player sneaking (supports entity predicate + scoreboard criterion for 100% instant detection)
execute as @a[predicate=chatbox:is_sneaking] run scoreboard players set @s chatbox.sneak 1

# Check for player sneak / Shift to advance or skip dialogues (rising edge: sneak >= 1 and was_sneaking == 0)
execute as @a[scores={chatbox.session=1..4,chatbox.sneak=1..}] unless score @s chatbox.was_sneaking matches 1 unless score @s chatbox.sneak_cd matches 1.. at @s run function chatbox:sequence/on_sneak_player

# Update was_sneaking state (1 if sneaking this tick, 0 if not sneaking this tick)
execute as @a[scores={chatbox.sneak=1..}] run scoreboard players set @s chatbox.was_sneaking 1
execute as @a[scores={chatbox.sneak=0}] run scoreboard players set @s chatbox.was_sneaking 0

# Reset sneak tick counter
execute as @a[scores={chatbox.sneak=1..}] run scoreboard players set @s chatbox.sneak 0
