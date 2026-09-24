# Test 3: Multi-line bold and colored text
function chatbox:session/acquire
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

function chatbox:style/0
function chatbox:bossbar/clear/with_all
function chatbox:manage/frame/combine
function chatbox:bossbar/display/on

data modify storage chatbox:main Buffer set value [{Char:"B",Length:7,Format:'{"text":"","bold":true}'},{Char:"o",Length:7},{Char:"l",Length:4},{Char:"d",Length:7},{Char:" ",Length:5},{Char:"t",Length:4,Format:'{"text":"","bold":false}'},{Char:"e",Length:6},{Char:"x",Length:6},{Char:"t",Length:4},{Char:" ",Length:4},{Char:"a",Length:7,Format:'{"text":"","bold":true}'},{Char:"n",Length:7},{Char:"d",Length:7},{Next:1b},{Char:"c",Length:6,Format:'{"text":"","bold":false,"color":"#FF4444"}'},{Char:"o",Length:6},{Char:"l",Length:3},{Char:"o",Length:6},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"d",Length:6},{Char:" ",Length:4},{Char:"s",Length:6,Format:'{"text":"","color":"#55FF55"}'},{Char:"t",Length:4},{Char:"y",Length:6},{Char:"l",Length:3},{Char:"e",Length:6},{Char:"s",Length:6},{Char:"!",Length:2}]
scoreboard players set #chatbox.text.timer loy.value 0
function chatbox:session/save
