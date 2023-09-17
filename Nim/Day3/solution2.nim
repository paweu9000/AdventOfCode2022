import strutils, sets

var file: seq[string] = open("input.txt").readAll().split("\r\n")

var inters: int

for i in countup(0, file.len-1, 3):
  let common: HashSet[char] = toHashSet(file[i]) * toHashSet(file[i+1]) * toHashSet(file[i+2])
  for x in common.items:
        if x.isLowerAscii:
            inters += ord(x) - 96
        else:
            inters += ord(x) - 38

echo inters