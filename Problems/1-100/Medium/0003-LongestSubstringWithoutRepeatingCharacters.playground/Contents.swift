// LeetCode: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
// Note: Use Set() to solve the problem: time limit exceeded.

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var dict: [Character: Int] = [:]
        var startIdx = 0
        var maxCount = 0
        
        for (i, ch) in s.enumerated() {
            if let existIdx = dict[ch] {
                startIdx = max(startIdx, existIdx)
            }
            
            // Include the current one, exclude the existed one
            maxCount = max(maxCount, i - startIdx + 1)
            
            // Make the index be excluded
            dict[ch] = i + 1
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
    
    func testSample3() {
        let sample = "pwwkew"
        let expected = 3
        XCTAssertEqual(solution.lengthOfLongestSubstring(sample), expected)
    }
    
    func testSample4() {
        let sample = "au"
        let expected = 2
        XCTAssertEqual(solution.lengthOfLongestSubstring(sample), expected)
    }
}

Tests.defaultTestSuite.run()
