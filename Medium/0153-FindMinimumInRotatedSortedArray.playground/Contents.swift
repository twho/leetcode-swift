// LeetCode: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

import XCTest

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count == 1 ? nums[0] : -1
        }
        return nums.sorted()[0]
    }
}

class Tests: XCTestCase {
    func testExample1() {
        let arr = [3,4,5,1,2]
        let s = Solution()
        XCTAssertEqual(1, s.findMin(arr))
    }
    
    func testExample2() {
        let arr = [4,5,6,7,0,1,2]
        let s = Solution()
        XCTAssertEqual(0, s.findMin(arr))
    }
}

Tests.defaultTestSuite.run()
