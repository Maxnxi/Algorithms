//
//  StrangeAlgorithm.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/5/24.
//

import Foundation

func strangeAlgorithm1(number: Int) {
	var number = number
	while true {
		print(number)
		if number == 1 { break
		}
		if number % 2 == 0 {
			number /= 2
		} else {
			number = number * 3 + 1
		}
	}
}

func strangeAlgorithm2(number: Int) {
	print(number)
	switch number {
	case 1:
		break
		
	default:
		/*
		 let newNumber: Int
		 if number % 2 == 0 {
			newNumber = number / 2
		 } else {
			newNumber = number * 3 + 1
		 }
		 
		 Or
		 */
		
		let newNumber: Int = number % 2 == 0
		? number / 2
		: number * 3 + 1
		
		// Call self with new number
		strangeAlgorithm2(number: newNumber)
	}
	
}
