// LeetCode: https://leetcode.com/problems/longest-palindromic-substring/
// Hint: moving frame

import XCTest

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
    
        var length = s.count
        var strArr = Array(s)
        
        while length > 0 {
            for i in 0...s.count-length {
                var left = i
                var right = i+length-1
                
                if right >= strArr.count {
                    break
                }
                
                var isPalindrome = true
                while left < right {
                    if strArr[left] != strArr[right] {
                        isPalindrome = false
                        break
                    }
                    
                    left += 1
                    right -= 1
                }

                if isPalindrome {
                    return String(strArr[i..<i+length])
                }
            }
            length -= 1
        }
        return String(strArr[0])
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = "babad"
        let expected = "bab"
        XCTAssertEqual(s.longestPalindrome(input), expected)
    }

    func testSample2() {
        let input = "cbbd"
        let expected = "bb"
        XCTAssertEqual(s.longestPalindrome(input), expected)
    }

    func testSample3() {
        let input = "ac"
        let expected = "a"
        XCTAssertEqual(s.longestPalindrome(input), expected)
    }
    
    func testSample4() {
        let input = "abcda"
        let expected = "a"
        XCTAssertEqual(s.longestPalindrome(input), expected)
    }
}

Tests.defaultTestSuite.run()
