// LeetCode: https://leetcode.com/problems/minimum-window-substring/

import XCTest

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        
        var tDict = [Character: Int]()
        for ch in t {
            tDict[ch] = tDict[ch] == nil ? 1 : tDict[ch]! + 1
        }
        
        var sDict = [Character: Int]()
        for ch in s {
            if tDict[ch] == nil {
                continue
            }
            sDict[ch] = sDict[ch] == nil ? 1 : sDict[ch]! + 1
        }
        
        let sArr = Array(s)
        var start = 0
        var end = sArr.count-1
        while start < end {
            if tDict[sArr[start]] == nil {
                start += 1
            } else if (tDict[sArr[start]] != nil && sDict[sArr[start]]! - 1 >= tDict[sArr[start]]!) {
                sDict[sArr[start]]! -= 1
                start += 1
            } else if tDict[sArr[end]] == nil {
                end -= 1
            } else if (tDict[sArr[end]] != nil && sDict[sArr[end]]! - 1 >= tDict[sArr[end]]!) {
                sDict[sArr[end]]! -= 1
                end -= 1
            } else {
                break
            }
        }
        return String(sArr[start...end])
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("ADOBECODEBANC", "ABC")
        let expected = "BANC"
        XCTAssertEqual(expected, s.minWindow(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
