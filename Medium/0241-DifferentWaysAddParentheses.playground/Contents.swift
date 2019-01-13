// LeetCode: https://leetcode.com/problems/different-ways-to-add-parentheses/

import XCTest

class Solution {
    func diffWaysToCompute(_ input: String) -> [Int] {
        var arr: [String] = []
        for ch in input {
            arr.append(String(ch))
        }
        var output: [Int] = []
        helper(arr, &output)
        print(output)
        return output
    }
    
    private func helper(_ current: [String], _ output: inout [Int]) {
        if current.count == 1 {
            output.append(Int("\(current[0])")!)
            return
        }
        for idx in 0..<current.count {
            if let num = Int(current[idx]), num < 999, num > -999, idx-2 >= 0 {
                var res = 0
                switch current[idx-1] {
                case "+":
                    res = Int(current[idx])! + Int(current[idx-2])!
                case "-":
                    res = Int(current[idx-2])! - Int(current[idx])!
                case "*":
                    res = Int(current[idx-2])! * Int(current[idx])!
                default: break
                }
                var temp = current
                temp[idx] = "\(res)"
                temp.remove(at: idx-1)
                temp.remove(at: idx-2)
                helper(temp, &output)
            }
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = "2*3-4*5"
        let expected = [-34, -14, -10, -10, 10]
        let output = s.diffWaysToCompute(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
