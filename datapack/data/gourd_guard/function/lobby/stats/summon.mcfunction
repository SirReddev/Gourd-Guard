# gourd_guard:lobby/stats/summon
# Summons the Statistics text display at current location

summon minecraft:text_display ~ ~2.0 ~ {billboard:"vertical",background:1426063360,line_width:260,transformation:{scale:[1.15f,1.15f,1.15f],translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},Tags:["gg_stats_display"],text:{text:"Loading Statistics...",color:"gray"}}

function gourd_guard:lobby/stats/update

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Statistics text display summoned!","color":"green","bold":true}]
