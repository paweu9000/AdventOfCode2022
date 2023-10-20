#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    ifstream file;
    file.open("calories.txt");
    string line;
    vector<int> ints {};
    int sum = 0;
    while (getline(file, line)) {
        if (line.empty()) {
            ints.push_back(sum);
            sum = 0;
        }
        else {
            sum += stoi(line);
        }
    }
    if (sum > 0) ints.push_back(sum);
    cout << *max_element(ints.begin(), ints.end());
    return 0;
}