// LeetCode: https://leetcode.com/problems/number-of-longest-increasing-subsequence/

import XCTest

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        if nums.count == 1 {
            return 1
        }
        
        var maxCount = 1
        var dict = [Int:[Int]]() // [Index : [length : count]]
        
        for idx1 in 0..<nums.count {
            dict[idx1] = [1, 1]
            
            var isLongest = 0
            for idx2 in 0...idx1 {
                if nums[idx2] < nums[idx1] {
                    if dict[idx2]![0] + 1 > dict[idx1]![0] {
                        dict[idx1] = [dict[idx2]![0] + 1, dict[idx2]![1]]
                    } else if dict[idx2]![0] + 1 == dict[idx1]![0] {
                        dict[idx1] = [dict[idx1]![0] , dict[idx1]![1] + dict[idx2]![1]]
                    }
                }
            }
            maxCount = max(maxCount, dict[idx1]![0])
        }
        
        var result = 0
        for key in dict.keys {
            if dict[key]![0] == maxCount {
                result += dict[key]![1]
            }
        }
        return result
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1, 3, 5, 4, 7]
        let expected = 2
        XCTAssertEqual(s.findNumberOfLIS(input), expected)
    }

    func testSample2() {
        let input = [2, 2, 2, 2, 2]
        let expected = 5
        XCTAssertEqual(s.findNumberOfLIS(input), expected)
    }
    
    func testSample3() {
        let input = [1,1,1,2,2,2,3,3,3]
        let expected = 27
        XCTAssertEqual(s.findNumberOfLIS(input), expected)
    }
    
    func testSample4() {
        let input = [1,2,4,3,5,4,7,2]
        let expected = 3
        XCTAssertEqual(s.findNumberOfLIS(input), expected)
    }
}

Tests.defaultTestSuite.run()
