// LeetCode: https://leetcode.com/problems/subsets/description/
// Difficulty: Medium

import XCTest

/**
 Design:
 
 For example: [1, 2, 3]
 
 Result by steps:
 loop 1:
    - []
 loop 2:
    - [] -> [1]
 loop 3:
    - []  -> [2]
    - [1] -> [1, 2]
 loop 4:
    - []     -> [3]
    - [1]    -> [1, 3]
    - [1, 2] -> [1, 2, 3]
 */
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var output: [[Int]] = [[]]
        subsets(&nums, &output)
        return output
    }
    
    private func subsets(_ nums: inout [Int], _ output: inout [[Int]]) {
        guard nums.count > 0 else {
            return
        }
        for i in 0..<output.count {
            var toAppend = output[i]
            toAppend.append(nums[0])
            output.append(toAppend)
        }
        nums.removeFirst()
        if nums.count > 0 {
            subsets(&nums, &output)
        }
    }
}

class Tests: XCTestCase {
    func testSample1() {
        var expected = [[3], [1], [2], [1,2,3], [1,3], [2,3], [1,2], []]
        let solution = Solution()
        let answer = solution.subsets([1, 2, 3])
        
        XCTAssertTrue(expected.count == answer.count)
        for i in answer {
            XCTAssertTrue(expected.index(of: i) != nil)
            if let index = expected.index(of: i) {
                expected.remove(at: index)
            }
        }
    }
}

Tests.defaultTestSuite.run()
