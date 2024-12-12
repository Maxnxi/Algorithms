//
//  QueensSolution.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/12/24.
//

import Foundation

final class QueensSolution {
	static let shared = QueensSolution()
	
	init() { }
	
	
	
	@discardableResult
	func calculateSolutions(for queens: Int = 8) -> Int {
		let maxBoardSize = queens * queens
		let board = Array(1...(maxBoardSize))
		
		for element in board {
			
			for queen in 1...queens {
				var customBoard = board
				
				
				
			}
		}
		
		
		return 0
	}
	
	func setQueen(toBoard: [Int], at element: Int, boardSize: Int) -> [Int] {
		var newBoard = toBoard

		// отмечаем клетки по вертикали
		for i in 0..<boardSize {
			let checkNumber = element + boardSize * i
			
			if let index = newBoard.firstIndex(of: checkNumber) {
				newBoard[index] = -1
			}
		}
		
		// отмечаем клетки по горизонтали
		var firstInRange = element % boardSize
		if firstInRange == 0 {
			firstInRange = element - boardSize + 1
		} else {
			firstInRange = firstInRange + Int(element/boardSize) * boardSize
		}
		
		for i in 0..<boardSize {
			if let index = newBoard.firstIndex(of: firstInRange + i) {
				newBoard[index] = -1
			}
		}
		
		// отмечаем клетки по диагонали
		let downRows = Int(element / boardSize)
		let upRows = Int(((boardSize * boardSize) - element) / boardSize)
		
		
		// справа налево вниз
		var leftCheck = 1
		var rowsDownPassed = 0
		
		var isLeftCheckValid: Bool = leftCheck % boardSize != 0
		var isAllRowsDownPassed: Bool = rowsDownPassed <= downRows
		
		while isLeftCheckValid || !isAllRowsDownPassed {
			leftCheck = element - (boardSize * rowsDownPassed) - (1 * rowsDownPassed)
			rowsDownPassed += 1
			if let index = newBoard.firstIndex(of: leftCheck) {
				newBoard[index] = -1
			}
		}
		
		// слева направо вниз
		var rightCheck = 1
		var rowsDownPassed2 = 0
		
		var isRightCheckValid: Bool = leftCheck % boardSize != 0
		var isAllRowsDownPassed: Bool = rowsDownPassed <= downRows
		
		while isLeftCheckValid || !isAllRowsDownPassed {
			leftCheck = element - (boardSize * rowsDownPassed) - (1 * rowsDownPassed)
			rowsDownPassed += 1
			if let index = newBoard.firstIndex(of: leftCheck) {
				newBoard[index] = -1
			}
		}
		
		for i in 0..<downRows {
			let leftCheck = element - (boardSize * i) - (1 * i)
			let rightCheck = element - (boardSize * i) + (1 * i)
			
			if leftCheck % boardSize != 0,
			   let index = newBoard.firstIndex(of: leftCheck) {
				newBoard[index] = -1
			}
			if rightCheck % boardSize != 0,
				let index = newBoard.firstIndex(of: rightCheck) {
				newBoard[index] = -1
			}
		}
		
		for i in 0..<upRows {
			let leftCheck = element + (boardSize * i) - (1 * i)
			let rightCheck = element + (boardSize * i) + (1 * i)
			
			if let index = newBoard.firstIndex(of: leftCheck) {
				newBoard[index] = -1
			}
			if let index = newBoard.firstIndex(of: rightCheck) {
				newBoard[index] = -1
			}
		}
		
		
		
		
		
	}
	
	
	
	
	
}
