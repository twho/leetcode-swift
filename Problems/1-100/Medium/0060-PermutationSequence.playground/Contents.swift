// LeetCode: https://leetcode.com/problems/permutation-sequence/description/

import XCTest

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        guard n > 0, k > 0 else { return "" }
        var ref = [Int]()
        var count = 1
        for i in 1...n {
            ref.append(i)
            count = count * i
        }
        
        var output = ""
        var newN = n
        var newK = k
        while ref.count > 0, count > 0 {
            
            let idx = Int((Double(ref.count*newK)/Double(count)).rounded(.up)) - 1
            output += "\(ref.remove(at: idx))"
            count = count/newN
            newK = newK - idx*count
            newN -= 1
        }
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
