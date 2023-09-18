import sets, sugar

let line = open("input.txt").readLine

var result: int
for c in 0..line.len-1:
    let set1 = collect(initHashSet()):
        for i in c..c+13: {line[i]}
    if set1.len == 14:
        result = c+14
        break

echo result