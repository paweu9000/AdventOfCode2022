import strutils, sets

var file: seq[string] = open("input.txt").readAll().split("\r\n")

var inters: int

for f in file:
    var
        str1: string = f[0 .. f.len div 2 - 1]
        str2: string = f[f.len div 2 .. ^1]
        strSet: HashSet[char] = toHashSet(str1) * toHashSet(str2)
    for x in strSet.items:
        if x.isLowerAscii:
            inters += ord(x) - 96
        else:
            inters += ord(x) - 38

echo inters