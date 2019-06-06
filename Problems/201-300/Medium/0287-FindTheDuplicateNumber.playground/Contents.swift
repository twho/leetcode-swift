// LeetCode: https://leetcode.com/problems/find-the-duplicate-number/description/

import XCTest

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        for idx1 in 0..<nums.count {
            for idx2 in idx1+1..<nums.count{
                if nums[idx1] == nums[idx2], idx2 != idx1 {
                    return nums[idx1]
                }
            }
        }
        return -1
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,3,4,2,2]
        let expected = 2
        XCTAssertEqual(s.findDuplicate(input), expected)
    }
    
    func testSample2() {
        let input = [3,1,3,4,2]
        let expected = 3
        XCTAssertEqual(s.findDuplicate(input), expected)
    }
}

Tests.defaultTestSuite.run()
