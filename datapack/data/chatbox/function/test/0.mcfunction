# Test 0: Single-line dialogue with multiple text colors (Red, Blue, Green)
function chatbox:session/acquire
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

function chatbox:style/0
function chatbox:bossbar/clear/with_all
function chatbox:manage/frame/combine
function chatbox:bossbar/display/on

data modify storage chatbox:main Buffer set value [{Char:"R",Length:6,Format:'{"text":"","color":"#FF3A3A"}'},{Char:"e",Length:6},{Char:"d",Length:6},{Char:" ",Length:4},{Char:"i",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"f",Length:5,Format:'{"text":"","color":"#FF3A3A"}'},{Char:"i",Length:2},{Char:"r",Length:6},{Char:"e",Length:6},{Char:",",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:" ",Length:4},{Char:"b",Length:6,Format:'{"text":"","color":"#3A64FF"}'},{Char:"l",Length:3},{Char:"u",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"i",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"c",Length:6,Format:'{"text":"","color":"#3A64FF"}'},{Char:"a",Length:6},{Char:"l",Length:3},{Char:"m",Length:6},{Char:",",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:" ",Length:4},{Char:"g",Length:6,Format:'{"text":"","color":"#5EFF3A"}'},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"e",Length:6},{Char:"n",Length:6},{Char:" ",Length:4},{Char:"i",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"l",Length:3,Format:'{"text":"","color":"#5EFF3A"}'},{Char:"i",Length:2},{Char:"f",Length:5},{Char:"e",Length:6},{Char:".",Length:2,Format:'{"text":"","color":"#BBBBBB"}'}]
scoreboard players set #chatbox.text.timer loy.value 0
function chatbox:session/save
