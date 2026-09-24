# Calculates intersection point of a ray and a plane.
# Ray origin (relative to plane origin): math.input.0 math.input.1 math.input.2
# Ray unit vector: math.input.3 math.input.4 math.input.5
# Plane normal: math.input.6 math.input.7 math.input.8
# Returns intersection point relative to plane origin: math.output.0 math.output.1 math.output.2

scoreboard players operation #math.temp.1 loy.value = #math.input.0 loy.value
scoreboard players operation #math.temp.2 loy.value = #math.input.1 loy.value
scoreboard players operation #math.temp.3 loy.value = #math.input.2 loy.value
scoreboard players operation #math.temp.4 loy.value = #math.input.3 loy.value
scoreboard players operation #math.temp.5 loy.value = #math.input.4 loy.value
scoreboard players operation #math.temp.6 loy.value = #math.input.5 loy.value
scoreboard players operation #math.temp.7 loy.value = #math.input.6 loy.value
scoreboard players operation #math.temp.8 loy.value = #math.input.7 loy.value
scoreboard players operation #math.temp.9 loy.value = #math.input.8 loy.value

# Calculate distance between origin and plane
scoreboard players operation #math.input.3 loy.value = #math.temp.7 loy.value
scoreboard players operation #math.input.4 loy.value = #math.temp.8 loy.value
scoreboard players operation #math.input.5 loy.value = #math.temp.9 loy.value
function generic:math/vector/dot/do
scoreboard players operation #math.temp.10 loy.value = #math.output.0 loy.value
scoreboard players operation #math.temp.10 loy.value *= #_1 loy.value

# Calculate ray projection onto normal
scoreboard players operation #math.input.0 loy.value = #math.temp.4 loy.value
scoreboard players operation #math.input.1 loy.value = #math.temp.5 loy.value
scoreboard players operation #math.input.2 loy.value = #math.temp.6 loy.value
function generic:math/vector/dot/do

# If 0, ray is parallel to plane
execute if score #math.output.0 loy.value matches 0 run return 0

# Calculate vector from origin to intersection
scoreboard players operation #math.temp.10 loy.value *= #10000 loy.value
scoreboard players operation #math.temp.10 loy.value /= #math.output.0 loy.value

# If signs differ, no intersection in ray direction
execute if score #math.temp.10 loy.value matches ..0 run return 0

scoreboard players operation #math.temp.4 loy.value *= #math.temp.10 loy.value
scoreboard players operation #math.temp.4 loy.value /= #10000 loy.value
scoreboard players operation #math.temp.5 loy.value *= #math.temp.10 loy.value
scoreboard players operation #math.temp.5 loy.value /= #10000 loy.value
scoreboard players operation #math.temp.6 loy.value *= #math.temp.10 loy.value
scoreboard players operation #math.temp.6 loy.value /= #10000 loy.value

scoreboard players operation #math.output.0 loy.value = #math.temp.1 loy.value
scoreboard players operation #math.output.0 loy.value += #math.temp.4 loy.value
scoreboard players operation #math.output.1 loy.value = #math.temp.2 loy.value
scoreboard players operation #math.output.1 loy.value += #math.temp.5 loy.value
scoreboard players operation #math.output.2 loy.value = #math.temp.3 loy.value
scoreboard players operation #math.output.2 loy.value += #math.temp.6 loy.value
return 1
