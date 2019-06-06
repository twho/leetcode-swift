// LeetCode: https://leetcode.com/problems/first-missing-positive/description/

import XCTest

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var count = 1
        while true {
            if !nums.contains(count) {
                return count
            }
            count += 1
        }
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample1() {
        let input = [1,2,0]
        let expected = 3
        XCTAssertEqual(solution.firstMissingPositive(input), expected)
    }
    
    func testSample2() {
        let input = [3,4,-1,1]
        let expected = 2
            XCTAssertEqual(solution.firstMissingPositive(input), expected)
    }
    
    func testSample3() {
        let input = [7,8,9,11,12]
        let expected = 1
            XCTAssertEqual(solution.firstMissingPositive(input), expected)
    }
    
    func testSample4() {
        let input: [Int] = []
        let expected = 1
        XCTAssertEqual(solution.firstMissingPositive(input), expected)
    }
}

Tests.defaultTestSuite.run()
