// LeetCode: https://leetcode.com/problems/zigzag-conversion/description/

import XCTest

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var output = ""
        let divide = 2 * numRows - 2
        guard divide > 1 else {
            return s
        }
        var dict: [Int:String] = [:]
        
        for (index, char) in s.enumerated() {
            let dictIdx = (index % divide) < numRows ? (index % divide) + 1 : numRows - ((index % divide) + 1 - numRows)
            if nil != dict[dictIdx] {
                dict[dictIdx]!.append(char)
            } else {
                dict[dictIdx] = String(char)
            }
        }
        for i in 1...dict.count {
            output.append(dict[i]!)
        }
        return output
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample1() {
        let input = ("PAYPALISHIRING", 4)
        let expected = "PINALSIGYAHRPI"
        XCTAssertEqual(solution.convert(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = ("PAYPALISHIRING", 3)
        let expected = "PAHNAPLSIIGYIR"
        XCTAssertEqual(solution.convert(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
