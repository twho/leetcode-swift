// LeetCode: https://leetcode.com/problems/house-robber-ii/description/

import XCTest

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        if nums.count < 3 {
            return nums.max()!
        }
        
        return max(getMaxVal(nums, 0, nums.count-2), getMaxVal(nums, 1, nums.count-1))
    }
    
    private func getMaxVal(_ nums:[Int], _ start: Int, _ end: Int) -> Int {
        var current = 0
        var prev = 0
        for i in start...end {
            let temp = prev
            prev = current
            current = max(current, nums[i]+temp)
        }
        return current
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
