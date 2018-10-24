// LeetCode: https://leetcode.com/problems/basic-calculator/description/

import XCTest

class Solution {
    func calculate(_ s: String) -> Int {
        var output: [Int] = []
        let strArr = Array(s + "+")
        var open: [[Int]] = []
        var num = 0
        var sign: Character = "+"
        
        for ch in strArr {
            if ch >= "0" && ch <= "9" {
                num = num*10 + Int(String(ch))!
            } else if ch == "+" || ch == "-" {
                if open.count > 0 {
                    open[0].append(sign == "+" ? num : -num)
                } else {
                    output.append(sign == "+" ? num : -num)
                }
                num = 0
                sign = ch
            } else if ch == "(" {
                var newSign = sign == "+" ? 1 : -1
                if open.count > 0 {
                    newSign *= open[0][0]
                }
                var arr: [Int] = [newSign]
                open.insert(arr, at: 0)
                sign = "+"
            } else if ch == ")" {
                if num != 0 {
                    open[0].append(sign == "+" ? num : -num)
                    num = 0
                }
                let sign = open[0].removeFirst()
                output.append(sign * open[0].reduce(0, {x,y in
                    x+y
                }))
                open.removeFirst()
            }
        }
        return output.reduce(0, {x,y in
            x+y
        })
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
