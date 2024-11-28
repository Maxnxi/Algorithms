//
//  LongestSubstringWithTwoUniqueCharacters.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/27/24.
//

import Foundation

extension AlgorithmContainer {
	func longestSubstringWithTwoUniqueCharacters(_ s: String) -> String {
		var left = 0
		var right = 0
		var charCount = [Character: Int]()
		var maxLength = 0
		var startIndex = 0
		
		while right < s.count {
			let rightChar = s[s.index(s.startIndex, offsetBy: right)]
			charCount[rightChar, default: 0] += 1
			
			// While there are more than 2 unique characters, move the left pointer
			while charCount.count > 2 {
				let leftChar = s[s.index(s.startIndex, offsetBy: left)]
				charCount[leftChar]! -= 1
				if charCount[leftChar] == 0 {
					charCount.removeValue(forKey: leftChar)
				}
				left += 1
			}
			
			// Update maxLength and startIndex if we found a longer valid substring
			if right - left + 1 > maxLength {
				maxLength = right - left + 1
				startIndex = left
			}
			
			right += 1
		}
		
		let start = s.index(s.startIndex, offsetBy: startIndex)
		let end = s.index(s.startIndex, offsetBy: startIndex + maxLength)
		return String(s[start..<end])
	}
	
	/*
	Example usage:
	let input = "abcbbbbcccbdddadacb"
	let result = longestSubstringWithTwoUniqueCharacters(input)
	print(result)  // Output: "bcbbbbcccb"
	*/
}
