// LeetCode: https://leetcode.com/problems/container-with-most-water/description/
// Try to use O(n) runtime

import XCTest

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        var start = 0
        var end = height.count - 1
        while start < end {
            area = max(area, min(height[start], height[end]) * (end - start))
            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }
        return area
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample() {
        let intput = [1,8,6,2,5,4,8,3,7]
        let expected = 49
        XCTAssertEqual(solution.maxArea(intput), expected)
    }
}

Tests.defaultTestSuite.run()
