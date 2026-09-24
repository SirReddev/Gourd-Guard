# Test 4: Three-line dialogue filling all rows
function chatbox:session/acquire
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

function chatbox:style/0
function chatbox:bossbar/clear/with_all
function chatbox:manage/frame/combine
function chatbox:bossbar/display/on

data modify storage chatbox:main Buffer set value [{Char:"H",Length:6},{Char:"e",Length:6},{Char:"l",Length:3},{Char:"l",Length:3},{Char:"o",Length:6},{Char:" ",Length:4},{Char:"a",Length:6},{Char:"d",Length:6},{Char:"v",Length:6},{Char:"e",Length:6},{Char:"n",Length:6},{Char:"t",Length:4},{Char:"u",Length:6},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"r",Length:6},{Char:"!",Length:2},{Next:1b},{Char:"W",Length:6,Delay:10},{Char:"e",Length:6},{Char:"l",Length:3},{Char:"c",Length:6},{Char:"o",Length:6},{Char:"m",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"t",Length:4},{Char:"o",Length:6},{Char:" ",Length:4},{Char:"t",Length:4},{Char:"h",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"q",Length:6},{Char:"u",Length:6},{Char:"e",Length:6},{Char:"s",Length:6},{Char:"t",Length:4},{Char:".",Length:2},{Next:1b},{Char:"A",Length:6,Delay:10},{Char:"r",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"y",Length:6},{Char:"o",Length:6},{Char:"u",Length:6},{Char:" ",Length:4},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"a",Length:6},{Char:"d",Length:6},{Char:"y",Length:6},{Char:"?",Length:6}]
scoreboard players set #chatbox.text.timer loy.value 0
function chatbox:session/save
