# gourd_guard:lobby/leaderboard/summon
# Summons the Leaderboard text display at current location

summon minecraft:text_display ~ ~2.0 ~ {billboard:"vertical",background:1426063360,line_width:260,transformation:{scale:[1.15f,1.15f,1.15f],translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},Tags:["gg_leaderboard_display"],text:'{"text":"Loading Records...","color":"gray"}'}

function gourd_guard:lobby/leaderboard/update

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Leaderboard text display summoned!","color":"green","bold":true}]
