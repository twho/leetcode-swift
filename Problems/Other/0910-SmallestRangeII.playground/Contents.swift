// LeetCode: https://leetcode.com/problems/smallest-range-ii/

import XCTest

class Solution {
    func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
        guard A.count > 0 else { return 0 }
        if A.count == 1 {
            return 0
        }
        let sort = A.sorted()
        var res = 100000
        for idx in 0..<sort.count {
            if idx + 1 >= sort.count {
                break
            }
            let val1 = sort[idx+1]-2*K-sort[idx]+2*K
            if val1 > 0 {
                res = min(res, val1)
            }
            let val2 = sort[idx+1]-sort[idx]
            if val2 > 0 {
                res = min(res, val2)
            }
        }
        return res
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1], 0)
        let expected = 0
        XCTAssertEqual(expected, s.smallestRangeII(input.0, input.1))
    }
    
    func testSample2() {
        let input = ([0, 10], 2)
        let expected = 6
        XCTAssertEqual(expected, s.smallestRangeII(input.0, input.1))
    }
    
    func testSample3() {
        let input = ([1, 3, 6], 3)
        let expected = 3
        XCTAssertEqual(expected, s.smallestRangeII(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
