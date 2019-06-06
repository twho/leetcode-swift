// LeetCode: https://leetcode.com/problems/binary-search/description/

import XCTest

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var result = -1
        var left = 0
        var right = nums.count-1
        var mid = (left + right)/2
        while left <= right {
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                left = mid+1
                mid = (left + right)/2
            } else {
                right = mid-1
                mid = (left + right)/2
            }
        }
        return result
    }
}

class Tests: XCTestCase {
    let s = Solution()
    func testSample1() {
        let input = ([-1,0,3,5,9,12], 9)
        let expected = 4
        XCTAssertEqual(s.search(input.0, input.1), expected)
    }

    func testSample2() {
        let input = ([-1,0,3,5,9,12], 2)
        let expected = -1
        XCTAssertEqual(s.search(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = ([5], 5)
        let expected = 0
        XCTAssertEqual(s.search(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
