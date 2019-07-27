// LeetCode: https://leetcode.com/problems/keyboard-row/description/

import XCTest

class Solution {
    func findWords(_ words: [String]) -> [String] {
        guard words.count > 0 else { return [] }
        var dict: [Int : String] = [
            1:String("QWERTYUIOP".sorted()),
            2:String("ASDFGHJKL".sorted()),
            3:String("ZXCVBNM".sorted())
        ]
        var output: [String] = []
        for str in words {
            let processedStr = Set(str.uppercased()).sorted()
            guard processedStr.count > 0 else {
                output.append(str)
                continue
            }
            var key = 0
            if dict[1]!.contains(processedStr[0]) {
                key = 1
            } else if dict[2]!.contains(processedStr[0]) {
                key = 2
            } else if dict[3]!.contains(processedStr[0]) {
                key = 3
            }
            var valid = true
            for ch in processedStr {
                if !dict[key]!.contains(ch) {
                    valid = false
                }
            }
            if valid {
                output.append(str)
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    func testSample1() {
        let input = ["Hello", "Alaska", "Dad", "Peace"]
        let expected = ["Alaska", "Dad"]
        XCTAssertEqual(s.findWords(input), expected)
    }
}

Tests.defaultTestSuite.run()
