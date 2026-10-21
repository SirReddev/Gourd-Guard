# Macro: update mob health display directly above head with heart icon in red color
$data modify entity @s CustomName set value '[{"text":"❤ ","color":"red","bold":true},{"text":"$(hp)","color":"red","bold":true}]'
data modify entity @s CustomNameVisible set value 1b
