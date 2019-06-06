// LeetCode: https://leetcode.com/problems/longest-consecutive-sequence/description/
// Difficulty: Hard

import XCTest

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        let sorted = Set(nums).sorted()
        var maxCount = 0
        var count = 1
        var idx = 0
        while idx < sorted.count {
            if idx-1 >= 0, sorted[idx-1] == sorted[idx] - 1 {
                count += 1
            } else {
                maxCount = max(count, maxCount)
                count = 1
            }
            idx += 1
        }
        maxCount = max(count, maxCount)
        return maxCount
    }
}

class Tests: XCTestCase {
    let s = Solution()
    let samples: [(input: [Int], expected: Int)] = [
        ([100, 4, 200, 1, 3, 2], 4),
        ([100, 4, 200, 102, 101, 2, 6, 104, 103] , 5),
        ([0,-1], 2),
        ([1,2,0,1], 3),
        ([0,0], 1)
        
    ]
    
    func testSample1() {
        XCTAssertEqual(s.longestConsecutive(samples[0].input), samples[0].expected)
    }
    
    func testSample2() {
        XCTAssertEqual(s.longestConsecutive(samples[1].input), samples[1].expected)
    }
    
    func testSample3() {
        XCTAssertEqual(s.longestConsecutive(samples[2].input), samples[2].expected)
    }
    
    func testSample4() {
        XCTAssertEqual(s.longestConsecutive(samples[3].input), samples[3].expected)
    }
    
    func testSample5() {
        XCTAssertEqual(s.longestConsecutive(samples[4].input), samples[4].expected)
    }
}

Tests.defaultTestSuite.run()
