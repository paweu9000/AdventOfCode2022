import strutils

let file = open("input.txt").readAll().split("\r\n")

proc inRange(str1, str2: string): bool =
    var
        ls1 = str1.split("-")
        ls2 = str2.split("-")
        low1 = parseInt(ls1[0])
        high1 = parseInt(ls1[1])
        low2 = parseInt(ls2[0])
        high2 = parseInt(ls2[1])
    (low1 <= high2 and low1 >= low2 or low2 <= high1 and low2 >= low1)


proc parseStrs(str: string): bool =
    var strs = str.split(",")
    inRange(strs[0], strs[1])

var accum: int

for f in file:
    if parseStrs(f):
        inc(accum)

echo accum