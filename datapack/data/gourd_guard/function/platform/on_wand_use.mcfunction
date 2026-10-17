# gourd_guard:platform/on_wand_use
# Triggered when player right-clicks with Platform Marker Wand
execute if predicate chatbox:is_sneaking run return run function gourd_guard:platform/remove
function gourd_guard:platform/add
