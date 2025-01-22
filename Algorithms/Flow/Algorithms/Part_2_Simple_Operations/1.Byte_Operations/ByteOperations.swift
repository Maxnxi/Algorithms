//
//  ByteOperations.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/20/24.
//

import Foundation

final class ByteOperations {
	func isOdd(_ value: UInt8) -> Bool {
		value & 1 == 1
	}
	
	func isEven(_ value: UInt8) -> Bool {
		value & 1 == 0
	}
	
	func isFullDivided(value: UInt8, by divisor: UInt8) -> Bool {
		value & UInt8(pow(2.0, Float(divisor))) == 0
	}
	
	func printBinaryRepresentation(value: Int) -> String {
		String(value, radix: 2)
	}
	
	func printBinaryRepresentation_2(value: Int32) -> String {
		var result: String = ""
		for k in stride(from: 31, through: 0, by: -1) {
			let nextDigit = (value & (1 << k)) == 0 ? "0" : "1"
			result.append(nextDigit)
		}
		return result
	}
}
