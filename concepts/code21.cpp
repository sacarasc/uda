#include <iostream>
#include <vector>
#include <fstream>

using std::string;
using std::cout;
using std::endl;

void ReadBoardFile(string fileName) {
    std::ifstream file;

    file.open(fileName);
    if ( file){
        string line;
        while(getline(file,line)) {
            cout << line << endl;
        }
    }
}

int main() {
     ReadBoardFile("1.board");
}