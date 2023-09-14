import strutils, algorithm

let file = open("calories.txt")

let 
    lines = file.readAll()
    list = lines.split("\r\n")

var 
    n = 0
    kcals: seq[int]

for l in list:
    if l == "":
        kcals.add(n)
        n = 0
    else:
        n += parseInt(l)

kcals.add(n)

sort(kcals, Descending)
echo kcals[0]
echo(kcals[0] + kcals[1] + kcals[2])