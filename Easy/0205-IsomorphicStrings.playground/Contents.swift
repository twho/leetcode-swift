// LeetCode: https://leetcode.com/problems/isomorphic-strings/description/

import XCTest

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dict: [Character:Character] = [:]
        var arrT = Array(t)
        for (idx, ch1) in s.enumerated() {
            var current = ch1
            let ch2 = arrT[idx]
            if dict[current] == nil {
                if dict.values.contains(ch2) {
                    return false
                } else {
                    dict[current] = ch2
                    current = ch2
                }
            } else {
                current = dict[current]!
            }
            if current != ch2 {
                return false
            }
        }
        return true
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("egg", "add")
        XCTAssertTrue(s.isIsomorphic(input.0, input.1))
    }
    
    func testSample2() {
        let input = ("ab", "aa")
        XCTAssertFalse(s.isIsomorphic(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
