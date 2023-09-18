import sets

let line = open("input.txt").readLine

var result: int
for c in 0..line.len-1:
    let set1 = toHashSet([line[c], line[c+1], line[c+2], line[c+3]])
    if set1.len == 4:
        result = c+4
        break

echo result