import strutils, sequtils

let lines = open("input.txt").readAll().split("\r\n")

type Choices = enum
    rock = 1, paper = 2, scissors = 3

proc pickElem(el: char): Choices =
    case el:
        of 'A': return rock
        of 'B': return paper
        of 'C': return scissors
        else: raise newException(ValueError, "Impossible")

proc pickValid(el: char, opponent: Choices): Choices =
    if el == 'X':
        case opponent:
            of rock: return scissors
            of paper: return rock
            of scissors: return paper
    elif el == 'Y':
        return opponent
    else:
        case opponent:
            of rock: return paper
            of paper: return scissors
            of scissors: return rock

proc calculate(line: string): int =
    var 
        eChoice = pickElem(line[0])
        pChoice = pickValid(line[2], eChoice)

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