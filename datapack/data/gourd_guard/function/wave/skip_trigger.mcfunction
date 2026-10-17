# gourd_guard:wave/skip_trigger
# Executed as a player when they run /trigger gg_skip or click [SKIP] in chat

# Reset score so it does not trigger multiple times
scoreboard players set @s gg_skip 0
# Re-enable trigger for future intermissions
scoreboard players enable @s gg_skip

# Execute skip function
function gourd_guard:wave/skip
