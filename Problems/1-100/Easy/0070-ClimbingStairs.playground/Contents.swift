// LeetCode: https://leetcode.com/problems/climbing-stairs/description/
// Hint: Fibonacci number

import XCTest

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        var arr = Array(repeating: 0, count: n)
        arr[0] = 1
        if n > 1 {
            arr[1] = 2
        }
        
        var idx = 2
        while idx < n {
            if idx - 1 >= 0 {
                arr[idx] += arr[idx-1]
            }
            if idx - 2 >= 0 {
                arr[idx] += arr[idx-2]
            }
            idx += 1
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
