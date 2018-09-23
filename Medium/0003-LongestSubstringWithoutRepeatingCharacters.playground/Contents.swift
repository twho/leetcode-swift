// LeetCode: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
// Note: Use Set() to solve the problem: time limit exceeded.

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        var maxCount = 1
        if s.count == 1 {
            return maxCount
        }
        let strArr = Array(s) // Key: convert string to array
        for (index, char) in strArr.enumerated() {
            var dict: [Character : Int] = [:]
            var count = 1
            dict[char] = 1
            var movingIdx = index + 1
            while movingIdx < strArr.count, dict[strArr[movingIdx]] ?? 0 < 1 {
                dict[strArr[movingIdx]] = 1
                count += 1
                movingIdx += 1
            }
            maxCount = count > maxCount ? count : maxCount
        }
        return maxCount
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample1() {
        let sample = "dvdf"
        let expected = 3
        XCTAssertEqual(solution.lengthOfLongestSubstring(sample), expected)
    }
    
    func testSample2() {
        let sample = "abcabcbb"
        let expected = 3
        XCTAssertEqual(solution.lengthOfLongestSubstring(sample), expected)
    }
}

Tests.defaultTestSuite.run()
