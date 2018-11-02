// LeetCode: https://leetcode.com/problems/basic-calculator-ii/description/
// Regular expression: runtime error

import XCTest

class Solution {
    func calculate(_ s: String) -> Int {
        var arr: [Int] = []
        var num = 0
        let s = s  + "+"
        var sign = "+"
        
        for ch in s {
            if ch >= "0", ch <= "9" {
                num = num*10 + Int(String(ch))!
            } else if ch == "+" || ch == "-" || ch == "*" || ch == "/" {
                if sign == "+" || sign == "-" {
                    arr.append(sign == "-" ? -num : num)
                } else if sign == "*" || sign == "/" {
                    let last = arr.removeLast()
                    arr.append(sign == "/" ? last/num : last*num)
                }
                sign = String(ch)
                num = 0
            }
        }
        return arr.reduce(0, +)
    }
    
    func calculateRegex(_ s: String) -> Int {
        var str = s
        str = str.replacingOccurrences(of: " ", with: "")
        let expn = NSExpression(format: str)
        return Int("\(expn.expressionValue(with: nil, context: nil) ?? 0)")!
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = " 3+5 / 2 "
        let expected = 5
        XCTAssertEqual(s.calculate(input), expected)
    }
    
    func testSample2() {
        let input = " 3/2 "
        let expected = 1
        XCTAssertEqual(s.calculate(input), expected)
    }
    
    func testSample3() {
        let input = "3+2*2"
        let expected = 7
        XCTAssertEqual(s.calculate(input), expected)
    }
}

Tests.defaultTestSuite.run()
