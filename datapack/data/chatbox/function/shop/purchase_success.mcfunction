# 1. Deduct currency if configured (via subfunction so macro only evaluates present keys)
execute if data storage chatbox:shop Temp.CostItem run function chatbox:shop/deduct/cost_item with storage chatbox:shop Temp
execute if data storage chatbox:shop Temp.CostScore run function chatbox:shop/deduct/cost_score with storage chatbox:shop Temp

# 2. Execute configured item action callback as player (@s)
$execute run $(Action)

# 3. Sound & chat notification
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1.2
$tellraw @s [{"text":"[Shop] Purchased ","color":"#69F0AE"},{"text":"$(Name)","color":"#FFF5C5"},{"text":"!","color":"#69F0AE"}]

# 4. Re-render all shop rows immediately so afford/deny state updates dynamically
function chatbox:shop/render
