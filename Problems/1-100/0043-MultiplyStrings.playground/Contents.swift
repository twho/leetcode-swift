// Leetcode: https://leetcode.com/problems/multiply-strings/

import XCTest

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var arrNum1 = Array(num1)
        var arrNum2 = Array(num2)
        arrNum1.reverse()
        arrNum2.reverse()
        
        var output: [Character] = [Character("0")]
        
        for idx1 in 0..<arrNum1.count {
            for idx2 in 0..<arrNum2.count {
                var val = Int(String(arrNum1[idx1]))!*Int(String(arrNum2[idx2]))!
                addValue(&val, idx2+idx1, &output)
            }
        }
        while let last = output.last, last == Character("0"), output.count > 1 {
            output.removeLast()
        }
        return String(output.reversed())
    }
    
    private func addValue(_ val: inout Int, _ idx: Int, _ output: inout [Character]) {
        if idx < output.count {
            val += Int(String(output[idx]))!
            output[idx] = Character("\(val%10)")
        } else {
            output.append(Character("\(val%10)"))
        }
        var tmp = val/10
        if tmp > 0 {
            addValue(&tmp, idx + 1, &output)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("2", "3")
        let expected = "6"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = ("123", "456")
        let expected = "56088"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = ("0", "0")
        let expected = "0"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = ("6", "501")
        let expected = "3006"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
    
    func testSample5() {
        let input = ("9133", "0")
        let expected = "0"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
    
    func testSample6() {
        let input = ("408", "5")
        let expected = "2040"
        XCTAssertEqual(s.multiply(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
