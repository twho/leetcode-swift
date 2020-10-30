// LeetCode: https://leetcode.com/problems/solve-the-equation/

import XCTest

class Solution {
    func solveEquation(_ equation: String) -> String {
        var opt = "+"
        var tempVal: Int?
        var leftX = 0
        var rightVal = 0
        var leftSide = -1 // Set -1 means on left side, 1 is on right side
        
        for ch in equation + "+" {
            switch ch {
            case "x":
                var val = opt == "-" ? leftSide : -leftSide
                if let temp = tempVal {
                    val = -leftSide*temp
                }
                leftX += val
                tempVal = nil
                opt = ""
            case "+", "-":
                opt = String(ch)
                rightVal += leftSide*(tempVal ?? 0)
                tempVal = nil
            case "=":
                opt = ""
                rightVal += leftSide*(tempVal ?? 0)
                tempVal = nil
                leftSide = 1
            default:
                tempVal = (tempVal ?? 0)*10 + (opt == "-" ? -Int(String(ch))! : Int(String(ch))!)
            }
        }
        if leftX == 0 {
            return rightVal != 0 ? "No solution" : "Infinite solutions"
        } else {
            if leftX < 0 {
                rightVal *= -1
            }
            leftX = abs(leftX)
            if leftX > 1 {
                rightVal = rightVal/leftX
            }
            return "x=\(rightVal)"
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()

    func testSample1() {
        let input = "x+5-3+x=6+x-2"
        let expected = "x=2"
        XCTAssertEqual(expected, s.solveEquation(input))
    }

    func testSample2() {
        let input = "2x+3x-6x=x+2"
        let expected = "x=-1"
        XCTAssertEqual(expected, s.solveEquation(input))
    }

    func testSample3() {
        let input = "-x=1"
        let expected = "x=-1"
        XCTAssertEqual(expected, s.solveEquation(input))
    }

    func testSample4() {
        let input = "1+1=x"
        let expected = "x=2"
        XCTAssertEqual(expected, s.solveEquation(input))
    }

    func testSample5() {
        let input = "1-x+x-x+x+2x=-99-x+x-x+x"
        let expected = "x=-50"
        XCTAssertEqual(expected, s.solveEquation(input))
    }

    func testSample6() {
        let input = "x=x"
        let expected = "Infinite solutions"
        XCTAssertEqual(expected, s.solveEquation(input))
    }
}

Tests.defaultTestSuite.run()
