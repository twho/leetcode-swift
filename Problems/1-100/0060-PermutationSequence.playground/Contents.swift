// LeetCode: https://leetcode.com/problems/permutation-sequence/description/

import XCTest

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        guard n > 0, k > 0 else { return "" }
        if n-1 < 1 {
            return "\(n)"
        }
        var arr: [Int] = []
        for i in 1...n {
            arr.append(i)
        }
        
        var factList: [Int] = []
        var current = 1
        for i in 1...n {
            current = current * i
            factList.append(current)
        }
        
        var output = ""
        for i in 1...n-1 {
            var idx = Int((Double((k % factList[n-i])*arr.count)/Double(factList[n-i])).rounded(.up))-1
            if idx < 0 {
                idx += arr.count
            }
            output.append("\(arr.remove(at: idx))")
        }
        output.append("\(arr.removeLast())")
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (3, 3)
        let expected = "213"
        XCTAssertEqual(s.getPermutation(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = (4, 9)
        let expected = "2314"
        XCTAssertEqual(s.getPermutation(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = (3, 2)
        let expected = "132"
        XCTAssertEqual(s.getPermutation(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = (1, 1)
        let expected = "1"
        XCTAssertEqual(s.getPermutation(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
