// LeetCode: https://leetcode.com/problems/house-robber/description/

import XCTest

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var output: [Int] = []
        for idx in 0..<nums.count {
            if idx-2 >= 0 {
                output.append(nums[idx] + Array(output[0...idx-2]).max()!)
            } else {
                output.append(nums[idx])
            }
        }
        return output.max()!
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,2,3,1]
        let expected = 4
        XCTAssertEqual(s.rob(input), expected)
    }
    
    func testSample2() {
        let input = [2,7,9,3,1]
        let expected = 12
        XCTAssertEqual(s.rob(input), expected)
    }
    
    func testSample3() {
        let input = [2,1,1,2]
        let expected = 4
        XCTAssertEqual(s.rob(input), expected)
    }
    
    func testSample4() {
        let input = [1,2]
        let expected = 2
        XCTAssertEqual(s.rob(input), expected)
    }
    
    func testSample5() {
        let input = [1,3,1]
        let expected = 3
        XCTAssertEqual(s.rob(input), expected)
    }
}

Tests.defaultTestSuite.run()
