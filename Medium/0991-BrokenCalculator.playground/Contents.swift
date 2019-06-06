// LeetCode: https://leetcode.com/problems/broken-calculator/
// Hint: Operate from Y is easier


import XCTest

class Solution {
    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
        if X >= Y {
            return X-Y
        } else {
            // Reverse the operation from X to Y, available operations:
            // 1. plus 1: +1
            // 2. divide by 2: /2
            return Y%2 == 0 ? 1+brokenCalc(X, Y/2) : 2+brokenCalc(X, (Y+1)/2)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (2, 3)
        let expected = 2
        XCTAssertEqual(expected, s.brokenCalc(input.0, input.1))
    }
    
    func testSample2() {
        let input = (5, 8)
        let expected = 2
        XCTAssertEqual(expected, s.brokenCalc(input.0, input.1))
    }
    
    func testSample3() {
        let input = (3, 10)
        let expected = 3
        XCTAssertEqual(expected, s.brokenCalc(input.0, input.1))
    }
    
    func testSample4() {
        let input = (1, 1000000000)
        let expected = 39
        XCTAssertEqual(expected, s.brokenCalc(input.0, input.1))
    }
    
    func testSample5() {
        let input = (1024, 1)
        let expected = 1023
        XCTAssertEqual(expected, s.brokenCalc(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
