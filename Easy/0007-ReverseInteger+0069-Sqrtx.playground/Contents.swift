// LeetCode: https://leetcode.com/problems/reverse-integer/description/

import Foundation
import XCTest

class Solution {
    func reverse(_ x: Int) -> Int {
        var temp = abs(x)
        var output = 0
        while temp > 0 {
            output = output * 10 + temp % 10
            temp = temp / 10
        }
        guard output < Int32.max, output > Int32.min else { return 0 }
        return output * x.signum()
    }
    
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample1() {
        let input = -123
        let expected = -321
        XCTAssertEqual(solution.reverse(input), expected)
    }
    
    func testSample2() {
        let input = 123
        let expected = 321
            XCTAssertEqual(solution.reverse(input), expected)
    }
    
    func testSample3() {
        let input = 120
        let expected = 21
            XCTAssertEqual(solution.reverse(input), expected)
    }
    
    func testSample4() {
        let input = 1534236469
        let expected = 0
        XCTAssertEqual(solution.reverse(input), expected)
    }
}

Tests.defaultTestSuite.run()
