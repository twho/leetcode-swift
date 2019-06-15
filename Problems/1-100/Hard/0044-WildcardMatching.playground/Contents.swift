// LeetCode: https://leetcode.com/problems/wildcard-matching/
// Difficulty: hard

import XCTest

// TODO: solve the problem, this solution exceeds the time limit.
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // Handle edge cases
        if s.count == 0 && p.count == 0 {
            return true
        } else if s.count == 0 {
            ifContainsAsterishOnly(p)
        } else if p.count == 0 {
            return false
        }
        
        var withStar = false
        var idxP = 0
        var idxS = 0
        let sArr = Array(s)
        let pArr = Array(p)
        
        while idxP < p.count, idxS < s.count {
            if sArr[idxS] == pArr[idxP] || pArr[idxP] == "?" {
                idxS += 1
                idxP += 1
            } else if pArr[idxP] == "*" {
                while idxP + 1 < p.count, pArr[idxP+1] == "*" {
                    idxP += 1
                }
                if idxP+1 >= p.count {
                    return true
                }
                for i in idxS..<sArr.count {
                    if pArr[idxP+1] == sArr[i] || pArr[idxP+1] == "?" {
                        if isMatch(String(sArr[i..<s.count]), String(pArr[idxP + 1..<p.count])) {
                            return true
                        }
                    }
                }
                return false
            } else {
                return false
            }
        }
        
        if idxP == p.count && idxS == s.count {
            return true
        } else if idxP < p.count {
            return ifContainsAsterishOnly(String(pArr[idxP..<p.count]))
        } else {
            return false
        }
    }
    
    private func ifContainsAsterishOnly(_ str: String) -> Bool {
        for ch in str {
            if ch != "*" {
                return false
            }
        }
        return true
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSampl1() {
        let input = ("aa", "a")
        XCTAssertFalse(s.isMatch(input.0, input.1))
    }

    func testSampl2() {
        let input = ("aa", "*")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }

    func testSampl3() {
        let input = ("cb", "?a")
        XCTAssertFalse(s.isMatch(input.0, input.1))
    }

    func testSampl4() {
        let input = ("adceb", "*a*b")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }

    func testSampl5() {
        let input = ("abefcdgiescdfimde", "ab*cd?i*de")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }

    func testSampl6() {
        let input = ("aaaa", "***a")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }
    
    func testSampl7() {
        let input = ("", "*")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }
    
    func testSampl8() {
        let input = ("a", "a*")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }
    
    func testSampl9() {
        let input = ("c", "*?*")
        XCTAssertTrue(s.isMatch(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
