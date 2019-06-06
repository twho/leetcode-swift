// LeetCode: https://leetcode.com/problems/powx-n/description/

import XCTest

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        } else if n == 1 {
            return x
        } else if n == -1 {
            return 1/x
        }
        
        if n > 0 {
            return n % 2 == 0 ? myPow(x*x, n/2) : x * myPow(x*x, (n-1)/2)
        } else {
            return n % 2 == 0 ? myPow(x*x, n/2) : 1/x * myPow(x*x, (n+1)/2)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (2.00000, -2)
        let expected = 0.25000
        XCTAssertEqual(s.myPow(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = (2.10000, 3)
        let expected = 9.26100
        XCTAssertEqual(s.myPow(input.0, input.1), expected)
    }

    func testSample3() {
        let input = (2.00000, 10)
        let expected = 1024.00000
        XCTAssertEqual(s.myPow(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = (34.00515, -3)
        let expected = 3e-05
        XCTAssertEqual(s.myPow(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
