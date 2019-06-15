// LeetCode: https://leetcode.com/problems/house-robber-ii/description/

import XCTest

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var arrNoHead = Array(repeating: 0, count: nums.count)
        arrNoHead[0] = nums[1]
        var last = arrNoHead[0]
        var last2 = 0
        var idx = 2
        var maxVal = 0
        maxVal = max(maxVal, last)
        while idx < arrNoHead.count {
            arrNoHead[idx] = max(last, nums[idx]+last2)
            maxVal = max(maxVal, arrNoHead[idx])
            (last2, last) = (last, arrNoHead[idx])
            idx += 1
        }
        
        var arrWithHead = Array(repeating: 0, count: nums.count)
        arrWithHead[0] = nums[0]
        arrWithHead[1] = max(nums[1], nums[0])
        last = arrWithHead[1]
        last2 = arrWithHead[0]
        maxVal = max(maxVal, last2)
        idx = 2
        while idx < arrWithHead.count-1 {
            arrWithHead[idx] = max(last, nums[idx]+last2)
            maxVal = max(maxVal, arrWithHead[idx])
            (last2, last) = (last, arrWithHead[idx])
            idx += 1
        }
        return maxVal
    }
}

class Tests: XCTestCase {
    let s = Solution()

    func testSample1() {
        let input = [2,3,2]
        let expected = 3
        XCTAssertEqual(s.rob(input), expected)
    }

    func testSample2() {
        let input = [1,1,3,6,7,10,7,1,8,5,9,1,4,4,3]
        let expected = 41
        XCTAssertEqual(s.rob(input), expected)
    }

    func testSample3() {
        let input = [0]
        let expected = 0
        XCTAssertEqual(s.rob(input), expected)
    }

    func testSample4() {
        let input = [4,1,2,7,5,3,1]
        let expected = 14
        XCTAssertEqual(s.rob(input), expected)
    }
}

Tests.defaultTestSuite.run()
