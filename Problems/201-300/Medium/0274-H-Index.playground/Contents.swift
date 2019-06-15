// LeetCode: https://leetcode.com/problems/h-index/

import XCTest

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sorted = citations.sorted()
        var count = 0
        for i in 0..<sorted.count {
            if sorted[sorted.count-1-i] == i + 1  {
                return 1 + i
            }
            if sorted[sorted.count-1-i] > count {
                count += 1
            }
        }
        return count
    }
}


class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [3,0,6,1,5]
        let expected = 3
        XCTAssertEqual(expected, s.hIndex(input))
    }
    
    func testSample2() {
        let input = [0]
        let expected = 0
        XCTAssertEqual(expected, s.hIndex(input))
    }
    
    func testSample3() {
        let input = [100]
        let expected = 1
        XCTAssertEqual(expected, s.hIndex(input))
    }
}

Tests.defaultTestSuite.run()
