// LeetCode: https://leetcode.com/problems/unique-paths/description/

import XCTest

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let rStage = m - 1
        let dStage = n - 1
        let step = (rStage + dStage) - max(rStage, dStage)
        return fact(rStage + dStage, step)/fact(min(rStage, dStage))
    }
    
    private func fact(_ n: Int, _ count: Int? = nil) -> Int {
        if n == 1 || n == 0 {
            return 1
        }
        if count ?? n > 0 {
            return n * fact(n-1, (count ?? n) - 1)
        } else {
            return 1
        }
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
