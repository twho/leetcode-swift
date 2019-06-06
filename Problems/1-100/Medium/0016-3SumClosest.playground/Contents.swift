// LeetCode: https://leetcode.com/problems/3sum-closest/description/
// Simple math

import XCTest

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return -1 }
        let sort = nums.sorted()
        var closest: Int?
        for idx in 0..<sort.count-2 {
            var start = idx + 1
            var end = sort.count-1
            while start < end {
                if sort[idx] + sort[start] + sort[end] == target {
                    return target
                }
                if closest == nil || abs(sort[idx] + sort[start] + sort[end] - target) < abs(closest! - target) {
                    closest = sort[idx] + sort[start] + sort[end]
                }
                
                if sort[idx] + sort[start] + sort[end] < target {
                    start += 1
                } else {
                    end -= 1
                }
            }
        }
        return closest!
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([-1, 2, 1, -4], 1)
        let expected = 2
        XCTAssertEqual(s.threeSumClosest(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = ([-3,-2,-5,3,-4], -1)
        let expected = -2
        XCTAssertEqual(s.threeSumClosest(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = ([0,2,1,-3], 1)
        let expected = 0
        XCTAssertEqual(s.threeSumClosest(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = ([1,1,-1,-1,3], -1)
        let expected = -1
        XCTAssertEqual(s.threeSumClosest(input.0, input.1), expected)
    }
    
    func testSample5() {
        let input = ([1,2,4,8,16,32,64,128], 82)
        let expected = 82
        XCTAssertEqual(s.threeSumClosest(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
