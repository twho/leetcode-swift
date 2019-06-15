// LeetCode: https://leetcode.com/problems/nim-game/

import XCTest

class Solution {
    func canWinNim(_ n: Int) -> Bool {
        return n%4 != 0
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 4
        XCTAssertFalse(s.canWinNim(input))
    }
}

Tests.defaultTestSuite.run()
