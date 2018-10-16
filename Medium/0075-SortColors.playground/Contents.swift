// LeetCode: https://leetcode.com/problems/sort-colors/description/

import XCTest

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var count0 = 0
        var count1 = 0
        var count2 = 0
        for num in nums {
            switch num {
            case 0:
                count0 += 1
            case 1:
                count1 += 1
            case 2:
                count2 += 1
            default:
                continue
            }
        }
        nums = Array(repeating: 0, count: count0) + Array(repeating: 1, count: count1) + Array(repeating: 2, count: count2)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        var input = [2,0,2,1,1,0]
        let expected = [0,0,1,1,2,2]
        s.sortColors(&input)
        XCTAssertEqual(input, expected)
    }
}

Tests.defaultTestSuite.run()
