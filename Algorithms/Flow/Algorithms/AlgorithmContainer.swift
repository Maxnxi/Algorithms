//
//  AlgorithmContainer.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/27/24.
//

import Foundation

final class AlgorithmContainer: ObservableObject {
	
	public var algorithms: [Algorithm] = []
	
	var languageType: LanguageType = .swift
	
	init() {
		self.algorithms = [
			// 1
			Algorithm(
				name: "Longest Substring With Two Unique Characters",
				exampleInput: "abcbbbbcccbdddadacb",
				calculate: { [weak self] (someValue: Any) -> String? in
					guard
						let self,
						let str = someValue as? String
					else {
						return nil
					}
					return self.longestSubstringWithTwoUniqueCharacters(str)
				}
			)
			// 2
			// Algorithm(
			
			// 3
			// Algorithm(
		]
	}
	
	
	
}
