// Leetcode: https://leetcode.com/problems/multiply-strings/

import XCTest

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        return "String(output)"
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
}

Tests.defaultTestSuite.run()
