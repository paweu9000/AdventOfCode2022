import strutils, sequtils, sugar, deques

type Todo = object
    move: int
    fro: int
    to: int

var 
    craneStack: seq[string]
    instructions: seq[string]
    f = open("input.txt")

while true:
    var line = f.readLine()
    if line == "": break
    craneStack.add(line)

for line in f.readAll.split("\r\n"):
    instructions.add(line)

proc mapTodo(str: string): Todo =
    var actions = str.split(" ")
    return Todo(move: parseInt(actions[1]), fro: parseInt(actions[3]), to: parseInt(actions[5]))

let todos: seq[Todo] = instructions.map(x => mapTodo(x))

var queues: seq[Deque[char]]

for i in craneStack[craneStack.len-1]:
    if i != ' ':
        queues.add(initDeque[char]())

craneStack.delete(craneStack.len-1)

for i in craneStack:
    var accum = 0
    for j in countup(1, i.len-2, 4):
        if (i[j] != ' '):
            queues[accum].addLast(i[j])
        inc accum

for todo in todos:
    var tempQue: Deque[char]
    for i in 1..todo.move:
        tempQue.addLast(queues[todo.fro-1].popFirst)
    for i in 0..tempQue.len-1:
        queues[todo.to-1].addFirst(tempQue.popLast)

var result: string

for q in queues:
    try:
        result.add q.peekFirst
    except:
        result.add ""

echo result