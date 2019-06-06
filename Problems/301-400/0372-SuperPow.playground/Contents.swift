// LeetCode: https://leetcode.com/problems/super-pow/

import XCTest

class Solution {
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var output = 1
        
        for i in 0..<b.count {
            output = power(output, 10) * power(a, b[i]) % 1337
        }
        
        return output
    }
    
    // Do mod 1337 after power
    private func power(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return 1
        } else if b == 1 {
            return a % 1337
        }
        return power(a%1337, b/2)*power(a%1337, b-b/2)%1337
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (2, [3])
        let expected = 8
        XCTAssertEqual(expected, s.superPow(input.0, input.1))
    }
    
    func testSample2() {
        let input = (2, [1,0])
        let expected = 1024
        XCTAssertEqual(expected, s.superPow(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
