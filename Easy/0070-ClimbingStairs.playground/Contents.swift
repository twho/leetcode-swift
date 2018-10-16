// LeetCode: https://leetcode.com/problems/climbing-stairs/description/
// Hint: Fibonacci number

import XCTest

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var arr = Array(repeating: 0, count: n)
        arr[0] = 1
        guard n > 1 else { return arr[n-1] }
        arr[1] = 2
        guard n > 2 else { return arr[n-1] }
        for i in 2..<n {
            arr[i] = arr[i-1] + arr[i-2]
        }
        return arr[n-1]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1(){
        let input = 3
        let expected = 3
        XCTAssertEqual(s.climbStairs(input), expected)
    }
    
    func testSample2(){
        let input = 4
        let expected = 5
        XCTAssertEqual(s.climbStairs(input), expected)
    }
    
    func testSample3(){
        let input = 1
        let expected = 1
        XCTAssertEqual(s.climbStairs(input), expected)
    }
}

Tests.defaultTestSuite.run()
