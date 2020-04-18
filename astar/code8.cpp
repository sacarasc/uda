#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
using std::cout;
using std::ifstream;
using std::istringstream;
using std::string;
using std::vector;
using std::abs;

enum class State {kEmpty, kObstacle};


vector<State> ParseLine(string line) {
    istringstream sline(line);
    int n;
    char c;
    vector<State> row;
    while (sline >> n >> c && c == ',') {
      if (n == 0) {
        row.push_back(State::kEmpty);
      } else {
        row.push_back(State::kObstacle);
      }
    }
    return row;
}


vector<vector<State>> ReadBoardFile(string path) {
  ifstream myfile (path);
  vector<vector<State>> board{};
  if (myfile) {
    string line;
    while (getline(myfile, line)) {
      vector<State> row = ParseLine(line);
      board.push_back(row);
    }
  }
  return board;
}

// TODO: Write the Search function stub here.


string CellString(State cell) {
  switch(cell) {
    case State::kObstacle: return "⛰️   ";
    default: return "0   "; 
  }
}


void PrintBoard(const vector<vector<State>> board) {
  for (int i = 0; i < board.size(); i++) {
    for (int j = 0; j < board[i].size(); j++) {
      cout << CellString(board[i][j]);
    }
    cout << "\n";
  }
}


/*
In main(), call Search with a start of {0, 0} and a goal of {4, 5}. Store the results in the variable solution.
Pass solution to PrintBoard.*/


vector<vector<State>> Search(vector<vector<State>> board, vector<int> start, vector<int> goal) {

    vector<vector<State>> solution;
    cout << "No path found!" << std::endl;
    return solution;
}



int main() {
    vector<vector<State>> board = ReadBoardFile("1.board");
    vector<int> start = {0,0};
    vector<int> goal = {4,5};

    PrintBoard(board);

    vector<vector<State>> solution = Search(board, start, goal);

    PrintBoard(solution);
}
