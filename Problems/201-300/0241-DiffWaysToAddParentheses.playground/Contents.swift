// Leetcode: https://leetcode.com/problems/different-ways-to-add-parentheses/

import XCTest

class Solution {
    func diffWaysToCompute(_ input: String) -> [Int] {
        if let num = Int(input) {
            return [num]
        }
        var output = [Int]()
        var strArr = Array(input)
        for i in 0..<strArr.count {
            let ch = strArr[i]
            if ch == "+" || ch == "-" || ch == "*" {
                let left = diffWaysToCompute(String(strArr[0..<i]))
                let right = diffWaysToCompute(String(strArr[i+1..<strArr.count]))
                for l in left {
                    for r in right {
                        if ch == "+" {
                            output.append(l+r)
                        } else if ch == "-" {
                            output.append(l-r)
                        } else if ch == "*" {
                            output.append(l*r)
                        }
                    }
                }
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = "2-1-1"
        let expected = [0, 2]
        let output = s.diffWaysToCompute(input).sorted()
        
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }
    
    func testSample2() {
        let input = "2*3-4*5"
        let expected = [-34, -14, -10, -10, 10]
        let output = s.diffWaysToCompute(input).sorted()
        
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }
    
    func testSample3() {
        let input = "11"
        let expected = [11]
        let output = s.diffWaysToCompute(input).sorted()
        
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }
}

Tests.defaultTestSuite.run()
