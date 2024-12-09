//
//  BruteForceWithBactrack.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/9/24.
//

import Foundation

class NQueens {
	private var N: Int
	private var board: [[Int]]
	private var solutions: Int = 0

	init(n: Int) {
		self.N = n
		self.board = Array(repeating: Array(repeating: 0, count: n), count: n) // Initialize the board with 0s
	}

	func solve() {
		placeQueens(row: 0)
		print("Total solutions: \(solutions)")
	}

	private func isSafe(row: Int, col: Int) -> Bool {
		// Check this column on the upper side
		for i in 0..<row {
			if board[i][col] == 1 {
				return false
			}
		}

		// Check upper diagonal on left side
		for (i, j) in zip((row...0).reversed(), (col...0).reversed()) {
			if board[i][j] == 1 {
				return false
			}
		}

		// Check upper diagonal on right side
		for (i, j) in zip((row...0).reversed(), (col..<N)) {
			if board[i][j] == 1 {
				return false
			}
		}

		return true
	}

	private func placeQueens(row: Int) {
		if row == N {
			solutions += 1
			printBoard() // Uncomment to see the board configuration for each solution
			return
		}

		for col in 0..<N {
			if isSafe(row: row, col: col) {
				board[row][col] = 1 // Place queen
				placeQueens(row: row + 1) // Recur to place the next queen
				board[row][col] = 0 // Backtrack
			}
		}
	}

	private func printBoard() {
		print("Solution \(solutions):")
		for row in board {
			for cell in row {
				print(cell == 1 ? " Q " : " . ", terminator: "")
			}
			print("")
		}
		print("") // Print a newline for better separation
	}
}
