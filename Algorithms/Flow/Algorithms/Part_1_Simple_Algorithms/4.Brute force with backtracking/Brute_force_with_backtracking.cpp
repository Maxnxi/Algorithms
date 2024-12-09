//
//  Brute_force_with_backtracking.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/7/24.
//

#include <iostream>
#include <vector>

class NQueens {
public:
	NQueens(int n) : N(n) {
		board.resize(N, std::vector<int>(N, 0)); // Initialize the board with 0s
	}

	void solve() {
		placeQueens(0);
		std::cout << "Total solutions: " << solutions << std::endl;
	}

private:
	int N;
	int solutions = 0;
	std::vector<std::vector<int>> board;

	bool isSafe(int row, int col) {
		// Check this column on the upper side
		for (int i = 0; i < row; i++) {
			if (board[i][col] == 1) {
				return false;
			}
		}

		// Check upper diagonal on left side
		for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
			if (board[i][j] == 1) {
				return false;
			}
		}

		// Check upper diagonal on right side
		for (int i = row, j = col; i >= 0 && j < N; i--, j++) {
			if (board[i][j] == 1) {
				return false;
			}
		}

		return true;
	}

	void placeQueens(int row) {
		if (row == N) {
			solutions++;
			printBoard(); // Uncomment to see the board configuration for each solution
			return;
		}

		for (int col = 0; col < N; col++) {
			if (isSafe(row, col)) {
				board[row][col] = 1; // Place queen
				placeQueens(row + 1); // Recur to place the next queen
				board[row][col] = 0; // Backtrack
			}
		}
	}

	void printBoard() {
		std::cout << "Solution " << solutions << ":\n";
		for (const auto &row : board) {
			for (const auto &cell : row) {
				std::cout << (cell ? " Q " : " . ");
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}
};

int main() {
	int N;
	std::cout << "Enter the number of queens: ";
	std::cin >> N;

	NQueens nQueens(N);
	nQueens.solve();

	return 0;
}
