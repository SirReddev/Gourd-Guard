# Initialize previous balance if missing
execute unless score @s coins_prev matches 0.. run scoreboard players operation @s coins_prev = @s coins

# Fast exit if balance is unchanged and no active pop animation
execute if score @s coins = @s coins_prev unless score @s coins_pop matches 1.. run return 0

# === 1. Detect Coin Gain (+) ===
execute if score @s coins > @s coins_prev run scoreboard players operation .delta math = @s coins
execute if score @s coins > @s coins_prev run scoreboard players operation .delta math -= @s coins_prev

# If ongoing positive pop -> Accumulate into combo (+1 -> +2 -> +3...)
execute if score @s coins > @s coins_prev if score @s coins_pop matches 1.. if score @s coins_pop_type matches 1 run scoreboard players operation @s coins_diff += .delta math

# If fresh gain or switching from loss -> Start new combo pop
execute if score @s coins > @s coins_prev unless score @s coins_pop matches 1.. run scoreboard players operation @s coins_diff = .delta math
execute if score @s coins > @s coins_prev if score @s coins_pop matches 1.. unless score @s coins_pop_type matches 1 run scoreboard players operation @s coins_diff = .delta math

# Refresh pop state & combo timer (20 ticks = 1.0s window)
execute if score @s coins > @s coins_prev run scoreboard players set @s coins_pop_type 1
execute if score @s coins > @s coins_prev run scoreboard players set @s coins_pop 20
execute if score @s coins > @s coins_prev run scoreboard players operation @s coins_prev = @s coins

# === 2. Detect Coin Loss / Spend (-) ===
execute if score @s coins < @s coins_prev run scoreboard players operation .delta math = @s coins_prev
execute if score @s coins < @s coins_prev run scoreboard players operation .delta math -= @s coins

# If ongoing negative pop -> Accumulate loss
execute if score @s coins < @s coins_prev if score @s coins_pop matches 1.. if score @s coins_pop_type matches 2 run scoreboard players operation @s coins_diff += .delta math

# If fresh loss -> Start new negative pop
execute if score @s coins < @s coins_prev unless score @s coins_pop matches 1.. run scoreboard players operation @s coins_diff = .delta math
execute if score @s coins < @s coins_prev if score @s coins_pop matches 1.. unless score @s coins_pop_type matches 2 run scoreboard players operation @s coins_diff = .delta math

# Refresh pop state & loss timer (20 ticks = 1.0s window)
execute if score @s coins < @s coins_prev run scoreboard players set @s coins_pop_type 2
execute if score @s coins < @s coins_prev run scoreboard players set @s coins_pop 20
execute if score @s coins < @s coins_prev run scoreboard players operation @s coins_prev = @s coins

# === 3. Decrement pop timer ===
execute if score @s coins_pop matches 1.. run scoreboard players remove @s coins_pop 1