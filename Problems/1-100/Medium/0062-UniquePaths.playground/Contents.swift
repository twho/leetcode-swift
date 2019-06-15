// LeetCode: https://leetcode.com/problems/unique-paths/description/
// Use dynamic programming

import XCTest

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0}
        
        var output = Array(repeating: Array(repeating: 0, count: n), count: m)
        output[0][0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if i-1 >= 0 {
                    output[i][j] += output[i-1][j]
                }
                if j-1 >= 0 {
                    output[i][j] += output[i][j-1]
                }
            }
        }
        return output[m-1][n-1]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (3, 2)
        let expected = 3
        XCTAssertEqual(s.uniquePaths(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = (7, 3)
        let expected = 28
        XCTAssertEqual(s.uniquePaths(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = (1, 2)
        let expected = 1
        XCTAssertEqual(s.uniquePaths(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
