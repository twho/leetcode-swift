// LeetCode: https://leetcode.com/problems/basic-calculator/description/

import XCTest

class Solution {
    func calculate(_ s: String) -> Int {
        var brackets = 0
        var op = "+"
        var num = 0
        var ops = [1]
        var output = [Int]()
        for ch in s+"+" {
            if ch == "(" {
                brackets += 1
                if brackets < ops.count {
                    ops[brackets] = op == "+" ? 1*ops[brackets-1] : -1*ops[brackets-1]
                } else {
                    ops.append(op == "+" ? 1*ops[brackets-1] : -1*ops[brackets-1])
                }
                op = "+"
            } else if ch == ")" {
                let val = num*ops[brackets]
                output.append(op == "+" ? val : -val)
                brackets -= 1
                num = 0
            } else if ch >= "0", ch <= "9" {
                num = num*10 + Int(String(ch))!
            } else if ch == "+" || ch == "-" {
                let val = num*ops[brackets]
                output.append(op == "+" ? val : -val)
                num = 0
                op = String(ch)
            }
        }
        return output.reduce(0, +)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = "1 + 1"
        let expected = 2
        XCTAssertEqual(s.calculate(input), expected)
    }
    
    func testSample2() {
        let input = "(3-(2-(5-(9-(4)))))"
        let expected = 1
        XCTAssertEqual(s.calculate(input), expected)
    }

    func testSample3() {
        let input = "(1+(4+5+2)-3)+(6+8)"
        let expected = 23
        XCTAssertEqual(s.calculate(input), expected)
    }

    func testSample4() {
        let input = "1-(5)"
        let expected = -4
        XCTAssertEqual(s.calculate(input), expected)
    }

    func testSample5() {
        let input = "(5-(1+(5)))"
        let expected = -1
        XCTAssertEqual(s.calculate(input), expected)
    }
}

Tests.defaultTestSuite.run()
