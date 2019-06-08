// LeetCode: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

import XCTest

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var output = [-1, -1]
        guard nums.count > 0 else { return output }
        
        if nums.count == 1 {
            return target == nums[0] ? [0, 0] : output
        }
        
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (start+end)/2
            if target == nums[mid] {
                output = [mid, mid]
                break
            } else if target < nums[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        while output[0] - 1 >= 0, nums[output[0] - 1] == target {
            output[0] -= 1
        }
        
        while output[1] + 1 < nums.count, nums[output[1] + 1] == target {
            output[1] += 1
        }
        
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()

    func testSample1() {
        let input = ([5,7,7,8,8,10], 8)
        let expected = [3, 4]
        XCTAssertEqual(expected, s.searchRange(input.0, input.1))
    }

    func testSample2() {
        let input = ([5,7,7,8,8,10], 6)
        let expected = [-1, -1]
        XCTAssertEqual(expected, s.searchRange(input.0, input.1))
    }
    
    func testSample3() {
        let input = ([1], 1)
        let expected = [0, 0]
        XCTAssertEqual(expected, s.searchRange(input.0, input.1))
    }
    
    func testSample4() {
        let input = ([1, 4], 4)
        let expected = [1, 1]
        XCTAssertEqual(expected, s.searchRange(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
