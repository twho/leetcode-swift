// LeetCode: https://leetcode.com/problems/decode-string/

import XCTest

class Solution {
    func decodeString(_ s: String) -> String {
        var strArr = Array(s)
        var output = ""
        var start: Int?
        var times = 0
        var open = 0
        
        for idx in 0..<strArr.count {
            let strChar = String(strArr[idx])
            
            if strChar == "[" {
                start = open == 0 ? idx : start
                open += 1
            } else if strChar == "]" {
                open -= 1
                if open == 0, start != nil {
                    let toAppend = decodeString(String(strArr[start!+1..<idx]))
                    for _ in 0..<times {
                        output.append(toAppend)
                    }
                    start = nil
                    times = 0
                }
            } else if open == 0 {
                if let count = Int(strChar), count >= 0, count <= 1000 {
                    times = times * 10 + count
                } else {
                    output.append(strChar)
                }
            }
        }
        
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = "3[a]2[bc]"
        let expected = "aaabcbc"
        XCTAssertEqual(s.decodeString(input), expected)
    }

    func testSample2() {
        let input = "3[a2[c]]"
        let expected = "accaccacc"
        XCTAssertEqual(s.decodeString(input), expected)
    }

    func testSample3() {
        let input = "2[abc]3[cd]ef"
        let expected = "abcabccdcdcdef"
        XCTAssertEqual(s.decodeString(input), expected)
    }
    
    func testSample4() {
        let input = "3[z]2[2[y]pq4[2[jk]e1[f]]]ef"
        let expected = "zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef"
        XCTAssertEqual(s.decodeString(input), expected)
    }
}

Tests.defaultTestSuite.run()
