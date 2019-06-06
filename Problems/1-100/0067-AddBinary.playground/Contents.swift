// LeetCode: https://leetcode.com/problems/add-binary/description/

import XCTest

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var arrA = Array(a.reversed())
        var arrB = Array(b.reversed())
        var shouldAdd = 0
        var output = ""
        for idx in 0..<max(arrA.count, arrB.count) {
            var valA = 0
            var valB = 0
            if idx < arrA.count {
                valA = Int(String(arrA[idx]))!
            }
            if idx < arrB.count {
                valB = Int(String(arrB[idx]))!
            }
            if valA + valB + shouldAdd > 1 {
                output.append("\(valA + valB + shouldAdd - 2)")
                shouldAdd = 1
            } else {
                output.append("\(valA + valB + shouldAdd)")
                shouldAdd = 0
            }
        }
        if shouldAdd == 1 {
            output.append("1")
        }
        output = String(output.reversed())
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("1010", "1011")
        let expected = "10101"
        let output = s.addBinary(input.0, input.1)
        XCTAssertEqual(expected, output)
    }
    
    func testSample2() {
        let input = ("11", "1")
        let expected = "100"
        let output = s.addBinary(input.0, input.1)
        XCTAssertEqual(expected, output)
    }
    
    func testSample3() {
        let input = ("0", "0")
        let expected = "0"
        let output = s.addBinary(input.0, input.1)
        XCTAssertEqual(expected, output)
    }
    
    func testSample4() {
        let input = ("101", "110")
        let expected = "1011"
        let output = s.addBinary(input.0, input.1)
        XCTAssertEqual(expected, output)
    }
}

Tests.defaultTestSuite.run()
