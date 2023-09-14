import strutils, sequtils

let lines = open("input.txt").readAll().split("\r\n")

type Choices = enum
    rock = 1, paper = 2, scissors = 3

proc pickElem(el: char): Choices =
    case el:
        of 'A': return rock
        of 'B': return paper
        of 'C': return scissors
        of 'X': return rock
        of 'Y': return paper
        of 'Z': return scissors
        else: raise newException(ValueError, "Impossible")

proc calculate(line: string): int =
    var 
        eChoice = pickElem(line[0])
        pChoice = pickElem(line[2])

    if pChoice == scissors and eChoice == rock:
        return 3
    if eChoice == scissors and pChoice == rock:
        return 7
    elif pChoice == eChoice:
        return ord(pChoice) + 3
    elif pChoice > eChoice:
        return ord(pChoice) + 6
    elif pChoice < eChoice:
        return ord(pChoice)

let x = foldl(lines, a + calculate(b), 0)

echo x