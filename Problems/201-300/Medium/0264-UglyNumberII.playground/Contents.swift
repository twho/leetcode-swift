// LeetCode: https://leetcode.com/problems/ugly-number-ii/

import XCTest

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if n <= 0 {
            return -1
        }
        if n == 1 {
            return 1
        }
        
        var uglyNums = [Int](repeating: 0, count: n)
        var m2 = 0
        var m3 = 0
        var m5 = 0
        uglyNums[0] = 1
        for i in 1..<n {
            uglyNums[i] = min(uglyNums[m2]*2, uglyNums[m3]*3, uglyNums[m5]*5)
            
            // If the above calulation taks 2 as the minimum
            if uglyNums[i] == uglyNums[m2]*2 {
                m2 += 1
            }
            
            // If the above calulation taks 3 as the minimum
            if uglyNums[i] == uglyNums[m3]*3 {
                m3 += 1
            }
            
            // If the above calulation taks 5 as the minimum
            if uglyNums[i] == uglyNums[m5]*5 {
                m5 += 1
            }
        }
        return uglyNums[n-1]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 10
        let expected = 12
        XCTAssertEqual(expected, s.nthUglyNumber(input))
    }
    
    func testSample2() {
        let input = 447
        let expected = 524880
        XCTAssertEqual(expected, s.nthUglyNumber(input))
    }
}

Tests.defaultTestSuite.run()
