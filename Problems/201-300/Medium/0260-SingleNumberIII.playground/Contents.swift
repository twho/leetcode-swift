// LeetCode: https://leetcode.com/problems/single-number-iii/

import XCTest

class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var sort = nums.sorted()
        var idx = 0
        while idx < sort.count {
            if idx - 1 >= 0, sort[idx] == sort[idx-1] {
                sort.remove(at: idx-1)
                sort.remove(at: idx-1)
                idx -= 1
                continue
            }
            idx += 1
        }
        return sort
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,2,1,3,2,5]
        let expected = [3, 5]
        let output = s.singleNumber(input)
        XCTAssertEqual(expected.count, output.count)
        output.forEach {
            XCTAssertTrue(expected.contains($0))
        }
    }
}

Tests.defaultTestSuite.run()
