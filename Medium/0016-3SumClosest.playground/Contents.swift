// LeetCode: https://leetcode.com/problems/3sum-closest/description/
// Simple math

import XCTest

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var sorted = nums.sorted()
        var current: Int?
        for i in 0..<sorted.count {
            var start = i + 1
            var end = sorted.count - 1
            while start < end {
                let sum = sorted[i] + sorted[start] + sorted[end]
                if target == sum {
                    return sum
                }
                if let curVal = current {
                    if abs(target - sum) < abs(target - curVal) {
                        current = sum
                    }
                    if sum > target {
                        end -= 1
                    } else {
                        start += 1
                    }
                } else {
                    current = sum
                }
            }
        }
        return current!
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
