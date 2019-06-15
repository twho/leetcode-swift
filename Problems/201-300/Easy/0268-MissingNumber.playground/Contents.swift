// LeetCode: https://leetcode.com/problems/missing-number/

import XCTest

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var current = 0
        for i in nums {
            current += i
        }
        let sum = (1+nums.count)*(nums.count)/2
        return sum-current
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [3,0,1]
        let expected = 2
        XCTAssertEqual(expected, s.missingNumber(input))
    }
    
    func testSample2() {
        let input = [9,6,4,2,3,5,7,0,1]
        let expected = 8
        XCTAssertEqual(expected, s.missingNumber(input))
    }
}

Tests.defaultTestSuite.run()
