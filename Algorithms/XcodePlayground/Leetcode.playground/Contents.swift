import UIKit

/* //: MAIN
Cover All


/**
 5. Longest Palindromic Substring
 
 Given a string s, return the longest palindromic substring in s.

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 
 Example 2:
 Input: s = "cbbd"
 Output: "bb"
  
 Constraints:
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */

/*
 same in cpp
 #include <string>
 #include <algorithm>

 class Solution {
 public:
	 std::string longestPalindrome(const std::string& s) {
		 if (s.empty()) return "";
		 int start = 0, maxLength = 1;
		 int n = s.size();

		 auto expandAroundCenter = [&](int left, int right) {
			 while (left >= 0 && right < n && s[left] == s[right]) {
				 if (right - left + 1 > maxLength) {
					 start = left;
					 maxLength = right - left + 1;
				 }
				 --left;
				 ++right;
			 }
		 };

		 for (int i = 0; i < n; ++i) {
			 // Odd length palindromes
			 expandAroundCenter(i, i);
			 // Even length palindromes
			 expandAroundCenter(i, i + 1);
		 }

		 return s.substr(start, maxLength);
	 }
 };
 */

class Solution {
	func longestPalindrome(_ s: String) -> String {
		if s.isEmpty { return "" }
	
	let characters = Array(s)
	var start = 0
	var maxLength = 1
	
	func expandAroundCenter(left: Int, right: Int) {
		var L = left
		var R = right
		while L >= 0 && R < characters.count && characters[L] == characters[R] {
			if R - L + 1 > maxLength {
				start = L
				maxLength = R - L + 1
			}
			L -= 1
			R += 1
		}
	}
	
	for i in 0..<characters.count {
		// For odd-length palindromes
		expandAroundCenter(left: i, right: i)
		// For even-length palindromes
		expandAroundCenter(left: i, right: i + 1)
	}
	
	let startIdx = s.index(s.startIndex, offsetBy: start)
	let endIdx = s.index(startIdx, offsetBy: maxLength)
	return String(s[startIdx..<endIdx])
	}
}

let s = "babad"
print(Solution().longestPalindrome(s))



/**
 6. Zigzag Conversion
 Medium

 Topics
 premium lock icon
 Companies
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 */

class Solution {
	func convert(_ s: String, _ numRows: Int) -> String {
		var dict: [Int: String] = [:]
		var row: Int = 0
		var isAscending: Bool = true
		for char in Array(s) {
			print("\(row)")
			let current = dict[row] ?? ""
			dict[row] = current.appending(String(char))
			if (isAscending && row+1 >= numRows) || (!isAscending && row-1 < 0) {
				isAscending = !isAscending
			}
			row = isAscending ? row+1 : row-1
		}
		print(dict)
		var result = dict.keys.sorted().map { dict[$0]! }.joined()
		
		return result
	}
}

let s = "PAYPALISHIRING"
let result = Solution().convert(s, 3)
print("result: ", result)
assert("PAHNAPLSIIGYIR" == result, "Test Failed: Zigzag Conversion")



/**
 7. Reverse Integer
 Medium

 Topics
 premium lock icon
 Companies
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  
 */

class Solution {
	func reverse(_ x: Int) -> Int {
		var x = x
		var reversed = 0

		while x != 0 {
			let pop = x % 10
			x /= 10

			// Check for overflow before updating reversed
			if reversed > Int32.max / 10 || (reversed == Int32.max / 10 && pop > 7) {
				return 0
			}
			if reversed < Int32.min / 10 || (reversed == Int32.min / 10 && pop < -8) {
				return 0
			}
			
			reversed = reversed * 10 + pop
		}
		return reversed
	}

	
}
let s = 123
let result = Solution().reverse(s)
print("result: ", result)
assert(321 == result, "Test Failed: Reverse Integer")
/*
 // Test cases:
 print(reverse(123))    // Output: 321
 print(reverse(-123))   // Output: -321
 print(reverse(120))    // Output: 21
 print(reverse(1534236469)) // Output: 0 (overflow case)
 */

/**
 
 */
 


class Solution {
	func myAtoi(_ s: String) -> Int {
		var trimmedString = s.trimmingCharacters(in: .whitespaces)
		
		var result: Int = 0
		var negative: Int = 1
		var isNumberFound: Bool = false
		
		func prepareResult() -> Int {
			var innerResult = result * negative
			if negative < 0 {
				innerResult = max(innerResult, Int(Int32.min))
			} else {
				innerResult = min(innerResult, Int(Int32.max))
			}
			return innerResult
		}
		
		for i in 0..<trimmedString.count {
			let char = trimmedString.removeFirst()
			if char.isNumber {
				isNumberFound = true
				
				if result > 0 {
					guard result < Int64.max / 10 else {
						return prepareResult()
					}
					result *= 10
				}
				let numStr = String(char)
				print(numStr)
				result += Int(numStr)!
			} else {
				guard !isNumberFound else {
					return prepareResult()
				}
				if char == "-" {
					if negative > 0 {
						negative = -1
					} else {
						return prepareResult()
					}
				} else if char == "+" {
					isNumberFound = true
					if negative < 0 {
						return prepareResult()
					}
				} else {
					return result
				}
			}
		}
		return prepareResult()
	}
}
let testStr = "1337c0d3"
let result = Solution().myAtoi(testStr)
print(result)
assert(1334 == result, "Test Failed: Atoi")

let testStr2 = "20000000000000000000"
let result2 = Solution().myAtoi(testStr2)
print(result2)
assert(20000000000000000000 == result2, "Test Failed: Atoi")

 */ //: MAIN
