// LeetCode: https://leetcode.com/problems/longest-palindromic-substring/
// Hint: moving frame

import XCTest

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var length = s.count
        let arr = Array(s)
        
        while length > 0 {
            for i in 0...arr.count-length {
                var left = i
                var right = i+length-1
                while left < right {
                    if arr[left] != arr[right] {
                        break
                    }
                    left += 1
                    right -= 1
                }
                if left >= right {
                    return String(arr[i..<i+length])
                }
            }
            length -= 1
        }
        return ""
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
    
    func testSample5() {
        let input = "a"
        let expected = "a"
        XCTAssertEqual(s.longestPalindrome(input), expected)
    }
}

Tests.defaultTestSuite.run()
