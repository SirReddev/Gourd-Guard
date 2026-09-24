# Test 2: Standard single-line dialogue with avatar
function chatbox:session/acquire
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

function chatbox:style/0
function chatbox:bossbar/clear/with_all
function chatbox:manage/frame/combine
function chatbox:bossbar/display/on

data modify storage chatbox:main Buffer set value [{Char:"*",Length:6},{Char:" ",Length:4},{Char:"L",Length:6},{Char:"e",Length:6},{Char:"t",Length:4},{Char:"\u2019",Length:2},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"g",Length:6},{Char:"e",Length:6},{Char:"t",Length:4},{Char:" ",Length:4},{Char:"s",Length:6},{Char:"t",Length:4},{Char:"a",Length:6},{Char:"r",Length:6},{Char:"t",Length:4},{Char:"e",Length:6},{Char:"d",Length:6},{Char:"!",Length:2}]
scoreboard players set #chatbox.text.timer loy.value 0
function chatbox:session/save
