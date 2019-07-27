// LeetCode: https://leetcode.com/problems/longest-uncommon-subsequence-ii/

import XCTest

class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        guard strs.count > 0 else { return -1 }
        
        var sArrays = Array(strs)
        sArrays.sort(by: { $0.count > $1.count })
        
        for idx1 in 0..<sArrays.count {
            var isLUS = true
            for idx2 in 0..<sArrays.count {
                if idx1 == idx2 || sArrays[idx1].count > sArrays[idx2].count {
                    continue
                }
                if isSubs(Array(sArrays[idx1]), str: Array(sArrays[idx2])) {
                    isLUS = false
                }
            }
            if isLUS {
                return sArrays[idx1].count
            }
        }
        
        return -1
    }
    
    private func isSubs(_ subsequence: [Character], str: [Character]) -> Bool {
        var i = 0
        var j = 0
        while i < subsequence.count, j < str.count {
            if subsequence[i] == str[j] {
                i += 1
            }
            j += 1
        }
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
    
    func testSample4() {
        let input = ["aabbcc", "aabbcc","c","e","aabbcd"]
        let expected = 6
        XCTAssertEqual(s.findLUSlength(input), expected)
    }
}

Tests.defaultTestSuite.run()
