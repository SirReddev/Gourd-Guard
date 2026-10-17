# gourd_guard:lobby/start_display/summon
# Summons the interactive Start Game text display with the Gourd pixel icon and "RIGHT CLICK TO START" button badge, plus interaction hitbox

# Text Display (NBT component list with custom font glyphs):
summon minecraft:text_display ~ ~1.6 ~ {billboard:"center",background:0,transformation:{scale:[1.4f,1.4f,1.4f],translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},Tags:["gg_start_display"],text:[{text:"\uE304\n",color:"white"},{text:"\uE302",color:"white"}]}

# Interaction Hitbox for Right-Click
summon minecraft:interaction ~ ~0.6 ~ {width:2.2f,height:2.6f,response:1b,Tags:["gg_start_display_interaction"]}

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Start Game display & interaction summoned!","color":"green","bold":true}]
