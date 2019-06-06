// LeetCode: https://leetcode.com/problems/maximum-product-subarray/description/

import XCTest

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var output = nums[0]
        var preMax = nums[0]
        var preMin = nums[0]
        
        for i in 1..<nums.count {
            let value = nums[i]
            let curMax = max(preMax * value, preMin * value, value)
            let curMin = min(preMax * value, preMin * value, value)
            output = max(output, curMax)
            preMax = curMax
            preMin = curMin
        }
        
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [2,3,-2,4]
        let expected = 6
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample2() {
        let input = [-2,0,-1]
        let expected = 0
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample3() {
        let input = [0, 2]
        let expected = 2
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample4() {
        let input = [-2,0]
        let expected = 0
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample5() {
        let input = [-2]
        let expected = -2
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample6() {
        let input = [-4,-3,-2]
        let expected = 12
        XCTAssertEqual(expected, s.maxProduct(input))
    }
    
    func testSample7() {
        let input = [2,-5,-2,-4,3]
        let expected = 24
        XCTAssertEqual(expected, s.maxProduct(input))
    }
}

Tests.defaultTestSuite.run()
