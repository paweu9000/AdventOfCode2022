#include <iostream>
#include <vector>
#include <fstream>
#include <string>

using namespace std;

enum game {
    rock = 1,
    paper = 2,
    scissors = 3
};

int make_choice(char c) {
    if (c == 'A' || c == 'X') return game(rock);
    else if (c == 'B' || c == 'Y') return game(paper);
    else return game(scissors);
}

int get_winner(char enemy, char player) {
    int p = make_choice(player), e = make_choice(enemy);
    if (p == e) return p+3;
    else if (e == 3 && p == 1) return 7;
    else if (p == 3 && e == 1) return 3;
    else if (p < e) return p;
    else return p+6;
}

int main() {
    ifstream file;
    file.open("rps.txt");
    string line;
    int sum = 0;
    while (getline(file, line)) {
        sum += get_winner(line[0], line[2]);
    }
    file.close();
    cout << sum;
    return 0;
}