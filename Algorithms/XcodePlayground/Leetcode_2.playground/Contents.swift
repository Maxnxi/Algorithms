import UIKit

/**
 11. Container With Most Water
 Solved
 Medium

 Topics
 premium lock icon
 Companies

 Hint
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.

  

 Example 1:


 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 Example 2:

 Input: height = [1,1]
 Output: 1
  

 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 */

/*
class Solution {
	func maxArea(_ height: [Int]) -> Int {
		var maxWaterVolume: Int = 0
		var leftSideIndex = 0
		var rightSideIndex = height.count - 1
		
		while leftSideIndex < rightSideIndex {
			let leftHeight = height[leftSideIndex]
			let rightHeight = height[rightSideIndex]
			let waterVolume: Int = (rightSideIndex - leftSideIndex) * min(leftHeight, rightHeight)
			maxWaterVolume = max(maxWaterVolume, waterVolume)
			
			if leftHeight < rightHeight {
				leftSideIndex += 1
			} else {
				rightSideIndex -= 1
			}
		}
		return maxWaterVolume
	}
}

let heightArray = [1,8,6,2,5,4,8,3,7]
let result = Solution().maxArea(heightArray)
print(result)

*/

/**
 12. Integer to Roman
 Solved
 Medium

 Topics
 premium lock icon
 Companies
 Seven different symbols represent Roman numerals with the following values:

 Symbol	Value
 I	1
 V	5
 X	10
 L	50
 C	100
 D	500
 M	1000
 Roman numerals are formed by appending the conversions of decimal place values from highest to lowest. Converting a decimal place value into a Roman numeral has the following rules:

 If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
 If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from the following symbol, for example, 4 is 1 (I) less than 5 (V): IV and 9 is 1 (I) less than 10 (X): IX. Only the following subtractive forms are used: 4 (IV), 9 (IX), 40 (XL), 90 (XC), 400 (CD) and 900 (CM).
 Only powers of 10 (I, X, C, M) can be appended consecutively at most 3 times to represent multiples of 10. You cannot append 5 (V), 50 (L), or 500 (D) multiple times. If you need to append a symbol 4 times use the subtractive form.
 Given an integer, convert it to a Roman numeral.
 */

/*
class Solution {
	func intToRoman(_ num: Int) -> String {
		let val = [
			1000, 900, 500, 400,
			100, 90, 50, 40,
			10, 9, 5, 4,
			1
		]
		
		let sym = [
			"M", "CM", "D", "CD",
			"C", "XC", "L", "XL",
			"X", "IX", "V", "IV",
			"I"
		]
		
		var number = num
		var result = ""
		var i = 0
		
		while number > 0 {
			while number >= val[i] {
				result += sym[i]
				number -= val[i]
			}
			i += 1
		}
		
		return result
	}

}
*/

/**
 14. Longest Common Prefix
 Easy

 Topics
 premium lock icon
 Companies
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  
 */

class ex_Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		var result = ""
		
		var mutableStrs = strs
		var firstString = strs[0]
		var firstChar = firstString.removeFirst()
		
		var charIndex = 0
		var isSame = true
		
		while isSame {
			for index in 0..<strs.count-1 {
				if !mutableStrs[index+1].isEmpty {
					let first = mutableStrs[index+1].removeFirst()
					if first == firstChar {
						
					} else {
						isSame.toggle()
					}
				} else {
					isSame.toggle()
				}
			}
			if isSame {
				charIndex += 1
				result.append(firstChar)
				firstChar = firstString.removeFirst()
			}
		}
		return result
	}
}

let strs = ["flower","flow","flight"]
//Output: "fl"
let result = Solution().longestCommonPrefix(strs)
print(result)


class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		guard !strs.isEmpty else { return "" }
		var prefix = strs[0]
		
		for string in strs.dropFirst() {
			// Reduce the prefix while the current string doesn't start with it
			while !string.hasPrefix(prefix) {
				prefix = String(prefix.dropLast())
				if prefix.isEmpty {
					return ""
				}
			}
		}
		return prefix
	}
}
