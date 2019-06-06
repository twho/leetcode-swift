// LeetCode: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
// Note: Use Set() to solve the problem: time limit exceeded.

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        var dict = [Character : Int]() // [char : idx]
        var maxCount = 0
        var count = 0
        for idx in 0..<arr.count {
            if dict[arr[idx]] == nil {
                count += 1
                dict[arr[idx]] = idx
            } else {
                let startIdx = dict[arr[idx]]! + 1
                dict[arr[idx]] = idx
                for key in dict.keys {
                    if dict[key]! < startIdx {
                        dict[key] = nil
                    }
                }
                count = idx - startIdx + 1
            }
            maxCount = max(count, maxCount)
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
}

Tests.defaultTestSuite.run()
