// LeetCode: https://leetcode.com/problems/sqrtx/

import XCTest

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var output = 0
        while output*output <= x {
            output += 1
        }
        return output - 1
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 8
        let expected = 2
        XCTAssertEqual(expected, s.mySqrt(input))
    }
    
    func testSample2() {
        let input = 4
        let expected = 2
        XCTAssertEqual(expected, s.mySqrt(input))
    }
}

Tests.defaultTestSuite.run()
