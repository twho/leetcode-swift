// LeetCode: https://leetcode.com/problems/maximal-rectangle/

import XCTest

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        return 0
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [
            [Character("1"),Character("0"),Character("1"),Character("0"),Character("0")],
            [Character("1"),Character("0"),Character("1"),Character("1"),Character("1")],
            [Character("1"),Character("1"),Character("1"),Character("1"),Character("1")],
            [Character("1"),Character("0"),Character("0"),Character("1"),Character("0")]
        ]
        let expected = 6
        XCTAssertEqual(expected, s.maximalRectangle(input))
    }
}

Tests.defaultTestSuite.run()
