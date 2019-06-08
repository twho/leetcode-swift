// LeetCode: https://leetcode.com/problems/add-digits/

import XCTest

class Solution {
    func addDigits(_ num: Int) -> Int {
        var output = num
        
        while output/10 > 0 {
            var temp = output
            output = 0
            while temp > 0 {
                output += temp%10
                temp = temp/10
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 38
        let expected = 2
        XCTAssertEqual(expected, s.addDigits(input))
    }
}

Tests.defaultTestSuite.run()
