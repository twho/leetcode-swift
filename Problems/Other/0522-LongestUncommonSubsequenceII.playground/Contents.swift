// LeetCode: https://leetcode.com/problems/longest-uncommon-subsequence-ii/

import XCTest

class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        guard strs.count > 0 else { return -1 }
        
        var sArrays = [[Character]]()
        var maxL = 0
        for str in strs {
            sArrays.append(Array(str))
            maxL = max(maxL, str.count)
        }
        sArrays.sort(by: { $0.count > $1.count })
        
        if sArrays[0].count != sArrays[1].count {
            return sArrays[0].count
        }
        
        for i in 0..<strs.count {
            var isLUS = true
            loop: for j in 0..<strs.count {
                if i != j, isSubs(sArrays[i], str: sArrays[j]) {
                    isLUS = false
                    break loop
                }
            }
            if isLUS {
                return sArrays[i].count
            }
        }
        return -1
    }
    
    private func isSubs(_ subsequence: [Character], str: [Character]) -> Bool {
        var i = 0
        var j = 0
        while i<subsequence.count, j < str.count {
            if subsequence[i] == str[j] {
                i += 1
            }
            j += 1
        }
        // means the subsequence has been gone through
        return i == subsequence.count
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ["aba", "cdc", "eae"]
        let expected = 3
        XCTAssertEqual(s.findLUSlength(input), expected)
    }
    
    func testSample2() {
        let input = ["aaa", "aaa", "aa"]
        let expected = -1
        XCTAssertEqual(s.findLUSlength(input), expected)
    }
    
    func testSample3() {
        let input = ["aabbcc", "aabbcc","cb","abc"]
        let expected = 2
        XCTAssertEqual(s.findLUSlength(input), expected)
    }
}

Tests.defaultTestSuite.run()
